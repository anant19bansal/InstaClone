import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insta/app_screens/ProfilePage.dart';
import 'package:insta/app_screens/homeScreen.dart';
import 'package:insta/app_screens/searchPage.dart';

class HomeMainPage extends StatefulWidget {
  final DocumentSnapshot user;
  const HomeMainPage({required this.user});

  @override
  _HomeMainPageState createState() => _HomeMainPageState(user);
}

class _HomeMainPageState extends State<HomeMainPage> {
  DocumentSnapshot user;
  _HomeMainPageState(this.user);
  
  PageController _pageController = PageController();
  int _currentIndex = 0;

  

  _onPageChanged(int index){
    setState(() {
      _currentIndex = index;
    });
  }
  
  _onTapBottomNavIcon(int selectedIndex){
    _pageController.jumpToPage(selectedIndex);
  }
  
  @override
  Widget build(BuildContext context) {

    List<Widget> _screens = [
      HomePage(), 
      SearchPage(),  
      Scaffold(appBar: AppBar(title: Text('To be Made'),),), 
      Scaffold(appBar: AppBar(title: Text('To be Made'),),), 
      ProfilePage(user: this.user),
    ];

    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _screens,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTapBottomNavIcon,
        backgroundColor: Colors.grey[900],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
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
            label: 'Search', 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile', 
          ),
        ],
      ),
      
    );
  }
}