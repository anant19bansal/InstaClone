import 'package:flutter/material.dart';
import 'package:insta/app_screens/firstPage.dart';
import 'package:insta/app_screens/logIn.dart';
import 'package:insta/app_screens/signUp.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (context) => FirstPage());
      case '/sign-up':
        return MaterialPageRoute(builder: (context) => SignUp());
      case '/log-in':
        return MaterialPageRoute(builder: (context) => LogIn());
      default:
        return MaterialPageRoute(builder: (context) => LogIn());
    }
  }
}

