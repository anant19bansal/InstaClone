import 'package:flutter/material.dart';

// class MyCustomTextField extends StatefulWidget {
//   final String placeholder;
//   final  keyboardType;
//   final bool obscureText;
//   final  onChanged;

//   const MyCustomTextField({
//     Key? key, 
//     required this.placeholder, 
//     this.keyboardType, 
//     this.obscureText=false, 
//     this.onChanged,
//   })
//       : super(key: key);

//   @override
//   _MyCustomTextFieldState createState() => _MyCustomTextFieldState();
// }

// class _MyCustomTextFieldState extends State<MyCustomTextField> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//       child: TextField(
//         keyboardType: widget.keyboardType,
//         obscureText: widget.obscureText,
//         onChanged: widget.onChanged,
//         cursorColor: Colors.white,
//         cursorWidth: 0.5,
//         cursorHeight: 20,
//         decoration: InputDecoration(
//           filled: true,
//           fillColor: Colors.grey[900],
//           hintText: widget.placeholder,
//           contentPadding: EdgeInsets.symmetric(horizontal: 15),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(5),
//             borderSide: BorderSide(
//               width: 0,
//               style: BorderStyle.none,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class MyCustomTextFormField extends StatefulWidget {
  final String placeholder;
  final keyboardType;
  final bool obscureText;
  final onChanged;
  final validator;

  const MyCustomTextFormField({
    Key? key,
    required this.placeholder,
    this.keyboardType,
    this.obscureText = false,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  _MyCustomTextFromFieldState createState() => _MyCustomTextFromFieldState();
}

class _MyCustomTextFromFieldState extends State<MyCustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextFormField(
        validator: widget.validator,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        onChanged: widget.onChanged,
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
