import 'package:flutter/material.dart';
import '../common/InstaLogo.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 220, 0, 0),
          child: Column(
            children: [
              InstaLogo(logoHeight: 50),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 130, 0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/log-in');
                  }, 
                  style: ElevatedButton.styleFrom(primary: Colors.blue[400]),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 120, vertical: 16),
                    child: Text('Log in'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/sign-up');
                  }, 
                  style: ElevatedButton.styleFrom(primary: Colors.blue[400]),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 116, vertical: 16),
                    child: Text('Sign up'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}