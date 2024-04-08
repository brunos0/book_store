import 'package:technical_template/app/models/collection.dart';
import 'package:technical_template/app/network/home_client.dart';
import 'package:technical_template/app/screens/home/home_repository/home_repository_interface.dart';

class HomeRepository implements IHomeRepository {
  final HomeClient restClient;

  HomeRepository({required this.restClient});
  @override
  Future<List<Collection>> getCollections() async {
    return restClient.getCollections();
  }
}
