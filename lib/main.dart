import 'package:flutter/material.dart';
import 'app_screens/firstPage.dart';

void main() => runApp(Root());

class Root extends StatelessWidget {
  const Root({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
    );
  }
}
