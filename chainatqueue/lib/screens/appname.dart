import 'package:chainatqueue/screens/haveappointment.dart';
import 'package:chainatqueue/screens/login.dart';
import 'package:chainatqueue/utility/buttom_bar.dart';
import 'package:chainatqueue/utility/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  double screen;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Appointment'),
      // ),
      backgroundColor: Color(
        0xff089EAD,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 185.0,
                  ),
                  InkWell(
                    onTap: () {
                      MaterialPageRoute route =
                          MaterialPageRoute(builder: (value) => Login());
                      Navigator.push(context, route);
                    },
                    child: Container(
                      width: 350,
                      height: 350,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/applogo1.png'))),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 120.0)),
                  Text(
                    'โรงพยาบาลชัยนาทนเรนทร',
                    style: GoogleFonts.prompt(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
