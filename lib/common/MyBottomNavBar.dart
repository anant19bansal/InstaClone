import 'package:flutter/material.dart';
import 'package:insta/app_bars/AppBarHomePage.dart';
import 'package:insta/app_bars/AppBarSearchPage.dart';
import 'package:insta/app_screens/homeScreen.dart';
import 'package:insta/app_screens/searchPage.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({ Key? key }) : super(key: key);

  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int ind = 0;
  List<Widget> pageList = [HomePage(), SearchPage()];
  List appBarList = [AppBarHomePage(), AppBarSearchPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarList[ind],
      body: pageList[ind],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: ind,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: 'Add Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Home',
          )
        ],
        onTap: (index){
          setState(() {
            ind = index;
          });
        },
      ),
    );
  }
}