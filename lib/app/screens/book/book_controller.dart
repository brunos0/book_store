import 'package:mobx/mobx.dart';
import 'package:technical_template/app/models/collection.dart';
import 'package:technical_template/app/screens/book/book_repository/book_repository_interface.dart';
import 'package:technical_template/injection_container.dart';

part 'book_controller.g.dart';

class BookController = BookControllerBase with _$BookController;

abstract class BookControllerBase with Store {
  BookControllerBase({required this.repository});

  final IBookRepository repository;

  @observable
  Observable favorite = Observable(false);

  @observable
  Observable loadingError = Observable(false);

  @observable
  Observable loaded = Observable(false);

  @computed
  bool get collectionResponseHasResults => loaded.value;

  @computed
  bool get collectionResponseIsLoading => !loaded.value;

  @computed
  bool get collectionResponseHasError => loadingError.value;

  @action
  Future getDetails(
      int listIndex, int index, String book_name, String author) async {
    final book = sl.get<List<Collection>>()[listIndex].books[index];
    favorite.value = book.isFavorite;
    if (book.review.isNotEmpty) {
      loaded.value = true;
      return;
    }

    loadingError.value = false;
    loaded.value = false;

    try {
      final name_author = book_name.trim() + '+inauthor:' + author.trim();

      final result = await repository.getDetails(name_author);
      sl.get<List<Collection>>()[listIndex].books[index].review = result.review;
      sl.get<List<Collection>>()[listIndex].books[index].isbn = result.isbn;
      loaded.value = true;
    } catch (error) {
      print(error);
      loadingError.value = true;
      loaded.value = true;
    }
  }

  @action
  void toggleFavorite() {
    favorite.value = !favorite.value;
  }
}
