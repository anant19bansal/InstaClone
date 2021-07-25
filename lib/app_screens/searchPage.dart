import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:insta/common/SearchBar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with AutomaticKeepAliveClientMixin{
  int nextIndex = 1;
  int side = 0;
  List<Widget> list = [
            Container(child: Image.asset('assets/sylvie_post.png',height: 200,width: 200,fit: BoxFit.cover)),
            Container(child: Image.asset('assets/12_post.jpg',height: 200,width: 200,fit: BoxFit.cover)),
            Container(child: Image.asset('assets/thor_post.jpg',height: 200,width: 200,fit: BoxFit.cover)),
            Container(child: Image.asset('assets/1_post.jpg',height: 200,width: 200,fit: BoxFit.cover)),
            Container(child: Image.asset('assets/sylvie_post.png',height: 200,width: 200,fit: BoxFit.cover)),
            Container(child: Image.asset('assets/11_post.jpg',height: 200,width: 200,fit: BoxFit.cover)),
            Container(child: Image.asset('assets/2_post.jpg',height: 200,width: 200,fit: BoxFit.cover)),
            Container(child: Image.asset('assets/10_post.jpg',height: 200,width: 200,fit: BoxFit.cover)),
            Container(child: Image.asset('assets/sylvie_post.png',height: 200,width: 200,fit: BoxFit.cover)),
            Container(child: Image.asset('assets/3_post.jpeg',height: 200,width: 200,fit: BoxFit.cover)),
            Container(child: Image.asset('assets/9_post.jpg',height: 200,width: 200,fit: BoxFit.cover)),
            Container(child: Image.asset('assets/13_post.jpg',height: 200,width: 200,fit: BoxFit.cover)),
            Container(child: Image.asset('assets/4_post.png',height: 200,width: 200,fit: BoxFit.cover)),
            Container(child: Image.asset('assets/8_post.jpg',height: 200,width: 200,fit: BoxFit.cover)),
            Container(child: Image.asset('assets/14_post.jpg',height: 200,width: 200,fit: BoxFit.cover)),
            Container(child: Image.asset('assets/5_post.jpeg',height: 200,width: 200,fit: BoxFit.cover)),
            Container(child: Image.asset('assets/7_post.jpg',height: 200,width: 200,fit: BoxFit.cover)),
            Container(child: Image.asset('assets/11_post.jpg',height: 200,width: 200,fit: BoxFit.cover)),
            Container(child: Image.asset('assets/6_post.jpg',height: 200,width: 200,fit: BoxFit.cover)),
            Container(child: Image.asset('assets/13_post.jpg',height: 200,width: 200,fit: BoxFit.cover)),
            Container(child: Image.asset('assets/drStrange_post.jpg',height: 200,width: 200,fit: BoxFit.cover)),
  ];

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBarSearchPage(context),
      body: Container(
        color: Colors.grey[900],
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.black,
                  child: StaggeredGridView.countBuilder(
                    itemCount: list.length,
                    staggeredTileBuilder: (index) => (index%18==1 || (index%9==0 && (index/9)%2!=0))?StaggeredTile.count(2,2):StaggeredTile.count(1,1),
                    padding: EdgeInsets.zero,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                    crossAxisCount: 3,
                    itemBuilder: (context, index) => list[index],
                  ),
                ),
              ),
              
            ],
          ),
        ),
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






