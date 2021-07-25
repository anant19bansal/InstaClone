import 'package:flutter/material.dart';
import 'package:insta/common/CustomCircularAvatar.dart';
import 'package:insta/common/SearchBar.dart';

class DmPage extends StatefulWidget {
  const DmPage({Key? key}) : super(key: key);

  @override
  _DmPageState createState() => _DmPageState();
}

class _DmPageState extends State<DmPage> {
  String userName = 'Loki';
  List<Widget> dmList = [
    DmList(isNetworkImage: false, imgPath:'Danvers.jpg', storySeen: true, name: 'Danvers', lastMessage: 'see you soon..', time: 'now', storyRing: true,),
    DmList(isNetworkImage: false, imgPath:'Thor.jpg', storySeen: false, name: 'Thor', lastMessage: 'see you soon..', time: 'now', storyRing: true,),
    DmList(isNetworkImage: false, imgPath:'Mobius.jpg', storySeen: false, name: 'Mobius', lastMessage: 'see you soon..', time: '1m', storyRing: true,),
    DmList(isNetworkImage: false, imgPath:'DrStrange.jpg', storySeen: true, name: 'Dr. Strange', lastMessage: 'see you soon..', time: '2m', storyRing: false,),
    DmList(isNetworkImage: false, imgPath:'Sylvie.jpg', storySeen: true, name: 'Sylvie', lastMessage: 'see you soon..', time: '5m', storyRing: true,),
    DmList(isNetworkImage: false, imgPath:'wanda.jpg', storySeen: false, name: 'Wanda', lastMessage: 'see you soon..', time: '10m', storyRing: true,),
    DmList(isNetworkImage: false, imgPath:'Steve.jpg', storySeen: false, name: 'Steve', lastMessage: 'see you soon..', time: '15m', storyRing: true,),
    DmList(isNetworkImage: false, imgPath:'IronMan.jpg', storySeen: false, name: 'IronMan', lastMessage: 'see you soon..', time: '1h', storyRing: true,),
    DmList(isNetworkImage: false, imgPath:'Loki.jpg', storySeen: false, name: 'President Loki', lastMessage: 'see you soon..', time: '3h', storyRing: true,),
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
                Text(userName),
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
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[900],
        child: GestureDetector(
          onTap: () {
            print('Camera clicked');
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.camera_alt_rounded, 
                  size: 25,
                  color: Colors.blue[300],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(5, 0 ,0, 0),
                  child: Text(
                    'Camera',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue[300],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}



class DmList extends StatefulWidget {
  final bool isNetworkImage;
  final bool storyRing;
  final bool storySeen;
  final String imgPath;
  final String name;
  final String lastMessage;
  final String time;
  const DmList({ Key? key,
    required this.isNetworkImage,
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
            isNetworkImage: widget.isNetworkImage,
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
