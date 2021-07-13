import 'package:flutter/material.dart';
import 'package:insta/app_screens/homeScreen.dart';
import 'package:insta/app_screens/searchPage.dart';
import 'package:insta/common/MyBottomNavBar.dart';
import 'package:insta/route_generator.dart';
// import 'app_screens/firstPage.dart';
// import 'app_screens/signUp.dart';
// import 'app_screens/logIn.dart';

void main() => runApp(Root());

class Root extends StatelessWidget {
  const Root({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      // home: SearchPage(),
      home:MyBottomNavBar(),
      theme: ThemeData.dark(),
      // initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
