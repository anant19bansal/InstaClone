import 'package:flutter/material.dart';
import 'package:insta/common/InstaLogo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: () {},
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(), 
              icon: Icon(Icons.camera_alt_outlined),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: InstaLogo(logoHeight: 30),
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(onPressed: () {},
                  icon: Icon(Icons.tv_rounded),
                ),
                IconButton(onPressed: () {},
                padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
                  icon: Icon(Icons.arrow_forward_ios_outlined)
                ),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}