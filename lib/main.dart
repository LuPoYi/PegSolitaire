import 'package:PegSolitaire/pegSolitaire.dart';
import 'package:flutter/material.dart';
import 'pegSolitaire.dart';
import 'login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    'PegSolitaire': (context) => PegSolitaire(),
    'Login': (context) => Login(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Go',
        theme: new ThemeData(
          primaryColor: Color.fromRGBO(58, 66, 222, 1.0),
        ),
        home: Login(),
        routes: routes);
  }
}
