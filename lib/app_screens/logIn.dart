import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta/common/InstaLogo.dart';
import 'package:insta/common/MyCustomTextField.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  late String _email, _password;
  final auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
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
                  child: InstaLogo(
                    logoHeight: 50,
                  )),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    MyCustomTextFormField(
                        placeholder: 'email',
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Username cannot be kept empty";
                          }
                        },
                        onChanged: (value) {
                          setState(() {
                            _email = value;
                          });
                        }),
                    MyCustomTextFormField(
                        placeholder: 'password',
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
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 13, 0),
                    child: TextButton(
                        onPressed: () {}, child: Text('Forgot Password?')),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 6, 0, 100),
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, '/home');
                    // print(_email);
                    // print(_password);
                    _formKey.currentState!.validate()? 
                      auth.signInWithEmailAndPassword(email: _email, password: _password):
                      print("Wrong format");
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
                      "Don't have an Account?",
                      style: TextStyle(color: Colors.grey[500]),
                    ),
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
    );
  }
}
