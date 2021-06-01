
import 'package:chainatqueue/screens/forgotPassword.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class Checkprofile extends StatefulWidget {
  Checkprofile({Key key}) : super(key: key);

  @override
  _CheckprofileState createState() => _CheckprofileState();
}

class _CheckprofileState extends State<Checkprofile> {
     double screen;
  @override
    Widget build(BuildContext context) {
     screen = MediaQuery.of(context).size.width;
    print('screen =$screen');
     return Scaffold(
      body: Center(
        child: Container(
           width: MediaQuery.of(context).size.width * 0.85,
        height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width ,
    
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
                        style: GoogleFonts.kanit(
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
                      "เลขที่บัตรประชาชน/เลขที่ HN ",
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
                  confirmbutton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget confirmbutton() => Container(
      margin: new EdgeInsets.symmetric(horizontal: 0.0),
      
      height: 50.0,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            
            Container(
                width: MediaQuery.of(context).size.width*0.85,
              height: 50.0,
              // ignore: deprecated_member_use
              child: RaisedButton(
                onPressed: () {
                  MaterialPageRoute route =
                      MaterialPageRoute(builder: (value) => ForgotPassword());
                  Navigator.push(context, route);
                },
                 child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ตรวจสอบข้อมูล',
                style: GoogleFonts.kanit(
                  color: Colors.white,
                  fontSize: 22.0,
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
              ),
            ),
          ],
        ),
      ));
  
forgotPassword(){}
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
 