import 'package:technical_template/app/models/collection.dart';

abstract class IHomeRepository {
  Future<List<Collection>> getCollections();
}
