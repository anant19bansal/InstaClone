import 'package:flutter/material.dart';

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
          children: [
            SearchBar(),
            // ListView()
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
    return Expanded(
        child: Container(
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
    ));
  }
}

class DmList extends StatefulWidget {
  const DmList({ Key? key }) : super(key: key);

  @override
  _DmListState createState() => _DmListState();
}

class _DmListState extends State<DmList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(),
    );
  }
}
