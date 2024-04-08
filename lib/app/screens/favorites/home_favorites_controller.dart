import 'package:mobx/mobx.dart';
import 'package:technical_template/app/models/collection.dart';
import 'package:technical_template/injection_container.dart';
//import 'package:technical_template/app/models/collection.dart';
//import 'package:technical_template/app/screens/book/book_repository/book_repository_interface.dart';
//import 'package:technical_template/injection_container.dart';

part 'home_favorites_controller.g.dart';

class HomeFavoritesController = HomeFavoritesControllerBase
    with _$HomeFavoritesController;

abstract class HomeFavoritesControllerBase with Store {
  HomeFavoritesControllerBase();

  @observable
  Observable bookFavListCount = Observable(0);
  @observable
  Observable bookFavList = Observable<dynamic>([]);

  @action
  void getFavoriteBooks() {
    final bookList = sl.get<List<Collection>>();
    bookFavListCount.value = 0;
    bookFavList.value = [];

    var existBookFavCur =
        bookList[0].books.any((book) => book.isFavorite == true);
    if (existBookFavCur) {
      for (int i = 0; i < bookList[0].books.length; i++)
        if (bookList[0].books[i].isFavorite) {
          bookFavList.value.add([
            bookList[0].books[i].thumb,
            bookList[0].books[i].name,
            bookList[0].books[i],
          ]);
        }
    }
    var existBooksFavNew =
        bookList[1].books.any((book) => book.isFavorite == true);
    if (existBooksFavNew) {
      for (int i = 0; i < bookList[1].books.length; i++)
        if (bookList[1].books[i].isFavorite) {
          bookFavList.value.add([
            bookList[1].books[i].thumb,
            bookList[1].books[i].name,
            bookList[1].books[i],
          ]);
        }
    }
    bookFavListCount.value = bookFavList.value.length;
  }
}
