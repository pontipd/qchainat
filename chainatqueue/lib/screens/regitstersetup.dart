
import 'package:chainatqueue/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class RegisSetup extends StatefulWidget {
  RegisSetup({Key key}) : super(key: key);

  @override
  _RegisSetupState createState() => _RegisSetupState();
}

class _RegisSetupState extends State<RegisSetup> {
  @override
 Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 1.5,
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 40.0)),
                  Row(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.navigate_before),
                          iconSize: 36.0,
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      Text(
                        'ลงทะเบียน',
                        style: GoogleFonts.kanit(
                          fontSize: 24.0,
                          color: Color(
                            0xff089EAD,
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
                      "กำหนดชื่อผู้ใช้งานและรหัสผ่าน",
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
                      0xffBDBDBD,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 30.0)),
                  usernameForm(),
                  Padding(padding: EdgeInsets.only(top: 15.0)),
                  passwordForm(),
                  Padding(padding: EdgeInsets.only(top: 15.0)),
                  rePasswordForm(),
                  Padding(padding: EdgeInsets.only(top: 35.0)),
                  button(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

 Widget button() => Container(
      margin: new EdgeInsets.symmetric(horizontal: 30.0),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: 120.0,
              height: 53.0,
              
              child: RaisedButton(
                onPressed: () {},
                child: Row(
                  children: [
                   
                    Text(
                      ' ย้อนกลับ',
                        style: GoogleFonts.kanit( 
                        fontSize: 22.0,
                        color: Color(
                          0xff727876,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(8.0),
                ),
              ),
            ),
            Container(
              width: 120.0,
              height: 53.0,
              child: RaisedButton(
                onPressed: () {
                  MaterialPageRoute route =
                      MaterialPageRoute(builder: (value) => Home ());
                  Navigator.push(context, route);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ' ต่อไป  ',
                        style: GoogleFonts.kanit( 
                          fontSize: 22.0,
                           color: Color(
                          0xffF2F2F2,
                        ),),
                      textAlign: TextAlign.center,
                    ),
                    // Icon(
                    //   Icons.navigate_next,
                    //   color: Colors.green[200],
                    // ),
                  ],
                ),
                color: Color(
                  0xff089EAD,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ),
      ));


  rePasswordForm() => Container(
        margin: new EdgeInsets.symmetric(horizontal: 10.0),
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
                  GoogleFonts.kanit(fontSize: 16.0, color: Colors.grey[600]),
            labelText: 'ยืนยันรหัสผ่าน',
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
        child: TextField(
          // onChanged: (value) => user = value.trim(),
          decoration: InputDecoration(
            // prefixIcon: Icon(
            //   Icons.account_box,
            //   color: MyStyle().darkColor,
            // ),
            labelStyle:
                  GoogleFonts.kanit(fontSize: 16.0, color: Colors.grey[600]),
            labelText: 'รหัสผ่าน',
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
        child: TextField(
          // onChanged: (value) => user = value.trim(),
          decoration: InputDecoration(
            // prefixIcon: Icon(
            //   Icons.account_box,
            //   color: MyStyle().darkColor,
            // ),
            labelStyle:
                  GoogleFonts.kanit(fontSize: 16.0, color: Colors.grey[600]),
            labelText: 'ชื่อผู้ใช้งาน',
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
