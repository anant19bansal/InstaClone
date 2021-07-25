import 'package:flutter/material.dart';
import 'package:insta/common/CustomCircularAvatar.dart';
import 'package:insta/common/InstaLogo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBarHomePage(context),
      body: Container(
        color: Colors.black,
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: HomePosts(),
        ),
      ),
    );
  }

  
}

class AppBarHomePage extends AppBar {
    AppBarHomePage(context) : super(
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
                    onTap: () {
                      Navigator.pushNamed(context, '/dms');
                    },
                    child: Icon(Icons.call_made),
                )
              ],
            ),
          ],
        ),
        
      );
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
              getStories(imgPath: 'Loki.jpg', author:'Your Story', storyRing: true, storySeen: false),
              getStories(imgPath: 'Sylvie.jpg', author:'Sylvie', storyRing: true, storySeen: false),
              getStories(imgPath: 'Mobius.jpg', author:'Mobius', storyRing: true, storySeen: false),
              getStories(imgPath: 'wanda.jpg', author:'Wanda', storyRing: true, storySeen: false),
              getStories(imgPath: 'DrStrange.jpg', author:'Dr. Strange', storyRing: true, storySeen: false),
              getStories(imgPath: 'Thor.jpg', author:'Thor', storyRing: true, storySeen: true),
              getStories(imgPath: 'Danvers.jpg', author:'Danvers', storyRing: true, storySeen: true),
              getStories(imgPath: 'Steve.jpg', author:'Steve', storyRing: true, storySeen: true),
              getStories(imgPath: 'IronMan.jpg', author:'Iron Man', storyRing: true, storySeen: true),
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
        ),
      ],
  ),
    );
  }
}

Widget getStories({required String imgPath, required String author, required bool storyRing, bool storySeen = false, double radius=35}){
  EdgeInsetsGeometry? margin=EdgeInsets.fromLTRB(10, 0, 10, 5);
  return Container(
    child: Column(
              children: [
                CustomCircularAvatar(storyRing: storyRing, storySeen:storySeen, imgPath: imgPath, radius:radius, margin:margin),
                Text(
                  author,
                  style: TextStyle(fontSize: 10,letterSpacing:0.5),
                ),
              ],
            ),
  );
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
      child: Column(
        children: [
          ListTile(
            visualDensity: VisualDensity(horizontal: -3,vertical: -3),
            leading: CustomCircularAvatar(
              imgPath:'${widget.authorAvatar}', 
              storyRing: false,
              radius: 22,
            ),
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

