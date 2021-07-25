import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insta/app_screens/dmPage.dart';
import 'package:insta/app_screens/firstPage.dart';
import 'package:insta/app_screens/homeMainPage.dart';
import 'package:insta/app_screens/logIn.dart';
import 'package:insta/app_screens/signUp.dart';
// import 'package:insta/common/MyBottomNavBar.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){

    final _args = settings.arguments;

    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (context) => FirstPage());
      case '/sign-up':
        return MaterialPageRoute(builder: (context) => SignUp());
      case '/log-in':
        return MaterialPageRoute(builder: (context) => LogIn());
      case '/dms':
        return MaterialPageRoute(builder: (context) => DmPage());
      case '/home':
        if(_args is DocumentSnapshot) return MaterialPageRoute(builder: (context) => HomeMainPage(user: _args));
        else return MaterialPageRoute(builder: (context) => LogIn());
      default:
        return MaterialPageRoute(builder: (context) => LogIn());
    }
  }
}

