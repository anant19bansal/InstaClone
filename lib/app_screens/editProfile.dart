import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insta/common/CustomCircularAvatar.dart';
import 'package:insta/screenArguments.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  final DocumentSnapshot user;
  EditProfile( {required this.user, Key? key }) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState(user);
}

class _EditProfileState extends State<EditProfile> {
  DocumentSnapshot user;

_EditProfileState(this.user);

  TextEditingController _name = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _bio = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _gender = TextEditingController();
  late SharedPreferences _preferences;
  late CollectionReference _usersCollection; 
  late FirebaseAuth _auth;

  @override
  void initState() { 
    super.initState();
    initialize();
  }

  initialize() async{
    try {
      _auth = await FirebaseAuth.instance;
      _preferences = await SharedPreferences.getInstance();
      _usersCollection = await FirebaseFirestore.instance.collection('users');  
    } catch (err) {
      print('Error in inititalize function in edit profile page*********: $err');
    }
    
  }

  handleUpdate() async{
    try {
      String? userId = await _preferences.getString('id');
      if(userId!=null){
        await _usersCollection.doc(userId).update({
          'email': (_email.text.isNotEmpty)?_email.text:user['email'],
          'name': (_name.text.isNotEmpty)?_name.text:user['name'],
          'username': (_username.text.isNotEmpty)?_username.text:user['email'],
          'phone-number': (_phone.text.isNotEmpty)?_phone.text:user['phone-number'],
          'bio': (_bio.text.isNotEmpty)?_bio.text:'',
          'gender': (_gender.text.isNotEmpty)?_gender.text:'',
        });
        final userAuth =  await _auth.currentUser;
        if(userAuth!=null){
          if(_email.text.isNotEmpty) await userAuth.updateEmail(_email.text);
          if(_name.text.isNotEmpty) await userAuth.updateDisplayName(_name.text);
          // if(_phone.text.isNotEmpty) userAuth.updatePhoneNumber(_phone.text);
        }
        DocumentSnapshot userDoc = await _usersCollection.doc(userId).get();
        Navigator.of(context).pushReplacementNamed('/home', arguments: ScreenArguments(userDoc: userDoc, selectedIndex: 4));
      }
      
    } catch (e) {
      print('Error in handleUpdate function in edit profile page*********: $e');
    }
  }

  updateProfilePhoto(){

  }

  resetPassword(){

  }

  @override
  Widget build(BuildContext context) {
    final double bottomPadding = 8;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                }, 
                child: Text('Cancel', style: TextStyle(color: Colors.white),),
              ),
              Text('Edit Profile'),
              TextButton(
                onPressed: handleUpdate, 
                child: Text('Done', style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          // color: Colors.red,
          child: Center(
            child: FractionallySizedBox(
              widthFactor: 0.95,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: CustomCircularAvatar(
                      radius: 50,
                      storyRing: false, 
                      imgPath: user['profile-pic'],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 1),
                    child: TextButton(
                      onPressed: updateProfilePhoto, 
                      child: Text('Change Photo',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: bottomPadding),
                    child: TextField(
                      controller: _name,
                      cursorWidth: 1,
                      cursorColor: Colors.white,
                      style: TextStyle(
                        fontSize: 18
                      ),
                      decoration: InputDecoration(
                        
                        hintText: 'Name',
                        labelText: 'Name',
                        labelStyle: TextStyle(height: 0.5),
                        
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: bottomPadding),
                    child: TextField(
                      controller: _username,
                      cursorWidth: 1,
                      cursorColor: Colors.white,
                      style: TextStyle(
                        fontSize: 18
                      ),
                      decoration: InputDecoration(
                        
                        hintText: 'Username',
                        labelText: 'Username',
                        labelStyle: TextStyle(height: 0.5),
                        
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: bottomPadding),
                    child: TextField(
                      controller: _bio,
                      maxLines: null,
                      cursorWidth: 1,
                      cursorColor: Colors.white,
                      style: TextStyle(
                        fontSize: 18
                      ),
                      decoration: InputDecoration(
                        hintText: 'Bio',
                        labelText: 'Bio',
                        labelStyle: TextStyle(height: 0.5),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 3),
                    child: TextButton(
                      onPressed: resetPassword, 
                      child: Text('Reset Password',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: bottomPadding),
                    child: TextField(
                      controller: _email,
                      // keyboardType: ,
                      cursorWidth: 1,
                      cursorColor: Colors.white,
                      style: TextStyle(
                        fontSize: 18
                      ),
                      decoration: InputDecoration(
                        hintText: 'Email',
                        labelText: 'Email',
                        labelStyle: TextStyle(height: 0.5),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: bottomPadding),
                    child: TextField(
                      controller: _phone,
                      cursorWidth: 1,
                      cursorColor: Colors.white,
                      style: TextStyle(
                        fontSize: 18
                      ),
                      decoration: InputDecoration(
                        hintText: 'Phone',
                        labelText: 'Phone',
                        labelStyle: TextStyle(height: 0.5),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: bottomPadding),
                    child: TextField(
                      controller: _gender,
                      cursorWidth: 1,
                      cursorColor: Colors.white,
                      style: TextStyle(
                        fontSize: 18
                      ),
                      decoration: InputDecoration(
                        hintText: 'Gender',
                        labelText: 'Gender',
                        labelStyle: TextStyle(height: 0.5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}