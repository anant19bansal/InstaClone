import 'package:flutter/material.dart';

class AppBarSearchPage extends PreferredSize {
  AppBarSearchPage():super(
    preferredSize: Size.fromHeight(80),
        child: AppBar(
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: Row(
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
          ),
          
        ),
  );
  
}