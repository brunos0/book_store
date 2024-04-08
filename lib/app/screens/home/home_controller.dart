import 'package:mobx/mobx.dart';
import 'package:technical_template/app/models/collection.dart';
import 'package:technical_template/app/screens/home/home_repository/home_repository_interface.dart';
import 'package:technical_template/injection_container.dart' as di;

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  HomeControllerBase({required this.repository});

  final IHomeRepository repository;

  @observable
  Observable<List<Collection>> collectionResponse =
      Observable(di.sl.get<List<Collection>>());

  @observable
  Observable selectedIndex = Observable(0);

  @observable
  Observable loadingError = Observable(false);

  @computed
  bool get collectionResponseHasResults =>
      collectionResponse.value[0].books.isNotEmpty;

  @computed
  bool get collectionResponseIsLoading =>
      collectionResponse.value[0].books.isEmpty;

  @computed
  bool get collectionResponseHasError => loadingError.value;

  @action
  Future getCollections() async {
    if (collectionResponse.value[0].books.isNotEmpty) {
      return;
    }
    loadingError.value = false;
    try {
      collectionResponse.value = await repository.getCollections();
      di.sl.get<List<Collection>>()[0].books =
          collectionResponse.value[0].books;
      di.sl.get<List<Collection>>()[1].books =
          collectionResponse.value[1].books;
    } catch (error) {
      loadingError.value = true;
    }
  }

  @action
  void updateIndex(int index) {
    selectedIndex.value = index;
  }
}
