import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta/common/CustomCircularAvatar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget{
  final DocumentSnapshot user;
  const ProfilePage({ Key? key , required this.user}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBarProfilePage(context),
      body: Container(
        color: Colors.grey[900],
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Header(widget.user),
            )),
            SliverToBoxAdapter(child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: EditButton(),
            )),
            ProfileGrid(),
          ],
        ),  
      ),
    );
  }
}

class AppBarProfilePage extends AppBar {
  AppBarProfilePage(BuildContext context):super(
    // backgroundColor: Colors.grey[900],
    elevation: 0,
    automaticallyImplyLeading: false,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.lock),
        Text('Loki'),
        Icon(Icons.keyboard_arrow_down)
      ],
    ),
    actions: [
      TextButton(
        onPressed: () async{
          await FirebaseAuth.instance.signOut();
          final preferences = await SharedPreferences.getInstance();
          preferences.clear();
          Navigator.of(context).pushReplacementNamed('/');
        }, 
        child: Text('Logout', style: TextStyle(color: Colors.white),),
      ),
    ]
  );
}


Header(user){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomCircularAvatar(
                isNetworkImage: (user['profile-pic']==null)? false : true,
                imgPath: user['profile-pic'] ?? 'Loki.jpg',
                storyRing: true,
                storySeen: true,
                width: 90,
                paddingBetween: 4,
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('54', style: TextStyle(fontSize: 21),),
                  Text('Posts', style: TextStyle(fontSize: 15),),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('834', style: TextStyle(fontSize: 21),),
                  Text('Followers', style: TextStyle(fontSize: 15),),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('162', style: TextStyle(fontSize: 21),),
                  Text('Following', style: TextStyle(fontSize: 15),),
                ],
              ),
            ],
          ),
          SizedBox(height: 10,),
          Text(user['name'], style: TextStyle(fontSize: 14),),
          Text('I am Loki of Asguard', style: TextStyle(fontSize: 14),),
          Text('And I am burdened with glorious purposes', style: TextStyle(fontSize: 14),),
        ],
      ),
    );
}


// class Header extends StatefulWidget {
//   const Header({ Key? key }) : super(key: key);

//   @override
//   _HeaderState createState() => _HeaderState();
// }

// class _HeaderState extends State<Header> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               CustomCircularAvatar(
//                 imgPath: 'Loki.jpg',
//                 storyRing: true,
//                 storySeen: true,
//                 width: 90,
//                 paddingBetween: 4,
//               ),

//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text('54', style: TextStyle(fontSize: 21),),
//                   Text('Posts', style: TextStyle(fontSize: 15),),
//                 ],
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text('834', style: TextStyle(fontSize: 21),),
//                   Text('Followers', style: TextStyle(fontSize: 15),),
//                 ],
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text('162', style: TextStyle(fontSize: 21),),
//                   Text('Following', style: TextStyle(fontSize: 15),),
//                 ],
//               ),
//             ],
//           ),
//           SizedBox(height: 10,),
//           Text('Loki Laufeyson', style: TextStyle(fontSize: 14),),
//           Text('I am Loki of Asguard', style: TextStyle(fontSize: 14),),
//           Text('And I am burdened with glorious purposes', style: TextStyle(fontSize: 14),),
//         ],
//       ),
//     );
//   }
// }

class EditButton extends StatelessWidget {
  const EditButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          child: Text('Edit Profile' ,style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: Colors.black,
            side: BorderSide(color: Colors.grey[700]!),
          ),
      
        ),
    );
  }
}

class ProfileGrid extends StatefulWidget {
  const ProfileGrid({ Key? key }) : super(key: key);

  @override
  _ProfileGridState createState() => _ProfileGridState();
}

class _ProfileGridState extends State<ProfileGrid> {
  List<String> userPostList = [
    '1_post.jpg', '13_post.jpg', '3_post.jpeg', 
    '11_post.jpg', '5_post.jpeg', '9_post.jpg', '7_post.jpg',
    '6_post.jpg', '10_post.jpg', '2_post.jpg',
    '8_post.jpg', '12_post.jpg', 'thor_post.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ), 
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            child: Image.asset('assets/${userPostList[index]}', fit: BoxFit.cover,),
          );
        },
        childCount: userPostList.length,
      ),
    );
  }
}