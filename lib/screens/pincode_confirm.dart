import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';
import '../widget/numpad.dart';
import 'haveappointment.dart';
import 'open_touchid.dart';

class PinCodeConfirm extends StatefulWidget {
  PinCodeConfirm({
    Key key,
    this.pin,
  }) : super(key: key);

  final String pin;

  @override
  _PinCodeConfirmState createState() => _PinCodeConfirmState();
}

class _PinCodeConfirmState extends State<PinCodeConfirm> {
  int length = 6;
  String _errorMsg = '';
  final LocalAuthentication auth = LocalAuthentication();
  bool _canCheckBiometrics;

  @override
  void initState() {
    super.initState();
    _checkBiometrics();
  }

  onChange(String number) async {
    if (number.length == length) {
      if (widget.pin != number) {
        setState(() {
          _errorMsg = 'รหัสผ่านไม่ถูกต้อง';
        });
        vibrate();
      } else {
        setState(() {
          _errorMsg = '';
        });
        SharedPreferences prefs = await SharedPreferences.getInstance();
        bool isSupported = await auth.isDeviceSupported();
        await prefs.setString('pinCode', number);
        if (isSupported && _canCheckBiometrics) {
          Navigator.pushReplacement(
              context,
              PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: OpenTouchIDPage()));
        } else {
          Navigator.pushReplacement(
              context,
              PageTransition(
                  type: PageTransitionType.fade, child: Haveappoin()));
        }
      }
    }
  }

  void vibrate() async {
    if (await Vibration.hasVibrator()) {
      Vibration.vibrate();
    }
  }

  Future<void> _checkBiometrics() async {
    bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
    }
    if (!mounted) return;

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
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
                'Please input your PIN Code again.',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
              ),
            ),
            _errorMsg != ''
                ? Padding(
                    padding: const EdgeInsets.all(0),
                    child: Text(
                      _errorMsg,
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.red),
                    ),
                  )
                : Container(),
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
