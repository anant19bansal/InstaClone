import 'package:flutter/material.dart';
import 'package:insta/common/InstaLogo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: getAppBar(),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: HomePosts(),
      ),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }






  AppBar getAppBar() {
    return AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
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
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.tv_rounded),
                ),
                GestureDetector(
                    onTap: () {print("arrow pressed");},
                    child: Icon(Icons.call_made),
                )
              ],
            ),
          ],
        ),
      );
  }
}


class HomePosts extends StatefulWidget {
  const HomePosts({ Key? key }) : super(key: key);

  @override
  _HomePostsState createState() => _HomePostsState();
}

class _HomePostsState extends State<HomePosts> {
  List<Widget> posts = [
    Post(
      authorname: 'Sylvie',
      postUrl: 'sylvie_post.png',
      subTitle: 'Lamantis 1',
      authorAvatar: 'Sylvie.jpg',
      caption: 'This is the custom caption This is the custom caption',
    ),
    Post(
      authorname: 'Wanda',
      postUrl: 'wanda_post.jpg',
      subTitle: 'Westview',
      authorAvatar: 'wanda.jpg',
      caption: 'This is the custom caption This is the custom caption',
    ),
    Post(
      authorname: 'Dr. Strange',
      postUrl: 'drStrange_post.jpg',
      subTitle: 'New York',
      authorAvatar: 'DrStrange.jpg',
      caption: 'This is the custom caption This is the custom caption',
    ),
    Post(
      authorname: 'Thor',
      postUrl: 'thor_post.jpg',
      subTitle: 'Asgard on Earth',
      authorAvatar: 'Thor.jpg',
      caption: 'This is the custom caption This is the custom caption',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Column(
      children: [
        SizedBox(
          height:100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              getStories('Loki.jpg', 'Your Story'),
              getStories('Sylvie.jpg', 'Sylvie'),
              getStories('Mobius.jpg', 'Mobius'),
              getStories('wanda.jpg', 'Wanda'),
              getStories('DrStrange.jpg', 'Dr. Strange'),
              getStories('Thor.jpg', 'Thor'),
              getStories('Danvers.jpg', 'Danvers'),
              getStories('Steve.jpg', 'Steve'),
              getStories('IronMan.jpg', 'Iron Man'),
            ],
          ),
        ),
        Divider(height: 3.0),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return posts[index];
          },
        )
      ],
  ),
    );
  }
}


class Post extends StatefulWidget {
  final String authorname;
  final String postUrl;
  final String subTitle;
  final String caption;
  final String authorAvatar;
  const Post({ Key? key , required this.authorname, required this.postUrl, this.subTitle="", this.caption="", required this.authorAvatar}) : super(key: key);

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  double letterSpace = 0.5;
  bool isLiked = false;
  var color = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: Column(
        children: [
          ListTile(
            visualDensity: VisualDensity(horizontal: -3,vertical: -3),
            leading: CircleAvatar(backgroundImage: AssetImage('assets/${widget.authorAvatar}'), radius: 22,),
            title: Text(widget.authorname, style: TextStyle(fontSize: 15,letterSpacing: letterSpace),),
            subtitle: Text(widget.subTitle, style: TextStyle(fontSize: 10,letterSpacing: letterSpace),),
          ),
          Container(
            // height: 300,
            // width: ,
            child: Image(
              fit: BoxFit.fill,
              image: AssetImage('assets/${widget.postUrl}'),
            ),

          ),
          Row(
            children: [
              IconButton(
                color: color,
                onPressed: () {
                  if (!isLiked) {
                    setState(() {
                      isLiked = true;
                      color = Colors.red;
                    });

                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.black,
                        duration: Duration(seconds: 1),
                        content: Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'You have liked the post',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                    );
                  }else{
                    setState(() {
                      isLiked = false;
                      color = Colors.white;
                    });
                  }
                }, 
                icon: Icon(Icons.favorite),

                iconSize:27,
                padding: EdgeInsets.fromLTRB(15, 7, 7, 0),
                constraints: BoxConstraints(),),
              IconButton(
                onPressed: () {}, 
                icon: Icon(Icons.message_outlined), 
                iconSize:27,
                padding: EdgeInsets.fromLTRB(7, 7, 5, 0),
                constraints: BoxConstraints(),),
              IconButton(
                onPressed: () {}, 
                icon: Icon(Icons.call_made),
                iconSize:27,
                padding: EdgeInsets.fromLTRB(7, 7, 5, 0),
                constraints: BoxConstraints(),),
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(15, 15, 15, 15),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Text('${widget.authorname} ${widget.caption}',
                        style:TextStyle(height: 1.4)
                      ),
                    ),
                    // SizedBox(width: 5,),
                    // Expanded(child: Text('This is the custom caption This is the custom caption',)),
                  ],
                )
              ],
            ),
          ),
          Divider(height: 5,),
        ],
      ),
    );
  }
}

Widget getStories(String imgPath, String author){
  return Container(
    child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
                  padding: EdgeInsets.all(3),
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.red, width: 3),
                  ),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/$imgPath'),
                  ),
                ),
                Text(
                  author,
                  style: TextStyle(fontSize: 10,letterSpacing:0.5),
                ),
              ],
            ),
  );
}


class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({ Key? key }) : super(key: key);

  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int ind = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      // backgroundColor: Colors.black,
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
    );
  }
}
