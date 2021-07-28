import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta/common/CustomCircularAvatar.dart';
import 'package:insta/screenArguments.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget{
  final DocumentSnapshot user;
  const ProfilePage({ Key? key , required this.user}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with AutomaticKeepAliveClientMixin{
  int totalPosts = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.lock),
            Text((widget.user['username'].isEmpty)?widget.user['name']:widget.user['username']),
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
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('posts').where('email', isEqualTo: widget.user['email']).orderBy('created_at', descending: true).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return (snapshot.hasData && snapshot.data!=null)?Container(
            color: Colors.grey[900],
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Header(widget.user),
                )),
                SliverToBoxAdapter(child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: EditButton(widget.user),
                )),
                SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                  ), 
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Container(
                        child: Image.network(snapshot.data!.docs[index]['postUrl'], fit: BoxFit.cover,),
                      );
                    },
                    childCount: snapshot.data!.docs.length,
                  ),
                ),
              ],
            ),  
          )
          :
          Container();
        }
      ),
    );
  }
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
                imgPath: user['profile-pic'],
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
          Text(user['name'], style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
          Text(user['bio'], style: TextStyle(fontSize: 14),),
        ],
      ),
    );
}

class EditButton extends StatelessWidget {
  final DocumentSnapshot user;
  const EditButton(this.user, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/edit-profile', arguments: ScreenArguments(userDoc: user));
          },
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