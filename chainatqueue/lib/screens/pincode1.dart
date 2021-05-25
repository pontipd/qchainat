import 'package:flutter/material.dart';
import 'package:passcode_screen/passcode_screen.dart';

class PinCode1 extends StatefulWidget {
  PinCode1({Key key}) : super(key: key);

  @override
  _PinCode1State createState() => _PinCode1State();
}

class _PinCode1State extends State<PinCode1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: PasscodeScreen(
            title: Text('data'),
            passwordEnteredCallback: null,
            cancelButton: Text('cancel'),
            deleteButton: Text('Delete'),
            shouldTriggerVerification: null),
        ),
         
            );
           
  
}
  }

