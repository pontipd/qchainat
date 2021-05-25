import 'package:flutter/material.dart';
 
class Contact extends StatefulWidget {
    static const routeName = '/about';
 
    @override
    State<StatefulWidget> createState() {
        return _ContactState();
    }
}
 
class _ContactState extends State<Contact> {
 
    @override
    Widget build(BuildContext context) {
 
        return Scaffold(
            appBar: AppBar(
                title: Text('Contact'),
            ),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Text('Home Screen'),
                    ],
                )
            ),
        );
    }
}