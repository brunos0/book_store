import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:technical_template/app/network/rest_client.dart';
import 'package:technical_template/app/screens/home/home_controller.dart';
import 'package:technical_template/app/screens/home/home_repository.dart';
import 'package:technical_template/app/screens/home/widgets/collection_list_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = HomeController(
    repository: HomeRepository(
      restClient: RestClient(Dio()),
    ),
  );

  @override
  void initState() {
    super.initState();
    controller.getCollections();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Coleções'),
      ),
      body: SafeArea(
        child: Observer(
          builder: (_) {
            if (controller.collectionResponseIsLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (controller.collectionResponseHasResults) {
              return CollectionListWidget(
                list: controller.collectionResponse?.value ?? [],
              );
            }

            if (controller.collectionResponseHasError) {
              return Center(
                child: Text('Erro...'),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
