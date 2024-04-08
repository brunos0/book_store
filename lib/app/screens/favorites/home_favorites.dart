import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:technical_template/app/screens/favorites/home_favorites_controller.dart';
import 'package:technical_template/utils/app_routes.dart';

class FavoritesBooks extends StatelessWidget {
  FavoritesBooks({super.key});

  final controller = HomeFavoritesController();

  @override
  Widget build(BuildContext context) {
    controller.getFavoriteBooks();

    return Observer(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: controller.bookFavListCount.value == 0
              ? const Center(
                  child: Text(
                  'Ainda não há nenhum livro favoritado...\nVá em frente e favorite algum livro!',
                  textAlign: TextAlign.center,
                ))
              : ListView.separated(
                  itemCount: controller.bookFavListCount.value,
                  separatorBuilder: (_, __) {
                    return const Divider();
                  },
                  itemBuilder: (_, index) {
                    return ListTile(
                      leading: Image.network(
                        controller.bookFavList.value[index][0],
                        fit: BoxFit.fitWidth,
                        scale: 1.0,
                        width: 110,
                        height: 160,
                      ),
                      title: Text(controller.bookFavList.value[index][1]),
                      onTap: () async {
                        await Navigator.of(context).pushNamed(
                            AppRoutes.bookDetails,
                            arguments: controller.bookFavList.value[index][2]);
                        controller.getFavoriteBooks();
                      },
                    );
                  },
                ),
        );
      },
    );
  }
}
