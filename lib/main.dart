import 'package:flutter/material.dart';
import 'package:insta/route_generator.dart';
import 'app_screens/firstPage.dart';
import 'app_screens/signUp.dart';
import 'app_screens/logIn.dart';

void main() => runApp(Root());

class Root extends StatelessWidget {
  const Root({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: LogIn(),
      theme: ThemeData.dark(),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
