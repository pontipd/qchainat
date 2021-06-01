import 'package:chainatqueue/screens/Selectdepartment.dart';
import 'package:chainatqueue/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login.dart';

class ConfirmDentist extends StatefulWidget {
  @override
  _ConfirmDentistState createState() => _ConfirmDentistState();
}

class _ConfirmDentistState extends State<ConfirmDentist> {
  set floatingActionButton(Container floatingActionButton) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.90,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.90,
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 30.0)),
                  Row(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.arrow_back),
                          iconSize: 36.0,
                          color: Color(
                            0xff828282,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      Text(
                        'จองคิว',
                        style: GoogleFonts.prompt(
                          fontSize: 24.0,
                          color: Color(
                            0xff116EA8,
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
                      "                             ตรวจสอบรายการ",
                      style: GoogleFonts.prompt(
                        fontSize: 18.0,
                        color: Color(
                          0xff116EA8,
                        ),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    width: 450,
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Divider(
                    height: 15,
                    thickness: 1.0,
                    color: Color(
                      0xfff828282,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Card(
                    color: Colors.grey[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          SizedBox(
                              child: Text(
                                "คลินิกทันตกรรม",
                                style: TextStyle(
                                  color: Color(
                                    0xff116EA8,
                                  ),
                                  fontSize: 35,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Kanit",
                                ),
                                textAlign: TextAlign.center,
                              ),
                              width: MediaQuery.of(context).size.width * 0.85),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: Divider(
                                height: 15,
                                thickness: 1.25,
                                color: Colors.grey[400]),
                          ),
                          Padding(padding: EdgeInsets.only(top: 7.0)),
                          SizedBox(
                            child: Text(
                              "ตรวจฟันทั่วไป",
                              style: TextStyle(
                                color: Color(
                                  0xff116EA8,
                                ),
                                fontSize: 22,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Kanit",
                              ),
                              textAlign: TextAlign.center,
                            ),
                            width: MediaQuery.of(context).size.width * 0.85,
                          ),
                          Padding(padding: EdgeInsets.only(top: 7.0)),
                          SizedBox(
                            height: 40.0,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  floatingActionButton = Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: 50.0,
                    child: FloatingActionButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.5)),
                      clipBehavior: Clip.antiAlias,
                      onPressed: () {
                        // MaterialPageRoute route =
                        //     MaterialPageRoute(builder: (value) => Department());
                        // Navigator.push(context, route);
                      },
                      backgroundColor: Color(
                        0xff2D9CDB,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                          ),
                          Text(
                            'ยืนยันการจองคิว',
                            style: GoogleFonts.prompt(fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
