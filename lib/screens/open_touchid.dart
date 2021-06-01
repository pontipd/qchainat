import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'haveappointment.dart';
import '../provider/app_provider.dart';

class OpenTouchIDPage extends StatefulWidget {
  final String title = 'เปิดใช้งาน Touch ID';
  @override
  _OpenTouchIDPageState createState() => _OpenTouchIDPageState();
}

class _OpenTouchIDPageState extends State<OpenTouchIDPage> {
  void openTouchID(bool isOpen) async {
    final appProvider = Provider.of<AppProvider>(context, listen: false);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (isOpen) {
      prefs.setBool('openTouchID', true);
      appProvider.openTouchID(isOpen);
    } else {
      prefs.setBool('openTouchID', false);
      appProvider.openTouchID(isOpen);
    }
    _showDialogOnConfirm();
    await Future.delayed(Duration(seconds: 2));
    Navigator.of(context).pop();
    Navigator.push(context,
        PageTransition(type: PageTransitionType.fade, child: Haveappoin()));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text('ตั้งค่า Touch ID'),
          centerTitle: true,
        ),
        body: Container(
            // color: Theme.of(context).colorScheme.primary,
            width: MediaQuery.of(context).size.width,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // SizedBox(
                  //   height: 100,
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'เปิดใช้งาน Touch ID',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.fingerprint_outlined,
                          size: 200,
                          color: Theme.of(context).colorScheme.primary,
                        )),
                  ),
                  SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: ElevatedButton(
                          onPressed: () {
                            openTouchID(true);
                          },
                          child: Text('เปิดใช้งาน'),
                          style:
                              ElevatedButton.styleFrom(shape: StadiumBorder()),
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: ElevatedButton(
                          onPressed: () {
                            openTouchID(false);
                          },
                          child: Text('ไว้ภายหลัง'),
                          style:
                              ElevatedButton.styleFrom(shape: StadiumBorder()),
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                ])));
  }
}
