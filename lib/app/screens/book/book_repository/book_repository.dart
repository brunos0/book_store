import 'package:technical_template/app/models/book_details_complement.dart';
import 'package:technical_template/app/network/book_client.dart';
import 'package:technical_template/app/screens/book/book_repository/book_repository_interface.dart';

String get apiKeyBook => const String.fromEnvironment('API_KEY_BOOK');

class BookRepository implements IBookRepository {
  final BookClient restClient;

  BookRepository({required this.restClient});
  @override
  Future<BookDetailsComplement> getDetails(String name_author) async {
    return restClient.getDetails(name_author, apiKeyBook);
  }
}
