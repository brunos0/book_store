import 'package:flutter/material.dart';
import 'package:technical_template/utils/routes.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gap Cabeceira',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes().initialRoute,
      routes: Routes().routes,
    );
  }
}
