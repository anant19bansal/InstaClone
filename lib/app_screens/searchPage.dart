import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:insta/app_bars/AppBarSearchPage.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int nextIndex = 1;
  int side = 0;
  List<Widget> list = [
    Container(
              child: Image.asset(
                'assets/sylvie_post.png',
                height: 200,
                width: 200,
                fit: BoxFit.cover, 
              ),
            ),
            Container(
              child: Image.asset(
                'assets/sylvie_post.png',
                height: 200,
                width: 200,
                fit: BoxFit.cover, 
              ),
            ),
            Container(
              child: Image.asset(
                'assets/sylvie_post.png',
                height: 200,
                width: 200,
                fit: BoxFit.cover, 
              ),
            ),
            Container(
              child: Image.asset(
                'assets/sylvie_post.png',
                height: 200,
                width: 200,
                fit: BoxFit.cover, 
              ),
            ),
            Container(child: Image.asset('assets/sylvie_post.png',height: 200,width: 200,fit: BoxFit.cover)),
            Container(child: Image.asset('assets/sylvie_post.png',height: 200,width: 200,fit: BoxFit.cover)),
            Container(child: Image.asset('assets/sylvie_post.png',height: 200,width: 200,fit: BoxFit.cover)),
            Container(child: Image.asset('assets/sylvie_post.png',height: 200,width: 200,fit: BoxFit.cover)),
            Container(child: Image.asset('assets/sylvie_post.png',height: 200,width: 200,fit: BoxFit.cover)),
            Container(child: Image.asset('assets/sylvie_post.png',height: 200,width: 200,fit: BoxFit.cover)),
            Container(child: Image.asset('assets/sylvie_post.png',height: 200,width: 200,fit: BoxFit.cover)),
            Container(child: Image.asset('assets/sylvie_post.png',height: 200,width: 200,fit: BoxFit.cover)),
            Container(child: Image.asset('assets/sylvie_post.png',height: 200,width: 200,fit: BoxFit.cover)),
            Container(child: Image.asset('assets/sylvie_post.png',height: 200,width: 200,fit: BoxFit.cover)),
            Container(child: Image.asset('assets/sylvie_post.png',height: 200,width: 200,fit: BoxFit.cover)),
            Container(child: Image.asset('assets/sylvie_post.png',height: 200,width: 200,fit: BoxFit.cover)),
            Container(child: Image.asset('assets/sylvie_post.png',height: 200,width: 200,fit: BoxFit.cover)),
            Container(child: Image.asset('assets/sylvie_post.png',height: 200,width: 200,fit: BoxFit.cover)),
            Container(child: Image.asset('assets/sylvie_post.png',height: 200,width: 200,fit: BoxFit.cover)),
            Container(child: Image.asset('assets/sylvie_post.png',height: 200,width: 200,fit: BoxFit.cover)),
            Container(child: Image.asset('assets/sylvie_post.png',height: 200,width: 200,fit: BoxFit.cover)),
  ];
  @override
  Widget build(BuildContext context) {
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
    );
  }
}






