import 'package:flutter/material.dart';

class MyCustomTextField extends StatefulWidget {
  final String placeholder;

  const MyCustomTextField({Key? key, required this.placeholder})
      : super(key: key);

  @override
  _MyCustomTextFieldState createState() => _MyCustomTextFieldState();
}

class _MyCustomTextFieldState extends State<MyCustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
        cursorColor: Colors.white,
        cursorWidth: 0.5,
        cursorHeight: 20,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[900],
          hintText: widget.placeholder,
          contentPadding: EdgeInsets.symmetric(horizontal: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
        ),
      ),
    );
  }
}