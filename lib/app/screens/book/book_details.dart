import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:technical_template/app/models/books.dart';
import 'package:technical_template/app/models/collection.dart';
import 'package:technical_template/app/network/book_client.dart';
import 'package:technical_template/app/screens/book/book_controller.dart';
import 'package:technical_template/app/screens/book/book_repository/book_repository.dart';
import 'package:technical_template/injection_container.dart';

class BookDetails extends StatefulWidget {
  const BookDetails({super.key});

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  BookController controller = BookController(
    repository: BookRepository(
      restClient: BookClient(Dio()),
    ),
  );

  late final Book book;
  int listIndex = 0;
  int index = 0;
  bool isNotFavorite = false;

  @override
  Widget build(BuildContext context) {
    final book = ModalRoute.of(context)!.settings.arguments as Book;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          book.name,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Observer(builder: (_) {
        if (controller.collectionResponseIsLoading) {
          index = sl
              .get<List<Collection>>()[0]
              .books
              .indexWhere((element) => element.name == book.name);
          listIndex = 0;
          if (index == -1) {
            index = sl
                .get<List<Collection>>()[1]
                .books
                .indexWhere((element) => element.name == book.name);
            listIndex = 1;
          }

          if (index >= 0) {
            controller.getDetails(listIndex, index, book.name, book.author);
          }

          return Center(child: CircularProgressIndicator());
        }

        if (controller.collectionResponseHasResults) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const Gap(30),
                Center(
                  child: Container(
                    height: size.height * 0.5,
                    width: size.width * 0.55,
                    child: Image.network(
                      book.thumb,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Text(
                  book.name,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                Text(
                  'Autor(a): ${book.author}',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Ano de lançamento: ${book.releaseYear}',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Páginas: ${book.pages}',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Visibility(
                  visible: !controller.collectionResponseHasError,
                  child: Column(
                    children: [
                      Text(
                        'ISBN: ${book.isbn}',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const Gap(20),
                      Text(
                        'Sinopse',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 30,
                          right: 30,
                        ),
                        child: Text(
                          book.review,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(30),
                Container(
                  width: 160,
                  child: ElevatedButton(
                    onPressed: () {
                      sl
                          .get<List<Collection>>()[listIndex]
                          .books[index]
                          .toggleFavorite();
                      controller.toggleFavorite();
                    },
                    child: Row(
                      children: [
                        Icon(controller.favorite.value
                            ? Icons.favorite
                            : Icons.favorite_outline),
                        const Gap(10),
                        Text(controller.favorite.value
                            ? 'Desfavoritar'
                            : 'Favoritar')
                      ],
                    ),
                  ),
                ),
                const Gap(30),
              ],
            ),
          );
        }
        return SizedBox.shrink();
      }),
    );
  }
}
