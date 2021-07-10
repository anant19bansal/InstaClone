import 'package:flutter/material.dart';
import '../common/InstaLogo.dart';
import '../common/MyCustomTextField.dart';

class SignUp extends StatefulWidget {

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                  child: InstaLogo(),
                ),
                MyCustomTextField(
                  placeholder: 'Username',
                ),
                MyCustomTextField(
                  placeholder: 'Email',
                ),
                MyCustomTextField(
                  placeholder: 'Password',
                ),
                MyCustomTextField(
                  placeholder: 'Confirm Password',
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 6, 0, 100),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(primary: Colors.blue[400]),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 135, vertical: 18),
                      child: Text('Sign up'),
                    ),
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
                    Text('OR', style: TextStyle(color: Colors.grey[500]),),
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
                      child: Text('Have an Account?', style: TextStyle(color: Colors.grey[500]),),
                    ),
                    Container(
                      child: TextButton(
                        onPressed: () {},
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
                  child: Text('Instagram from Facebook', style: TextStyle(color: Colors.grey[500]),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
