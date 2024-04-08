import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:technical_template/app/screens/home/home_controller.dart';

class NavBar extends StatelessWidget {
  NavBar({required this.controller, super.key});

  final HomeController controller;

  final navBarKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: controller.selectedIndex.value == 0
                  ? Icon(Icons.home)
                  : Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: controller.selectedIndex.value == 1
                  ? Icon(Icons.star)
                  : Icon(Icons.star_border_outlined),
              label: 'Favoritos',
            ),
            BottomNavigationBarItem(
              icon: controller.selectedIndex.value == 2
                  ? Icon(
                      Icons.person,
                    )
                  : Icon(Icons.person_outline),
              label: 'Perfil',
            ),
          ],
          onTap: (index) {
            controller.updateIndex(index);
          },
          unselectedItemColor: Colors.deepPurple,
          selectedItemColor: Colors.deepPurple);
    });
  }
}
