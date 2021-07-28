import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:insta/common/SearchBar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBarSearchPage(context),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if(snapshot.hasData && snapshot.data!=null){
            return Container(
              color: Colors.grey[900],
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.black,
                        child: StaggeredGridView.countBuilder(
                          itemCount: snapshot.data!.docs.length,
                          staggeredTileBuilder: (index) => (index%18==1 || (index%9==0 && (index/9)%2!=0))?StaggeredTile.count(2,2):StaggeredTile.count(1,1),
                          padding: EdgeInsets.zero,
                          crossAxisSpacing: 1,
                          mainAxisSpacing: 1,
                          crossAxisCount: 3,
                          itemBuilder: (context, index) => Container(
                            child: Image.network(
                              snapshot.data!.docs[index]['postUrl'],
                              height: 200,
                              width: 200,
                              fit: BoxFit.cover
                            )
                          ),
                        ),
                      ),
                    ),
                    
                  ],
                ),
              ),
            );
          }else{
            return Container();
          }
        }
      ),
    );
  }
}


class AppBarSearchPage extends PreferredSize {
  AppBarSearchPage(BuildContext context):super(
    preferredSize: Size.fromHeight(80),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        child: SearchBar(),
                    ),
      
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: Icon(
                        Icons.fullscreen_rounded,
                        size: 40,
                      ),
                    )
                  ],
                ),
          ),
        ),
  );
}






