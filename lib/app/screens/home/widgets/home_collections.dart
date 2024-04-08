import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technical_template/app/network/home_client.dart';
import 'package:technical_template/app/screens/home/home_controller.dart';
import 'package:technical_template/app/screens/home/home_repository/home_repository.dart';
import 'package:technical_template/app/screens/home/widgets/collection_list_widget.dart';
import 'package:technical_template/injection_container.dart';

class HomePageCollections extends StatefulWidget {
  @override
  _HomePageCollectionsState createState() => _HomePageCollectionsState();
}

class _HomePageCollectionsState extends State<HomePageCollections> {
  HomeController controller = HomeController(
    repository: HomeRepository(
      restClient: HomeClient(Dio()),
    ),
  );

  @override
  void initState() {
    super.initState();
    final SharedPreferences prefs = sl.get<SharedPreferences>();
    if (prefs.getStringList('favBooks') == null) {
      prefs.setStringList('favBooks', <String>[]);
    }
    controller.getCollections();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (controller.collectionResponseIsLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (controller.collectionResponseHasResults) {
          return CollectionListWidget(
            list: controller.collectionResponse.value,
          );
        }

        if (controller.collectionResponseHasError) {
          return Center(
            child: Text('Erro...'),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
