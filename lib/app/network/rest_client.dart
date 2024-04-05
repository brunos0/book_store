import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:technical_template/app/models/collection.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://65e755b953d564627a8e90d1.mockapi.io/api/v1')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/collections')
  Future<List<Collection>> getCollections();
}
