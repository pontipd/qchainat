// class UserPro {
//   String prefix;
//   String name;
//   String surname;
//   String cids;
//   String hns;
//   String birthday;
//   String phone;
//   String email;
//   String password;

//   UserPro({ this.prefix,this.name,this.surname,this.cids,this.hns,this.birthday,this.email,this.phone,this.password});
// }


import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class ProviderState extends ChangeNotifier{

  String uid;
  String email;
  String prefix;
  String name;
  String surname;
  String cids;
  String hns;
  String birthday;
  String phone;
  String password;


  String get getUid =>uid;
  String get getEmail =>email;
  String get getPrefix =>prefix;
 String get getName =>name;
 String get getSurname =>surname;
 String get getCids =>cids;
String get getHns =>hns;
   String get getBirthday =>birthday;
 String get getPhone =>phone;
 
  String get getPassword =>password;


  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> signUpUser(String email,String password) async{
    bool retval = false;

    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      if(userCredential.user != null)
        {
          uid = userCredential.user.uid;
          email = userCredential.user.email;
          return retval = true;
        }
    }catch(e)
    {
      print(e);
    }

    return retval;
  }

  Future<bool> LoginUser(String email,String password) async{
    bool retval = false;

    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);

      if(userCredential.user != null)
      {
        uid = userCredential.user.uid;
        email = userCredential.user.email;
        return retval = true;
      }
    }catch(e)
    {
      print(e);
    }

    return retval;
  }
}