import 'package:flutter/material.dart';
import 'package:insta/common/InstaLogo.dart';
import 'package:insta/common/MyCustomTextField.dart';

class LogIn extends StatefulWidget {
  const LogIn({ Key? key }) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 100, 0, 80),
                child: InstaLogo(logoHeight: 50,)
              ),
              MyCustomTextField(placeholder: 'username'),
              MyCustomTextField(placeholder: 'password'),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 13, 0),
                    child: TextButton( 
                      onPressed: () {} ,
                      child: Text('Forgot Password?')),
                  ),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 6, 0, 100),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.blue[400]),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 140, vertical: 18),
                      child: Text('Log in'),
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
                      margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Text("Don't have an Account?", style: TextStyle(color: Colors.grey[500]),),
                    ),
                    Container(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/sign-up');
                        },
                        child: Text('Sign Up.'),
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
                  child: Text('Instagram from Facebook', 
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
    );
  }
}