import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta/common/CustomCircularAvatar.dart';
import 'package:insta/common/InstaLogo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  List posts = [];
  bool _pageInitialized = false;
  String userImage='';

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() { 
    super.initState();
    initialize();
  }

  initialize() async{
    try {
      var result = await FirebaseFirestore.instance.collection('posts').orderBy('created_at', descending: true).get();
      result.docs.forEach((element) { 
        posts.add(element);
      });
      final _userId = await FirebaseAuth.instance.currentUser!.uid;
      final _userImage = await FirebaseFirestore.instance.collection('users').doc(_userId).get();
      setState(() {
        userImage = _userImage['profile-pic'];
        _pageInitialized = true;
      });
      // print(posts);  
    } catch (e) {
      print('Error in initialize function in homescreen page&**************: $e');
    }
    
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return (_pageInitialized)? Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBarHomePage(context),
      body: Container(
        color: Colors.black,
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: HomePosts(posts, userImage: userImage),
        ),
      ),
    )
    :
    Center(child: SizedBox(height: 36, width: 36, child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),),),);
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
                      Navigator.of(context).pushNamed('/dms');
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
  final List posts;
  final userImage;
  const HomePosts(this.posts, {required this.userImage, Key? key }) : super(key: key);

  @override
  _HomePostsState createState() => _HomePostsState();
}

class _HomePostsState extends State<HomePosts> {
  
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
              getStories(imgPath: widget.userImage, author:'Your Story', storyRing: true, storySeen: false),
              getStories(imgPath: 'https://i0.wp.com/mtcritics.com/wp-content/uploads/2021/07/Sophia-Di-Martino-Reveals-The-Difficulty-She-Faced-In-Loki.png?fit=700%2C525&ssl=1', author:'Sylvie', storyRing: true, storySeen: false),
              getStories(imgPath: 'https://am22.mediaite.com/tms/cnt/uploads/2021/06/Loki-and-Mobius.jpg', author:'Mobius', storyRing: true, storySeen: false),
              getStories(imgPath: 'https://i.insider.com/60491083f196be0018bee9db?width=750&format=jpeg&auto=webp', author:'Wanda', storyRing: true, storySeen: false),
              getStories(imgPath: 'https://cdn.vox-cdn.com/thumbor/8w6m6Sdl8fkNt7UWPJr5hhNasqA=/0x0:1500x750/1400x1400/filters:focal(762x94:1002x334):format(jpeg)/cdn.vox-cdn.com/uploads/chorus_image/image/51717777/strange.0.jpg', author:'Dr. Strange', storyRing: true, storySeen: false),
              getStories(imgPath: 'https://images.hindustantimes.com/rf/image_size_630x354/HT/p2/2019/04/17/Pictures/_b4fc009c-60e8-11e9-a01d-452d93af50a1.jpg', author:'Thor', storyRing: true, storySeen: true),
              getStories(imgPath: 'https://wallpaperaccess.com/full/2155536.jpg', author:'Danvers', storyRing: true, storySeen: true),
              getStories(imgPath: 'https://qph.fs.quoracdn.net/main-qimg-ed6a2986e8560446cef20a5e0ce5e102', author:'Steve', storyRing: true, storySeen: true),
              getStories(imgPath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPX1alugCyZ11C9z6dL3FhIBzdUc8kdj8aYbPX3NZAHiBHUNudwXQT0E6XtXFaMEeqFfE&usqp=CAU', author:'Iron Man', storyRing: true, storySeen: true),
            ],
          ),
        ),
        Divider(height: 3.0),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.posts.length,
          itemBuilder: (context, index) {
            return Post(widget.posts[index]);
          },
        ),
      ],
  ),
    );
  }
}

Widget getStories({ required String imgPath, required String author, required bool storyRing, bool storySeen = false, double radius=35}){
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
  final post;
  const Post(this.post,{ Key? key}) : super(key: key);

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
              imgPath:widget.post['profile_pic'], 
              storyRing: false,
              radius: 22,
            ),
            title: Text(widget.post['name'], style: TextStyle(fontSize: 15,letterSpacing: letterSpace),),
            subtitle: Text('', style: TextStyle(fontSize: 10,letterSpacing: letterSpace),),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 5),
            height: 350,
            width: double.infinity,
            child: Image(
              fit: BoxFit.cover,
              image: NetworkImage(widget.post['postUrl']),
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
            margin: EdgeInsets.fromLTRB(15, 8, 15, 15),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Expanded(child: RichText(text: TextSpan(
                      style: TextStyle(letterSpacing: 0.5),
                      children:[
                        TextSpan(text: '${widget.post['name']}   ' , style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: widget.post['caption']),
                      ]
                    ),)),

                    // Expanded(child: Text('${widget.post['name']}   ${widget.post['caption']}',
                    //     style:TextStyle(height: 1.4)
                    //   ),
                    // ),
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