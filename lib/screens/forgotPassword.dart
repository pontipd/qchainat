import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({Key key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 30.0)),
                  Row(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.navigate_before),
                          iconSize: 36.0,
                          color: Color(
                          0xff828282,
                        ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      Text(
                        'ลืมรหัสผ่าน',
                        style: GoogleFonts.prompt(
                          fontSize: 24.0,
                          color: Color(
                          0xff089EAD,
                        ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  SizedBox(
                    child: Text(
                      "เลขที่บัตรประชาชน/เลขที่ HN\nเพื่อตั้งค่ารหัสผ่านใหม่ ",
                      style: GoogleFonts.kanit(
                        fontSize: 18.0,
                        color: Color(
                          0xff089EAD,
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
                      0xff828282,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  mailForm(),
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
        margin: new EdgeInsets.symmetric(horizontal: 0.0),
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        child: RaisedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => SimpleDialog(
                title: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 160.0,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "ตรวจสอบอิเมล์ \nandamanpattana@gmail.com \nเพื่อตั้งค่ารหัสผ่านใหม่",
                        style: GoogleFonts.prompt(
                          color: Colors.grey[600],
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () {
                            print("Button clicked!");
                            MaterialPageRoute route =
                                MaterialPageRoute(builder: (value) => Login());
                            Navigator.push(context, route);
                          },
                          child: Text(
                            "ปิดหน้าต่าง",
                            style: GoogleFonts.prompt(fontSize: 18.0),
                          ),
                          textColor: Colors.white,
                          color: Color(
                          0xff089EAD,
                        ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              50,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ' ส่ง e-mail เพื่อตั้งค่ารหัสผ่าน',
                style: GoogleFonts.prompt(
                  color: Colors.white,
                  fontSize: 21.0,
                  fontWeight: FontWeight.w400,
              
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(width: 30.0),
              // Icon(
              //   Icons.mail,
              //   color: Colors.white,
              // ),
            ],
          ),
          color: Color(
                            0xff089EAD,
                          ),
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(7.0),
          ),
        ));
  }

  mailForm() => Container(
        margin: new EdgeInsets.symmetric(horizontal: 0.0),
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        child: TextField(
          // onChanged: (value) => user = value.trim(),
          decoration: InputDecoration(
            // prefixIcon: Icon(
            //   Icons.account_box,
            //   color: MyStyle().darkColor,
            // ),
            labelStyle:
                GoogleFonts.prompt(fontSize: 16.0, color: Colors.grey[600]),
            labelText: '',
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
