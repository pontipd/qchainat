import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';
import '../provider/app_provider.dart';
import 'haveappointment.dart';

enum _SupportState {
  unknown,
  supported,
  unsupported,
}

class AuthPinCode extends StatefulWidget {
  AuthPinCode({
    Key key,
  }) : super(key: key);

  @override
  _AuthPinCodeState createState() => _AuthPinCodeState();
}

class _AuthPinCodeState extends State<AuthPinCode> {
  int length = 6;
  final LocalAuthentication auth = LocalAuthentication();
  _SupportState _supportState = _SupportState.unknown;
  bool _canCheckBiometrics;
  List<BiometricType> _availableBiometrics;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;
  String _errorMsg = '';

  @override
  void initState() {
    super.initState();
    _getAvailableBiometrics();
    // _checkDeviceSupported();
  }

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      availableBiometrics = <BiometricType>[];
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _availableBiometrics = availableBiometrics;
    });
  }

  Future<void> _checkDeviceSupported() async {
    final appProvider = Provider.of<AppProvider>(context, listen: false);
    bool isSupported = await auth.isDeviceSupported();
    setState(() => {
          _supportState =
              isSupported ? _SupportState.supported : _SupportState.unsupported
        });
    if (Platform.isIOS) {
      if (_availableBiometrics.contains(BiometricType.face)) {
        print('Face ID.');
        // Face ID.
      } else if (_availableBiometrics.contains(BiometricType.fingerprint)) {
        // Touch ID.
        print('Touch ID.');
      }
    }

    if (isSupported &&
        _availableBiometrics != null &&
        _availableBiometrics.contains(BiometricType.fingerprint) &&
        appProvider.isTouchID) {
      _authenticateWithBiometrics();
    }
  }

  Future<void> _authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
          localizedReason:
              'Scan your fingerprint (or face or whatever) to authenticate',
          useErrorDialogs: true,
          stickyAuth: true,
          androidAuthStrings: AndroidAuthMessages(
            signInTitle: 'ใช้ Touch ID',
          ),
          biometricOnly: true);
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Authenticating';
      });
      if (authenticated) {
        _showDialogOnConfirm();
        await Future.delayed(Duration(seconds: 2));
        Navigator.of(context).pop();
        Navigator.pushReplacement(context,
            PageTransition(type: PageTransitionType.fade, child: Haveappoin()));
      }
    } on PlatformException catch (e) {
      setState(() {
        _isAuthenticating = false;
        _authorized = "Error - ${e.message}";
      });
      print('_authorized $_authorized');
      return;
    }
    if (!mounted) return;

    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    setState(() {
      _authorized = message;
    });
  }

  Future<void> _showDialogOnConfirm() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: new Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new CircularProgressIndicator(),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: new Text("Please wait..."),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  onChange(String number) async {
    if (number.length == length) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String pin = prefs.getString('pinCode') ?? '';
      if (pin != number) {
        setState(() {
          _errorMsg = 'รหัสผ่านไม่ถูกต้อง';
        });
        vibrate();
      } else {
        setState(() {
          _errorMsg = '';
        });
        _showDialogOnConfirm();
        await Future.delayed(Duration(seconds: 2));
        Navigator.of(context).pop();
        Navigator.of(context).pushReplacement(PageTransition(
            type: PageTransitionType.fade, child: new Haveappoin()));
      }
    } else {
      setState(() {
        _errorMsg = '';
      });
    }
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
          localizedReason: 'Let OS determine authentication method',
          useErrorDialogs: true,
          stickyAuth: true);
      setState(() {
        _isAuthenticating = false;
      });
      if (authenticated) {
        _showDialogOnConfirm();
        await Future.delayed(Duration(seconds: 2));
        Navigator.of(context).pop();
        Navigator.pushReplacement(context,
            PageTransition(type: PageTransitionType.fade, child: Haveappoin()));
      }
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _isAuthenticating = false;
        _authorized = "Error - ${e.message}";
      });
      return;
    }
    if (!mounted) return;

    setState(
        () => _authorized = authenticated ? 'Authorized' : 'Not Authorized');
  }

  void vibrate() async {
    if (await Vibration.hasVibrator()) {
      Vibration.vibrate();
    } else {
      print('vibrate');
    }
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context, listen: false);

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.background,
      // ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                'Please input your PIN Code',
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
            Expanded(
                child: Numpad(
              length: length,
              onChange: onChange,
              authenticate: _supportState == _SupportState.supported
                  ? _authenticateWithBiometrics
                  : _authenticate,
              isTouchID: appProvider.isTouchID,
            )),
          ],
        ),
      ),
    );
  }
}

class Numpad extends StatefulWidget {
  final int length;
  final Function onChange;
  final Function authenticate;
  final bool isTouchID;
  Numpad(
      {Key key, this.length, this.onChange, this.authenticate, this.isTouchID})
      : super(key: key);

  @override
  _NumpadState createState() => _NumpadState();
}

class _NumpadState extends State<Numpad> {
  String number = '';

  setValue(String val) {
    if (number.length < widget.length)
      setState(() {
        number += val;
        widget.onChange(number);
      });
  }

  backspace(String text) {
    if (text.length > 0) {
      setState(() {
        number = text.split('').sublist(0, text.length - 1).join('');
        widget.onChange(number);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Spacer(),
          Preview(text: number, length: widget.length),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: NumpadButton(
                  text: '1',
                  onPressed: () => setValue('1'),
                ),
              ),
              Expanded(
                child: NumpadButton(
                  text: '2',
                  onPressed: () => setValue('2'),
                ),
              ),
              Expanded(
                child: NumpadButton(
                  text: '3',
                  onPressed: () => setValue('3'),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: NumpadButton(
                  text: '4',
                  onPressed: () => setValue('4'),
                ),
              ),
              Expanded(
                child: NumpadButton(
                  text: '5',
                  onPressed: () => setValue('5'),
                ),
              ),
              Expanded(
                child: NumpadButton(
                  text: '6',
                  onPressed: () => setValue('6'),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: NumpadButton(
                  text: '7',
                  onPressed: () => setValue('7'),
                ),
              ),
              Expanded(
                child: NumpadButton(
                  text: '8',
                  onPressed: () => setValue('8'),
                ),
              ),
              Expanded(
                child: NumpadButton(
                  text: '9',
                  onPressed: () => setValue('9'),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(child: NumpadButton(haveBorder: false)),
              // widget.isTouchID
              //     ? Expanded(
              //         child: NumpadButton(
              //             onPressed: widget.authenticate,
              //             icon: Icons.fingerprint,
              //             haveBorder: false),
              //       )
              //     : Expanded(child: NumpadButton(haveBorder: false)),
              Expanded(
                child: NumpadButton(
                  text: '0',
                  onPressed: () => setValue('0'),
                ),
              ),
              Expanded(
                child: NumpadButton(
                  haveBorder: false,
                  icon: Icons.backspace,
                  onPressed: () => backspace(number),
                ),
              ),
            ],
          ),
          Spacer()
        ],
      ),
    );
  }
}

class Preview extends StatelessWidget {
  final int length;
  final String text;
  const Preview({Key key, this.length, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> previewLength = [];
    for (var i = 0; i < length; i++) {
      previewLength.add(Dot(isActive: text.length >= i + 1));
    }
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Wrap(children: previewLength));
  }
}

class Dot extends StatelessWidget {
  final bool isActive;
  const Dot({Key key, this.isActive = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Container(
        width: 15.0,
        height: 15.0,
        decoration: BoxDecoration(
          color: isActive ? Theme.of(context).primaryColor : Colors.transparent,
          border: Border.all(width: 1.0, color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}

class NumpadButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool haveBorder;
  final Function onPressed;
  const NumpadButton(
      {Key key, this.text, this.icon, this.haveBorder = true, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle buttonStyle =
        TextStyle(fontSize: 22.0, color: Theme.of(context).primaryColor);
    Widget label = icon != null
        ? Icon(
            icon,
            color: Theme.of(context).primaryColor.withOpacity(0.8),
            size: 35.0,
          )
        : Text(this.text ?? '', style: buttonStyle);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: OutlineButton(
        borderSide:
            haveBorder ? BorderSide(color: Colors.grey[400]) : BorderSide.none,
        highlightedBorderColor: icon != null
            ? Colors.transparent
            : Theme.of(context).primaryColor.withOpacity(0.3),
        splashColor: icon != null
            ? Colors.transparent
            : Theme.of(context).primaryColor.withOpacity(0.1),
        padding: EdgeInsets.all(20.0),
        shape: CircleBorder(),
        onPressed: onPressed,
        child: label,
      ),
    );
  }
}
