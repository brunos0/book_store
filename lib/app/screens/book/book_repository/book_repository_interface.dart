import 'package:technical_template/app/models/book_details_complement.dart';

abstract class IBookRepository {
  Future<BookDetailsComplement> getDetails(String name_author);
}
