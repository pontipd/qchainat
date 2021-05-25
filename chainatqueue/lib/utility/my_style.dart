import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyStyle {
  Color darkColor = Color(0xff2D9CDB);
  Color prinaryColor = Color(0xff089ead);
  Color lightColor = Color(0xff116EA8);
  Color bColor = Color(0xff979797);
  Color bgColor = Color(0xffE5E5E5);
  Color wColor = Color(0xffEDF5F7);
  Color gColor = Color(0xffF6F6F6);
  Color wrColor = Color(0xffFFFFFF);
  Color grColor = Color(0xff666666);

  TextStyle prinaryStyle() => TextStyle(
        color: prinaryColor,
        fontFamily: 'Kanit',
        height: 1.5,
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
      );
  TextStyle okStyle() => TextStyle(
        color: lightColor,
        fontFamily: 'Kanit',
        height: 1.5,
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
      );
  TextStyle redBoldStyle() => TextStyle(
        color: Colors.red.shade700,
        fontFamily: 'Kanit',
        height: 1.5,
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      );
  TextStyle whiteStyle() => TextStyle(
        color: Colors.white,
        fontSize: 16.0,
      );
  TextStyle pinkStyle() => TextStyle(
        fontSize: 20.0,
        fontFamily: 'Kanit',
        fontWeight: FontWeight.w400,
      );

  Widget showLogo() => Image.asset('images/logo.png');
  Widget showQR() => Image.asset('images/Qrr.png');
  Widget showbacode() => Image.asset('images/bacode.png');

  Widget showapp() => Image.asset('images/appname.png');
  Widget titleH1(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: prinaryColor,
        ),
      );

  Widget titleH2(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 27,
          fontWeight: FontWeight.w500,
          color: prinaryColor,
        ),
      );

  Widget titleH3(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 24,
          // fontWeight: FontWeight.bold,
          color: prinaryColor,
        ),
      );
  Widget titleH4(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: prinaryColor,
        ),
      );



      Widget nameApp(String string) => Text(
        "โรงพยาบาลชัยนาทนเรนทร",
        style: TextStyle(
          fontSize: 16,
          // fontWeight: FontWeight.bold,
          color: prinaryColor,
        ),
      );
  Column bar() {
    return Column(
      children: <Widget>[
        ClipPath(
          clipper: Myclipper(),
          child: Container(
            padding: EdgeInsets.only(top: 30.0, left: 30.0, right: 15.0),
            height: 110,
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(
                    0,
                    4,
                  ),
                  blurRadius: 4,
                ),
              ],
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(
                    0xff0baabd,
                  ),
                  Color(
                    0xff0baabd,
                  ),
                ],
                stops: [
                  0.3,
                  1,
                ],
              ),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                Expanded(
                    child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        children: <Widget>[
                          Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 30.0,
                                  ),
                                  Container(
                                    width: 150.0,
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: Image.asset(
                                        'images/person.png',
                                        color: Colors.white,
                                        width: 70.0,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
      ],
    );
  }

  MyStyle();
}

Myclipper() {}
