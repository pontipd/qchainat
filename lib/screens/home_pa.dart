import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
 
class MyHomePage extends StatefulWidget {
  final FirebaseFirestore user;
 
  MyHomePage(this.user, {Key key}) : super(key: key);
 
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
 
class _MyHomePageState extends State<MyHomePage> {
  @override
  initState() {
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Firebase App", style: TextStyle(color: Colors.white)),
        ),
        body: Container(
            child: Center(
                child:
                    Column(mainAxisSize: MainAxisSize.min,children: <Widget>[
          Text("Hello", style: TextStyle(fontSize: 26)),
          // Text(widget.user.uid, style: TextStyle(fontSize: 16)),
        ]))));
  }
}