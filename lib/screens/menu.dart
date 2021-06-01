import 'package:chainatqueue/screens/login.dart';
import 'package:chainatqueue/screens/profile.dart';
import 'package:chainatqueue/screens/resetPassword.dart';
import 'package:chainatqueue/utility/NaveHome.dart';
import 'package:chainatqueue/utility/mystyle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Menu extends StatefulWidget {
  Menu({Key key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(
          0xffeff7f9,
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              MyStyle().bar(),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          'ตั้งค่าการทำงาน',
                          style: GoogleFonts.prompt(
                            fontSize: 20.0,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 20.0)),
                    profile(),
                    Padding(padding: EdgeInsets.only(top: 10.0)),
                    password(),
                    Padding(padding: EdgeInsets.only(top: 10.0)),
                    pin(),
                    Padding(padding: EdgeInsets.only(top: 10.0)),
                    notifications(),
                    Padding(padding: EdgeInsets.only(top: 10.0)),
                    logOut(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavHome(),
    );
  }

  Widget logOut() {
    return Container(
        margin: new EdgeInsets.symmetric(horizontal: 10.0),
        width: MediaQuery.of(context).size.width,
        height: 60.0,
        child: RaisedButton(
          onPressed: () {
            MaterialPageRoute route =
                MaterialPageRoute(builder: (value) => Login());
            Navigator.push(context, route);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ออกจกระบบ',
                style:
                    GoogleFonts.prompt(fontSize: 18.0, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              Icon(
                Icons.exit_to_app,
                color: Colors.grey[600],
              )
            ],
          ),
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
                color: Colors.blue[900], width: 1, style: BorderStyle.solid),
            borderRadius: new BorderRadius.circular(10.0),
          ),
        ));
  }

  Widget notifications() {
    return Container(
        margin: new EdgeInsets.symmetric(horizontal: 10.0),
        width: MediaQuery.of(context).size.width,
        height: 60.0,
        child: RaisedButton(
          onPressed: () {
            // MaterialPageRoute route =
            //     MaterialPageRoute(builder: (value) => Login());
            // Navigator.push(context, route);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ' การแจ้งเตือน',
                style:
                    GoogleFonts.prompt(fontSize: 18.0, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              Icon(
                Icons.notifications,
                color: Colors.grey[600],
              )
            ],
          ),
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
                color: Colors.blue[900], width: 1, style: BorderStyle.solid),
            borderRadius: new BorderRadius.circular(10.0),
          ),
        ));
  }

  Widget pin() {
    return Container(
        margin: new EdgeInsets.symmetric(horizontal: 10.0),
        width: MediaQuery.of(context).size.width,
        height: 60.0,
        child: RaisedButton(
          onPressed: () {
            // MaterialPageRoute route =
            //     MaterialPageRoute(builder: (value) => Login());
            // Navigator.push(context, route);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'เปลี่ยน PIN',
                style:
                    GoogleFonts.prompt(fontSize: 18.0, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              Icon(
                Icons.screen_lock_portrait,
                color: Colors.grey[600],
              )
            ],
          ),
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
                color: Colors.blue[900], width: 1, style: BorderStyle.solid),
            borderRadius: new BorderRadius.circular(10.0),
          ),
        ));
  }

  Widget password() {
    return Container(
        margin: new EdgeInsets.symmetric(horizontal: 10.0),
        width: MediaQuery.of(context).size.width,
        height: 60.0,
        child: RaisedButton(
          onPressed: () {
            MaterialPageRoute route =
                MaterialPageRoute(builder: (value) => RePassword());
            Navigator.push(context, route);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'เปลี่ยนรหัสผ่าน',
                style:
                    GoogleFonts.prompt(fontSize: 18.0, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              Icon(
                Icons.lock,
                color: Colors.grey[600],
              )
            ],
          ),
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
                color: Colors.blue[900], width: 1, style: BorderStyle.solid),
            borderRadius: new BorderRadius.circular(10.0),
          ),
        ));
  }

  Widget profile() {
    return Container(
        margin: new EdgeInsets.symmetric(horizontal: 10.0),
        width: MediaQuery.of(context).size.width,
        height: 60.0,
        child: RaisedButton(
          onPressed: () {
            MaterialPageRoute route =
                MaterialPageRoute(builder: (value) => Profile());
            Navigator.push(context, route);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ข้อมูลส่วนตัว',
                style:
                    GoogleFonts.prompt(fontSize: 18.0, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              Icon(
                Icons.person,
                color: Colors.grey[600],
              )
            ],
          ),
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
                color: Colors.blue[900], width: 1, style: BorderStyle.solid),
            borderRadius: new BorderRadius.circular(10.0),
          ),
        ));
  }
}
