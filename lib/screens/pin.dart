import 'package:flutter/material.dart';
import '../widget/numpad.dart';
import 'pincode_confirm.dart';

class Pincode2 extends StatefulWidget {
  Pincode2({
    Key key,
  }) : super(key: key);

  @override
  _Pincode2State createState() => _Pincode2State();
}

class _Pincode2State extends State<Pincode2> {
  int length = 6;

  onChange(String number) {
    if (number.length == length) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PinCodeConfirm(
                  pin: number,
                )),
      );
    }
    print(number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                'Please input your PIN Code',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
              ),
            ),
            Numpad(
              length: length,
              onChange: onChange,
            )
          ],
        ),
      ),
    );
  }
}
