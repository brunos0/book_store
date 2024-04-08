import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technical_template/app/models/collection.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core functionalities
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton<List<Collection>>(() => [
        Collection.newCollection(),
        Collection.newCollection(),
      ]);
}
