import 'package:mobx/mobx.dart';
import 'package:technical_template/app/models/collection.dart';
import 'package:technical_template/app/screens/home/interfaces/home_repository_interface.dart';

class HomeController with Store {
  final IHomeRepository repository;

  HomeController({required this.repository});

  @observable
  ObservableFuture<List<Collection>>? collectionResponse;

  @computed
  bool get collectionResponseHasResults =>
      collectionResponse != null &&
      collectionResponse?.status == FutureStatus.fulfilled &&
      collectionResponse?.result != null;

  @computed
  bool get collectionResponseIsLoading =>
      collectionResponse != null &&
      collectionResponse?.status == FutureStatus.pending;

  @computed
  bool get collectionResponseHasError =>
      collectionResponse != null &&
      collectionResponse?.status == FutureStatus.rejected;

  @action
  Future getCollections() async {
    try {
      collectionResponse = ObservableFuture(repository.getCollections());
    } catch (error) {
      collectionResponse = ObservableFuture.value([]);
    }
  }
}
