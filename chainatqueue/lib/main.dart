import 'dart:async';

import 'package:chainatqueue/provider/user.dart';
import 'package:chainatqueue/router.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

String initialRoute = '/appname';

Future<Null> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) async {
    await FirebaseAuth.instance.authStateChanges().listen((event) {
      if (event != null) {
        initialRoute = '/haveappointment';
      }
      runApp(MyApp());
    });
  });

  // runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chainat Queue',
      routes: routes,
      initialRoute: initialRoute,
      theme: ThemeData(fontFamily: 'Prompt', appBarTheme: AppBarTheme(backgroundColor: const Color(0xff089EAD))),
    
    );
  }
}
