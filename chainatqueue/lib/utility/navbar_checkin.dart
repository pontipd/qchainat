import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Navbar1 extends StatefulWidget {
  Navbar1({Key key}) : super(key: key);

  @override
  _Navbar1State createState() => _Navbar1State();
}

class _Navbar1State extends State<Navbar1> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 0.0,
      color: Colors.transparent,
      elevation: 9.0,
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: 70.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
            Color(
                0xff0baabd,
              ),
              Color(
                0x132af4,
              ),
            ],
            stops: [
              1,
              1,
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width / 2 - 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.reply,
                          color: Colors.white,
                          size: 40.0,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        "ย้อนกลับ",
                        style: GoogleFonts.prompt(
                            color: Colors.white, fontSize: 16.0),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
