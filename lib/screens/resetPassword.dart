import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RePassword extends StatefulWidget {
  RePassword({Key key}) : super(key: key);

  @override
  _RePasswordState createState() => _RePasswordState();
}

class _RePasswordState extends State<RePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(
        0xffeff7f9,
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 30.0)),
                  Row(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.navigate_before),
                          iconSize: 36.0,
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      Text(
                        'เปลี่ยนรหัสผ่าน',
                        style: GoogleFonts.prompt(
                          fontSize: 24.0,
                          color: Color(
                            0xff116ea8,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  SizedBox(
                    child: Text(
                      "เปลี่นรหัสผ่าน",
                      style: GoogleFonts.prompt(
                        fontSize: 18.0,
                        color: Color(
                          0xff727876,
                        ),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    width: 325,
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Divider(
                    height: 15,
                    thickness: 1.0,
                    color: Color(
                      0xff727876,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 30.0)),
                  usernameForm(),
                  Padding(padding: EdgeInsets.only(top: 15.0)),
                  passwordForm(),
                  Padding(padding: EdgeInsets.only(top: 15.0)),
                  rePasswordForm(),
                  Padding(padding: EdgeInsets.only(top: 30.0)),
                  button(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget button() {
    return Container(
        margin: new EdgeInsets.symmetric(horizontal: 20.0),
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        child: RaisedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => SimpleDialog(
                title: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 150.0,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "เปลี่ยนรหัสผ่านสำเร็จ",
                        style: GoogleFonts.prompt(
                          color: Color(
                            0xff27b345,
                          ),
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () {
                            // print("Button clicked!");
                            // MaterialPageRoute route =
                            //     MaterialPageRoute(builder: (value) => Menu());
                            // Navigator.pushAndRemoveUntil(context, route, (route) => false);
                          },
                          child: Text(
                            "ปิดหน้าต่าง",
                            style: GoogleFonts.prompt(fontSize: 18.0),
                          ),
                          textColor: Colors.white,
                          color: Color(
                            0xff2f80ed,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              100,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          child: Text(
            'เปลี่ยนรหัสผ่านใหม่',
            style: GoogleFonts.prompt(fontSize: 16.0, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          color: Color(
            0xff1a73e9,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(99.0),
          ),
        ));
  }

  rePasswordForm() => Container(
        margin: new EdgeInsets.symmetric(horizontal: 10.0),
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        child: TextFormField(
          // onChanged: (value) => user = value.trim(),
          decoration: InputDecoration(
            // prefixIcon: Icon(
            //   Icons.account_box,
            //   color: MyStyle().darkColor,
            // ),
            labelStyle:
                GoogleFonts.prompt(fontSize: 16.0, color: Colors.grey[600]),
            labelText: 'Re-password',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.grey[300])),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[300])),
          ),
        ),
        color: Colors.grey[100],
      );
  passwordForm() => Container(
        margin: new EdgeInsets.symmetric(horizontal: 10.0),
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        child: TextFormField(
          // onChanged: (value) => user = value.trim(),
          decoration: InputDecoration(
            // prefixIcon: Icon(
            //   Icons.account_box,
            //   color: MyStyle().darkColor,
            // ),
            labelStyle:
                GoogleFonts.prompt(fontSize: 16.0, color: Colors.grey[600]),
            labelText: 'Password',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.grey[300])),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[300])),
          ),
        ),
        color: Colors.grey[100],
      );

  usernameForm() => Container(
        margin: new EdgeInsets.symmetric(horizontal: 10.0),
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        child: TextFormField(
          // onChanged: (value) => user = value.trim(),
          decoration: InputDecoration(
            // prefixIcon: Icon(
            //   Icons.account_box,
            //   color: MyStyle().darkColor,
            // ),
            labelStyle:
                GoogleFonts.prompt(fontSize: 16.0, color: Colors.grey[600]),
            labelText: 'username',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.grey[300])),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[300])),
          ),
        ),
        color: Colors.grey[100],
      );
}
