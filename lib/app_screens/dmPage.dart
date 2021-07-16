import 'package:flutter/material.dart';
import 'package:insta/common/CustomCircularAvatar.dart';

class DmPage extends StatefulWidget {
  final String userName;
  const DmPage({Key? key, required this.userName}) : super(key: key);

  @override
  _DmPageState createState() => _DmPageState();
}

class _DmPageState extends State<DmPage> {
  List<Widget> dmList = [
    DmList(imgPath:'Danvers.jpg', storySeen: true, name: 'Danvers', lastMessage: 'see you soon..', time: 'now', storyRing: true,),
    DmList(imgPath:'Thor.jpg', storySeen: false, name: 'Thor', lastMessage: 'see you soon..', time: 'now', storyRing: true,),
    DmList(imgPath:'Mobius.jpg', storySeen: false, name: 'Mobius', lastMessage: 'see you soon..', time: '1m', storyRing: true,),
    DmList(imgPath:'DrStrange.jpg', storySeen: true, name: 'Dr. Strange', lastMessage: 'see you soon..', time: '2m', storyRing: false,),
    DmList(imgPath:'Sylvie.jpg', storySeen: true, name: 'Sylvie', lastMessage: 'see you soon..', time: '5m', storyRing: true,),
    DmList(imgPath:'wanda.jpg', storySeen: false, name: 'Wanda', lastMessage: 'see you soon..', time: '10m', storyRing: true,),
    DmList(imgPath:'Steve.jpg', storySeen: false, name: 'Steve', lastMessage: 'see you soon..', time: '15m', storyRing: true,),
    DmList(imgPath:'IronMan.jpg', storySeen: false, name: 'IronMan', lastMessage: 'see you soon..', time: '1h', storyRing: true,),
    DmList(imgPath:'Loki.jpg', storySeen: false, name: 'President Loki', lastMessage: 'see you soon..', time: '3h', storyRing: true,),
  ];
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
            Expanded(
              child: ListView.builder(
                // physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                // shrinkWrap: true,
                itemCount: dmList.length,
                itemBuilder: (context, index) {
                  return dmList[index];
                },
              ),
            ),
            
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
      fontSize: 20,
    ),
    cursorColor: Colors.white,
    cursorWidth: 0.5,
    cursorHeight: 23,
    decoration: InputDecoration(
      prefixIcon: Icon(
        Icons.search,
        size: 25,
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
  final bool storyRing;
  final bool storySeen;
  final String imgPath;
  final String name;
  final String lastMessage;
  final String time;
  const DmList({ Key? key,
    required this.imgPath,
    required this.storyRing,
    this.storySeen=false,
    required this.name,
    required this.lastMessage,
    required this.time,
  }) : super(key: key);

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
          CustomCircularAvatar(
            imgPath: widget.imgPath,
            storyRing: widget.storyRing, 
            storySeen: widget.storySeen, 
            margin: (widget.storyRing)?EdgeInsets.fromLTRB(1,0,6,0):EdgeInsets.fromLTRB(6,0,12,0),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0,0,0,5),
                  color: Colors.black,
                  child: Text(widget.name),
                ),
                Container(
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          widget.lastMessage,
                          style: TextStyle(
                            color: Colors.grey,
                          ),  
                        ),
                      ),
                      Container(
                        child: Text(
                          '. ${widget.time}',
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
