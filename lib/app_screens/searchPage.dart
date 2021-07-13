import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:insta/common/MyCustomTextField.dart';

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
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Container(
        // color: Colors.red,
        margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: TextField(
                    style: TextStyle(
                      fontSize: 23,
                    ),
                    cursorColor: Colors.white,
                    cursorWidth: 0.5,
                    cursorHeight: 25,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, size: 28,),
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
                )),

                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Icon(
                    Icons.fullscreen_rounded,
                    size: 40,
                  ),
                )
              ],
            ),

            // Container(
            //   color: Colors.red,

            //   child:Container(
            //     // color: Colors.blue,
            //     height: 50,
            //     width: 50,
            //   )
            // ),
            // Container(
            //   child: Image.asset(
            //     'assets/sylvie_post.png',
            //     height: 200,
            //     width: 200,
            //     fit: BoxFit.cover, 
            //   ),
            // ),

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




