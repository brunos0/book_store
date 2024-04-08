import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:technical_template/app/network/home_client.dart';
import 'package:technical_template/app/screens/favorites/home_favorites.dart';
import 'package:technical_template/app/screens/home/widgets/home_collections.dart';
import 'package:technical_template/app/screens/home/home_controller.dart';
import 'package:technical_template/app/screens/home/home_repository/home_repository.dart';
import 'package:technical_template/app/screens/home/widgets/home_navbar.dart';
import 'package:technical_template/app/screens/profile/profile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = HomeController(
    repository: HomeRepository(
      restClient: HomeClient(Dio()),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text(
            'Coleções',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SafeArea(
          child: Observer(
            builder: (_) {
              if (controller.selectedIndex.value == 0) {
                return HomePageCollections();
              }
              if (controller.selectedIndex.value == 1) {
                return FavoritesBooks();
              }
              return ProfileDisplay();
            },
          ),
        ),
        bottomNavigationBar: NavBar(controller: controller)
        //drawer: const AppDrawer(),
        );
  }
}
