import 'package:flutter/material.dart';
import 'package:insta/common/CustomCircularAvatar.dart';

class DmPage extends StatefulWidget {
  final String userName;
  const DmPage({Key? key, required this.userName}) : super(key: key);

  @override
  _DmPageState createState() => _DmPageState();
}

class _DmPageState extends State<DmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios_new),
            ),
            Row(
              children: [
                Text(widget.userName),
                GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.keyboard_arrow_down),
                ),
              ],
            ),
            GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.add_sharp,
                  size: 30,
                ))
          ],
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SearchBar(),
            // ListView()
            DmList(),
            DmList(),
            DmList(),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextField(
    style: TextStyle(
      fontSize: 23,
    ),
    cursorColor: Colors.white,
    cursorWidth: 0.5,
    cursorHeight: 25,
    decoration: InputDecoration(
      prefixIcon: Icon(
        Icons.search,
        size: 28,
      ),
      filled: true,
      fillColor: Colors.grey[800],
      hintText: 'Search',
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
      ),
    ),
      ),
    );
  }
}

class DmList extends StatefulWidget {
  // final bool storyRing;
  // final bool storySeen;
  // final String imgPath;
  // final double radius;
  // final EdgeInsetsGeometry? margin;
  // final String title;
  // final String lastMessage;
  // final String time;
  const DmList({ Key? key}) : super(key: key);

  @override
  _DmListState createState() => _DmListState();
}

class _DmListState extends State<DmList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(8,0,0,0),
      height: 80,
      // color: Colors.indigo,
      child: Row(
        children: [
          CustomCircularAvatar(imgPath: 'Danvers.jpg', storyRing: true, storySeen: true, margin: EdgeInsets.fromLTRB(1,0,6,0),),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0,0,0,5),
                  color: Colors.black,
                  child: Text("Danvers"),
                ),
                Container(
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          "See you soon buddy",
                          style: TextStyle(
                            color: Colors.grey,
                          ),  
                        ),
                      ),
                      Container(
                        child: Text(
                          '. now',
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

          Container(
            color: Colors.black,
            padding: EdgeInsets.fromLTRB(15,0,10,0),
            child: Icon(Icons.camera_alt_outlined, size: 30, color: Colors.grey,),
          )

        ],
      ),
    );
  }
}
