import 'package:chainatqueue/screens/appointment.dart';
import 'package:chainatqueue/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class NavHome extends StatefulWidget {
  NavHome({Key key}) : super(key: key);

  @override
  _NavHomeState createState() => _NavHomeState();
}

class _NavHomeState extends State<NavHome> {
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
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          MaterialPageRoute route =
                              MaterialPageRoute(builder: (value) => Appointment());
                          Navigator.pushAndRemoveUntil(context, route, (route) => false);
                        },
                        child: Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "หน้าหลัก",
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
