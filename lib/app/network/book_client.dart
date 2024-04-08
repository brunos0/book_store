import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:technical_template/app/models/book_details_complement.dart';

part 'book_client.g.dart';

@RestApi(baseUrl: 'https://www.googleapis.com/books/v1/volumes')
abstract class BookClient {
  factory BookClient(Dio dio, {String baseUrl}) = _BookClient;

  @GET('')
  Future<BookDetailsComplement> getDetails(
    @Query('q') String param1,
    @Query('key') String param2,
  );
}
