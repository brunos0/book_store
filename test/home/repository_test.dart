import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:technical_template/app/models/collection.dart';
import 'package:technical_template/app/network/rest_client.dart';
import 'package:technical_template/app/screens/home/home_repository.dart';
import 'package:technical_template/app/screens/home/interfaces/home_repository_interface.dart';

import 'repository_test.mocks.dart';

@GenerateMocks([RestClient])
void main() {
  late RestClient mockedClient;
  late IHomeRepository repository;
  setUp(() {
    mockedClient = MockRestClient();
    repository = HomeRepository(restClient: mockedClient);
  });

  group('requests tests', () {
    test(
        'when fetch collection with success should return a list of collections',
        () async {
      final mockedCollections =
          List.generate(2, (index) => Collection.mock('$index'));
      when(mockedClient.getCollections())
          .thenAnswer((_) async => mockedCollections);

      final actual = await repository.getCollections();
      expect(actual, equals(mockedCollections));
    });

    test('when fetch collection has error expects throw an exception',
        () async {
      when(mockedClient.getCollections()).thenAnswer((_) => throw Exception());
      expect(() => repository.getCollections(), throwsException);
    });
  });
}
