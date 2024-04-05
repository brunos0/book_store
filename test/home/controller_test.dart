import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:technical_template/app/models/collection.dart';
import 'package:technical_template/app/screens/home/home_controller.dart';
import 'package:technical_template/app/screens/home/interfaces/home_repository_interface.dart';

import 'controller_test.mocks.dart';

@GenerateMocks([IHomeRepository])
late IHomeRepository mockedRepository;
late HomeController controller;
void main() {
  setUp(() {
    mockedRepository = MockIHomeRepository();
    controller = HomeController(repository: mockedRepository);
  });

  group('requests tests', () {
    test(
        'when fetch collection with success should return a list of collections',
        () async {
      final mockedCollections =
          List.generate(2, (index) => Collection.mock('$index'));
      when(mockedRepository.getCollections())
          .thenAnswer((_) async => mockedCollections);

      controller.getCollections();

      expect(controller.collectionResponseIsLoading, isTrue);
      expect(controller.collectionResponseHasError, isFalse);
      expect(controller.collectionResponseHasResults, isFalse);

      await controller.collectionResponse;

      expect(controller.collectionResponseIsLoading, isFalse);
      expect(controller.collectionResponseHasError, isFalse);
      expect(controller.collectionResponseHasResults, isTrue);
      expect(controller.collectionResponse?.value, equals(mockedCollections));
    });

    test('when fetch collection fails, collectionResponse should be empty',
        () async {
      when(mockedRepository.getCollections())
          .thenAnswer((_) => throw Exception());

      await controller.getCollections();

      expect(controller.collectionResponseIsLoading, isFalse);
      expect(controller.collectionResponseHasError, isFalse);
      expect(controller.collectionResponseHasResults, isTrue);
      expect(controller.collectionResponse?.value, isEmpty);
    });
  });
}
