import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyStyle {
  Color darkColor = Colors.blue.shade500;
  Color primaryColor = Colors.blue.shade700;
  SizedBox mySizeBox() => SizedBox(
        width: 8.0,
        height: 16.0,
      );

  Widget titleCenter(String string) {
    return Center(
      child: Text(
        string,
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  BoxDecoration boxDecoration(String namePic) {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage('images/$namePic'),
        fit: BoxFit.cover,
      ),
    );
  }

  Text showText(String title) => Text(
        title,
        style: TextStyle(
          fontSize: 24.0,
          color: Colors.blue.shade800,
          fontWeight: FontWeight.bold,
        ),
      );
  Container showLogo() {
    return Container(
      width: 120.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Container shopDetail() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "[ชื่อร้านค้า] ",
            style: GoogleFonts.prompt(
              color: Color(
                0xf7ffffff,
              ),
              fontSize: 22,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "[ชื่อผู้ขายเศษเหล็ก]",
            style: GoogleFonts.prompt(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Divider(
            height: 15,
            thickness: 1.75,
            color: Colors.white,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "จัดส่ง : [ชื่อโรงงาน] ",
            style: GoogleFonts.prompt(
              color: Color(
                0xf7ffffff,
              ),
              fontSize: 22,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            child: Row(
              children: [
                Text(
                  "[วันที่] ",
                  style: GoogleFonts.prompt(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                Text(
                  "[เวลา] ",
                  style: GoogleFonts.prompt(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                /// stack requires empty non positioned widget to work properly. refer: https://github.com/flutter/flutter/issues/49631#issuecomment-582090992
              ],
            ),
            height: 28,
          ),
          SizedBox(
            height: 5,
          ),
        
        ],
      ),

      // width: MediaQuery.of(context).size.width * 0.9,
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 4,
        bottom: 15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          15,
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(
                  0xff6c92f4,
                ),
                Colors.white,
          ],
          stops: [
            0.95,
            1,
          ],
        ),
      ),
    );
  }

  Column bar() {
    return Column(
      children: <Widget>[
        ClipPath(
          clipper: Myclipper(),
          child: Container(
            padding: EdgeInsets.only(top: 10.0, left: 30.0, right: 15.0),
            height: 175,
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color:Color(
            0x3f000000,
          ),
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
            0x89cbcee5,
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
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: <Widget>[
                          Column(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text('',
                                            // 'SYS',
                                            style: GoogleFonts.inter(
                                                color: Colors.white,
                                                fontSize: 24.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Text(
                                            'Connect',
                                            style: GoogleFonts.inter(
                                                color: Colors.yellow,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      // Align(
                                      //   alignment: Alignment.centerLeft,
                                      //   child: Text(
                                      //     'ชำนาญ รักษาดวง',
                                      //     style: GoogleFonts.prompt(
                                      //         color: Colors.white,
                                      //         fontSize: 18.0),
                                      //   ),
                                      // )
                                    ],
                                  ),
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

class Myclipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    throw UnimplementedError();
  }

  Widget showProgess() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
