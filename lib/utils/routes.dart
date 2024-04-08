import 'package:flutter/material.dart';
//import 'package:pocketpedia/pages/intro.dart';
import 'package:technical_template/app/screens/book/book_details.dart';
import 'package:technical_template/app/screens/home/home_page.dart';

import 'package:technical_template/utils/app_routes.dart';

class Routes {
  final Map<String, Widget Function(BuildContext)> routesMap = {
    //AppRoutes.intro: (ctx) => const Intro(),
    AppRoutes.homePage: (ctx) => HomePage(),
    AppRoutes.bookDetails: (ctx) => const BookDetails(),
  };
  get routes {
    return routesMap;
  }

  get initialRoute {
    //return AppRoutes.intro;
    return AppRoutes.homePage;
  }
}
