// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import '../common/InstaLogo.dart';
// import '../common/MyCustomTextField.dart';

// class SignUp extends StatefulWidget {

//   @override
//   _SignUpState createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   late String _userName, _email, _password, _confirmPassword;
//   final auth = FirebaseAuth.instance;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SingleChildScrollView(
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
//                   child: InstaLogo(logoHeight: 50,),
//                 ),
//                 MyCustomTextField(
//                   placeholder: 'Username',
//                   onChanged: (value){
//                     setState(() {
//                       _userName = value;
//                     });
//                   }
//                 ),
//                 MyCustomTextField(
//                   placeholder: 'Email',
//                   keyboardType: TextInputType.emailAddress,
//                   onChanged: (value){
//                     setState(() {
//                       _email = value;
//                     });
//                   }
//                 ),
//                 MyCustomTextField(
//                   placeholder: 'Password',
//                   obscureText: true,
//                   onChanged: (value){
//                     setState(() {
//                       _password = value;
//                     });
//                   }
//                 ),
//                 MyCustomTextField(
//                   placeholder: 'Confirm Password',
//                   obscureText: true,
//                   onChanged: (value){
//                     setState(() {
//                       _confirmPassword = value;
//                     });
//                   }
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 6, 0, 100),
//                   child: ElevatedButton(
//                     onPressed: () {
//                       // Navigator.pushNamed(context, '/home');
//                       print(_userName);
//                       print(_email);
//                       print(_password);
//                       print(_confirmPassword);
//                     },
//                     style: ElevatedButton.styleFrom(primary: Colors.blue[400]),
//                     child: Padding(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 135, vertical: 18),
//                       child: Text('Sign up'),
//                     ),
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Container(
//                         margin: EdgeInsets.symmetric(horizontal: 21),
//                         child: Divider(
//                           color: Colors.grey[700],
//                         ),
//                         // height:30,
//                       ),
//                     ),
//                     Text('OR', style: TextStyle(color: Colors.grey[500]),),
//                     Expanded(
//                       child: Container(
//                         margin: EdgeInsets.symmetric(horizontal: 21),
//                         child: Divider(
//                           color: Colors.grey[700],
//                         ),
//                         // height:30,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
//                       child: Text('Have an Account?', style: TextStyle(color: Colors.grey[500]),),
//                     ),
//                     Container(
//                       child: TextButton(
//                         onPressed: () {
//                           Navigator.pushNamed(context, '/log-in');
//                         },
//                         child: Text('Log In.'),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
//                   child: Divider(
//                     color: Colors.grey[700],
//                   ),
//                 ),
//                 Center(
//                   child: Text('Instagram from Facebook',
//                     style: TextStyle(
//                       color: Colors.grey[500],
//                       fontSize: 12,
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../common/InstaLogo.dart';
import '../common/MyCustomTextField.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late String _userName, _email, _password, _confirmPassword;
  final auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                  child: InstaLogo(
                    logoHeight: 50,
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      MyCustomTextFormField(
                          placeholder: 'Username',
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Username cannot be kept empty";
                            }
                          },
                          onChanged: (value) {
                            setState(() {
                              _userName = value;
                            });
                          }),
                      MyCustomTextFormField(
                          placeholder: 'Email',
                          // ignore: todo
                          //TODO add a email and password validator
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Email cannot be kept empty";
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            setState(() {
                              _email = value;
                            });
                          }),
                      MyCustomTextFormField(
                          placeholder: 'Password',
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Password cannot be kept empty";
                            }
                          },
                          obscureText: true,
                          onChanged: (value) {
                            setState(() {
                              _password = value;
                            });
                          }),
                      MyCustomTextFormField(
                          placeholder: 'Confirm Password',
                          validator: (value) {
                            if (value!=_password) {
                              return "Password didn't match";
                            }
                          },
                          obscureText: true,
                          onChanged: (value) {
                            setState(() {
                              _confirmPassword = value;
                            });
                          }),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 6, 0, 100),
                        child: ElevatedButton(
                          onPressed: () {
                            
                            // print(_userName);
                            // print(_email);
                            // print(_password);
                            // print(_confirmPassword);
                            // print(_formKey.currentState);
                            if(_formKey.currentState!.validate()){
                              var value = auth.createUserWithEmailAndPassword(email: _email, password: _password);
                              print('value is: $value');
                            }else{
                              print("Wrong format for credentials");
                            }
                            // Navigator.pushNamed(context, '/home');
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blue[400]),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 135, vertical: 18),
                            child: Text('Sign up'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 21),
                        child: Divider(
                          color: Colors.grey[700],
                        ),
                        // height:30,
                      ),
                    ),
                    Text(
                      'OR',
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 21),
                        child: Divider(
                          color: Colors.grey[700],
                        ),
                        // height:30,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Text(
                        'Have an Account?',
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                    ),
                    Container(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/log-in');
                        },
                        child: Text('Log In.'),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                  child: Divider(
                    color: Colors.grey[700],
                  ),
                ),
                Center(
                  child: Text(
                    'Instagram from Facebook',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 12,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

