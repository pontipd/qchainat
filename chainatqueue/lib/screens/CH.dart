import 'dart:convert';

import 'package:chainatqueue/models/getDepartment.dart';
import 'package:chainatqueue/models/gethresult.dart';
import 'package:chainatqueue/models/getserviceList.dart';
import 'package:chainatqueue/models/hresulty.dart';
import 'package:chainatqueue/screens/CBC.dart';
import 'package:chainatqueue/screens/bookQresHN.dart';
import 'package:chainatqueue/screens/hresultdetil.dart';
import 'package:chainatqueue/utility/buttom_bar.dart';
import 'package:chainatqueue/utility/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:kioskregis/model/department.dart';
// import 'package:kioskregis/model/getserviceList.dart';
// import 'package:kioskregis/mystyle.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';

class G extends StatefulWidget {
  final GetHresult result;
  final hresult;
  final Hresulty hresulty;

  int index = 0;
 G({Key key, this.result, this.hresult, this.hresulty})
      : super(key: key);

  @override
  _GState createState() => _GState();
}

class _GState extends State<G> {
  set floatingActionButton(Container floatingActionButton) {}
  Hresulty hresulty;
  var a;

  @override
  Widget build(BuildContext context) {
    var results = widget.hresulty;
    print('sssssss $results');

    // ptname = "${widget.ptname}";
    // hn = "${widget.hn}";
    // cid = "${widget.cid}";
    // age = "${widget.age}";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "ผลการตรวจห้องปฏิบัติการ",
          style: GoogleFonts.prompt(
            fontSize: 24.0,
            color: Color(
              0xff116EA8,
            ),
          ),
        ),
        leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.grey),

onPressed: () {
                            Navigator.pop(context);
                          }
  //  onPressed: () => 
  //   Navigator.of(context).pop(),

    
  ), 
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.90,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.90,
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  SizedBox(
                    height: 5.0,
                  ),
                  Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          // Icon(Icons.date_range_outlined),

                          Padding(padding: EdgeInsets.only(top: 7.0)),
                          Row(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                      child: Text(
                                        'CBC     ',
                                        // "$departmentName",
                                        style: TextStyle(
                                          color: Color(
                                            0xff116EA8,
                                          ),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Kanit",
                                        ),

                                        // textAlign: TextAlign.left,
                                      ),
                                      width: 150),
                                  SizedBox(
                                      child: Text(
                                        '    ความสมบูรณ์ของเม็ดเลือด      ',
                                        // "$departmentName",
                                        style: TextStyle(
                                          color: Color(
                                            0xff116EA8,
                                          ),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Kanit",
                                        ),
                                      ),
                                      width: 190),
                                ],
                              ),
                              // Column(children: [
                              //  SizedBox(
                              //         child: Divider(
                              //   height: 10,
                              //   thickness: 1.25,
                              //   color: Colors.grey[400]
                              //   ),
                              //  ),
                              // ],),
                              Padding(padding: EdgeInsets.only(top: 17.0)),
                              Column(
                                children: [
                                
                                
                                   Row(
          
            children: <Widget>[
             SizedBox(width: 35.0),
              TextButton(
                child: Text('    รายละเอียด',
                style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16, color: Colors.orange),
              
                ),
                onPressed: () {
                
                     Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child:CBC(
                              hresulty:results,
                            ),),);
                   
                },
               
              ),
            
            ],
          ),
                                    
                                    
                                  
                                ],
                              ),
                            ],
                          ),

                          // Padding(padding: EdgeInsets.only(top: 7.0)),
                          SizedBox(
                            height: 20.0,
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          // Icon(Icons.date_range_outlined),

                          Padding(padding: EdgeInsets.only(top: 7.0)),
                          Row(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                      child: Text(
                                        'FBS     ',
                                        // "$departmentName",
                                        style: TextStyle(
                                          color: Color(
                                            0xff116EA8,
                                          ),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Kanit",
                                        ),

                                        // textAlign: TextAlign.left,
                                      ),
                                      width: 150),
                                  SizedBox(
                                      child: Text(
                                        '    น้ำตาลในเลือด      ',
                                        // "$departmentName",
                                        style: TextStyle(
                                          color: Color(
                                            0xff116EA8,
                                          ),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Kanit",
                                        ),
                                      ),
                                      width: 190),
                                ],
                              ),
                              // Column(children: [
                              //  SizedBox(
                              //         child: Divider(
                              //   height: 10,
                              //   thickness: 1.25,
                              //   color: Colors.grey[400]
                              //   ),
                              //  ),
                              // ],),
                              Padding(padding: EdgeInsets.only(top: 17.0)),
                              Column(
                                children: [
                                  SizedBox(
                                      child: {widget.hresulty.FBS} ==
                                                      null
                                                  ? Text(' - ')
                                                  : Text(
                                                      '${widget.hresulty.FBS}',
                                                      // "$departmentName",
                                                      style: GoogleFonts.kanit(
                                                        fontSize: 15.0,
                                                        color: Color(
                                                          0xff116EA8,
                                                        ),
                                                      ),

                                                      textAlign: TextAlign.right,
                                                    ),
                                      width: 70),
                                  SizedBox(
                                    child: Text(
                                      '                     [ค่าปกติ]',
                                      // "$departmentName",
                                      style: TextStyle(
                                        color: Color(
                                          0xff828282,
                                        ),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Kanit",
                                      ),
                                    ),
                                    width: 150,
                                  ),
                                ],
                              ),
                            ],
                          ),

                          // Padding(padding: EdgeInsets.only(top: 7.0)),
                          SizedBox(
                            height: 20.0,
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          // Icon(Icons.date_range_outlined),

                          Padding(padding: EdgeInsets.only(top: 7.0)),
                          Row(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                      child: Text(
                                        'Cholesteral    ',
                                        // "$departmentName",
                                        style: TextStyle(
                                          color: Color(
                                            0xff116EA8,
                                          ),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Kanit",
                                        ),

                                        // textAlign: TextAlign.left,
                                      ),
                                      width: 150),
                                  SizedBox(
                                      child: Text(
                                        '    ไขมันในเลือด      ',
                                        // "$departmentName",
                                        style: TextStyle(
                                          color: Color(
                                            0xff116EA8,
                                          ),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Kanit",
                                        ),
                                      ),
                                      width: 190),
                                ],
                              ),
                              // Column(children: [
                              //  SizedBox(
                              //         child: Divider(
                              //   height: 10,
                              //   thickness: 1.25,
                              //   color: Colors.grey[400]
                              //   ),
                              //  ),
                              // ],),
                              Padding(padding: EdgeInsets.only(top: 17.0)),
                              Column(
                                children: [
                                  SizedBox(
                                      child: {widget.hresulty.Cholesterol} ==
                                                      null
                                                  ? Text(' - ')
                                                  : Text(
                                                      '${widget.hresulty.Cholesterol}',
                                                      // "$departmentName",
                                                      style: GoogleFonts.kanit(
                                                        fontSize: 15.0,
                                                        color: Color(
                                                          0xff116EA8,
                                                        ),
                                                      ),

                                                      textAlign: TextAlign.right,
                                                    ),
                                      width: 70),
                                  SizedBox(
                                    child: Text(
                                      '                     [ค่าปกติ]',
                                      // "$departmentName",
                                      style: TextStyle(
                                        color: Color(
                                          0xff828282,
                                        ),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Kanit",
                                      ),
                                    ),
                                    width: 150,
                                  ),
                                ],
                              ),
                            ],
                          ),

                          // Padding(padding: EdgeInsets.only(top: 7.0)),
                          SizedBox(
                            height: 20.0,
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          // Icon(Icons.date_range_outlined),

                          Padding(padding: EdgeInsets.only(top: 7.0)),
                          Row(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                      child: Text(
                                        'HDL    ',
                                        // "$departmentName",
                                        style: TextStyle(
                                          color: Color(
                                            0xff116EA8,
                                          ),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Kanit",
                                        ),

                                        // textAlign: TextAlign.left,
                                      ),
                                      width: 150),
                                  SizedBox(
                                      child: Text(
                                        '    ไขมันชนิดดี      ',
                                        // "$departmentName",
                                        style: TextStyle(
                                          color: Color(
                                            0xff116EA8,
                                          ),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Kanit",
                                        ),
                                      ),
                                      width: 190),
                                ],
                              ),
                              // Column(children: [
                              //  SizedBox(
                              //         child: Divider(
                              //   height: 10,
                              //   thickness: 1.25,
                              //   color: Colors.grey[400]
                              //   ),
                              //  ),
                              // ],),
                              Padding(padding: EdgeInsets.only(top: 17.0)),
                              Column(
                                children: [
                                  SizedBox(
                                      child: {widget.hresulty.HDL} ==
                                                      null
                                                  ? Text(' - ')
                                                  : Text(
                                                      '${widget.hresulty.HDL}',
                                                      // "$departmentName",
                                                      style: GoogleFonts.kanit(
                                                        fontSize: 15.0,
                                                        color: Color(
                                                          0xff116EA8,
                                                        ),
                                                      ),

                                                      textAlign: TextAlign.right,
                                                    ),
                                      width: 70),
                                  SizedBox(
                                    child: Text(
                                      '                     [ค่าปกติ]',
                                      // "$departmentName",
                                      style: TextStyle(
                                        color: Color(
                                          0xff828282,
                                        ),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Kanit",
                                      ),
                                    ),
                                    width: 150,
                                  ),
                                ],
                              ),
                            ],
                          ),

                          // Padding(padding: EdgeInsets.only(top: 7.0)),
                          SizedBox(
                            height: 20.0,
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          // Icon(Icons.date_range_outlined),

                          Padding(padding: EdgeInsets.only(top: 7.0)),
                          Row(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                      child: Text(
                                        'LDL     ',
                                        // "$departmentName",
                                        style: TextStyle(
                                          color: Color(
                                            0xff116EA8,
                                          ),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Kanit",
                                        ),

                                        // textAlign: TextAlign.left,
                                      ),
                                      width: 150),
                                  SizedBox(
                                      child: Text(
                                        '    ไขมันชนิดไม่ดี      ',
                                        // "$departmentName",
                                        style: TextStyle(
                                          color: Color(
                                            0xff116EA8,
                                          ),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Kanit",
                                        ),
                                      ),
                                      width: 190),
                                ],
                              ),
                              // Column(children: [
                              //  SizedBox(
                              //         child: Divider(
                              //   height: 10,
                              //   thickness: 1.25,
                              //   color: Colors.grey[400]
                              //   ),
                              //  ),
                              // ],),
                              Padding(padding: EdgeInsets.only(top: 17.0)),
                              Column(
                                children: [
                                  SizedBox(
                                      child: {widget.hresulty.LDL} ==
                                                      null
                                                  ? Text(' - ')
                                                  : Text(
                                                      '${widget.hresulty.LDL}',
                                                      // "$departmentName",
                                                      style: GoogleFonts.kanit(
                                                        fontSize: 15.0,
                                                        color: Color(
                                                          0xff116EA8,
                                                        ),
                                                      ),

                                                      textAlign: TextAlign.right,
                                                    ),
                                      width: 70),
                                  SizedBox(
                                    child: Text(
                                      '                     [ค่าปกติ]',
                                      // "$departmentName",
                                      style: TextStyle(
                                        color: Color(
                                          0xff828282,
                                        ),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Kanit",
                                      ),
                                    ),
                                    width: 150,
                                  ),
                                ],
                              ),
                            ],
                          ),

                          // Padding(padding: EdgeInsets.only(top: 7.0)),
                          SizedBox(
                            height: 20.0,
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          // Icon(Icons.date_range_outlined),

                          Padding(padding: EdgeInsets.only(top: 7.0)),
                          Row(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                      child: Text(
                                        '',
                                        // widget.hresulty.FBS == null
                                        //     ? " "
                                        //     : widget.hresulty.FBS,
                                        // "$departmentName",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.0,
                                          color: Color(
                                            0xff116EA8,
                                          ),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      width: 150),
                                  SizedBox(
                                      child: Text(
                                        '    การทำงานของตับ      ',
                                        // "$departmentName",
                                        style: TextStyle(
                                          color: Color(
                                            0xff116EA8,
                                          ),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Kanit",
                                        ),
                                      ),
                                      width: 190),
                                ],
                              ),
                              // Column(children: [
                              //  SizedBox(
                              //         child: Divider(
                              //   height: 10,
                              //   thickness: 1.25,
                              //   color: Colors.grey[400]
                              //   ),
                              //  ),
                              // ],),
                              Padding(padding: EdgeInsets.only(top: 17.0)),
                              Column(
                                children: [
                                   SizedBox(
                                      child: {widget.hresulty.Alkaline_Phosphatse} ==
                                                      null
                                                  ? Text(' - ')
                                                  : Text(
                                                      '${widget.hresulty.Alkaline_Phosphatse}',
                                                      // "$departmentName",
                                                      style: GoogleFonts.kanit(
                                                        fontSize: 15.0,
                                                        color: Color(
                                                          0xff116EA8,
                                                        ),
                                                      ),

                                                      textAlign: TextAlign.right,
                                                    ),
                                      width: 70),
                                  SizedBox(
                                    child: Text(
                                      '                     [ค่าปกติ]',
                                      // "$departmentName",
                                      style: TextStyle(
                                        color: Color(
                                          0xff828282,
                                        ),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Kanit",
                                      ),
                                    ),
                                    width: 150,
                                  ),
                                ],
                              ),
                            ],
                          ),

                          // Padding(padding: EdgeInsets.only(top: 7.0)),
                          SizedBox(
                            height: 20.0,
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          // Icon(Icons.date_range_outlined),

                          Padding(padding: EdgeInsets.only(top: 7.0)),
                          Row(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                      child: Text(
                                        'SGOT     ',
                                        // "$departmentName",
                                        style: TextStyle(
                                          color: Color(
                                            0xff116EA8,
                                          ),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Kanit",
                                        ),

                                        // textAlign: TextAlign.left,
                                      ),
                                      width: 150),
                                  SizedBox(
                                      child: Text(
                                        '    การทำงานของตับ      ',
                                        // "$departmentName",
                                        style: TextStyle(
                                          color: Color(
                                            0xff116EA8,
                                          ),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Kanit",
                                        ),
                                      ),
                                      width: 190),
                                ],
                              ),
                              // Column(children: [
                              //  SizedBox(
                              //         child: Divider(
                              //   height: 10,
                              //   thickness: 1.25,
                              //   color: Colors.grey[400]
                              //   ),
                              //  ),
                              // ],),
                              Padding(padding: EdgeInsets.only(top: 17.0)),
                              Column(
                                children: [
                                   SizedBox(
                                      child: {widget.hresulty.SGOT} ==
                                                      null
                                                  ? Text(' - ')
                                                  : Text(
                                                      '${widget.hresulty.SGOT}',
                                                      // "$departmentName",
                                                      style: GoogleFonts.kanit(
                                                        fontSize: 15.0,
                                                        color: Color(
                                                          0xff116EA8,
                                                        ),
                                                      ),

                                                      textAlign: TextAlign.right,
                                                    ),
                                      width: 70),
                                  SizedBox(
                                    child: Text(
                                      '                     [ค่าปกติ]',
                                      // "$departmentName",
                                      style: TextStyle(
                                        color: Color(
                                          0xff828282,
                                        ),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Kanit",
                                      ),
                                    ),
                                    width: 150,
                                  ),
                                ],
                              ),
                            ],
                          ),

                          // Padding(padding: EdgeInsets.only(top: 7.0)),
                          SizedBox(
                            height: 20.0,
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          // Icon(Icons.date_range_outlined),

                          Padding(padding: EdgeInsets.only(top: 7.0)),
                          Row(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                      child: Text(
                                        'Uric Acid     ',
                                        // "$departmentName",
                                        style: TextStyle(
                                          color: Color(
                                            0xff116EA8,
                                          ),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Kanit",
                                        ),

                                        // textAlign: TextAlign.left,
                                      ),
                                      width: 150),
                                  SizedBox(
                                      child: Text(
                                        '    กรดยูริก      ',
                                        // "$departmentName",
                                        style: TextStyle(
                                          color: Color(
                                            0xff116EA8,
                                          ),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Kanit",
                                        ),
                                      ),
                                      width: 190),
                                ],
                              ),
                              // Column(children: [
                              //  SizedBox(
                              //         child: Divider(
                              //   height: 10,
                              //   thickness: 1.25,
                              //   color: Colors.grey[400]
                              //   ),
                              //  ),
                              // ],),
                              Padding(padding: EdgeInsets.only(top: 17.0)),
                              Column(
                                children: [
                                  SizedBox(
                                      child: {widget.hresulty.Uric_Acid} ==
                                                      null
                                                  ? Text(' - ')
                                                  : Text(
                                                      '${widget.hresulty.Uric_Acid}',
                                                      // "$departmentName",
                                                      style: GoogleFonts.kanit(
                                                        fontSize: 15.0,
                                                        color: Color(
                                                          0xff116EA8,
                                                        ),
                                                      ),

                                                      textAlign: TextAlign.right,
                                                    ),
                                      width: 70),
                                  SizedBox(
                                    child: Text(
                                      '                     [ค่าปกติ]',
                                      // "$departmentName",
                                      style: TextStyle(
                                        color: Color(
                                          0xff828282,
                                        ),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Kanit",
                                      ),
                                    ),
                                    width: 150,
                                  ),
                                ],
                              ),
                            ],
                          ),

                          // Padding(padding: EdgeInsets.only(top: 7.0)),
                          SizedBox(
                            height: 20.0,
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          // Icon(Icons.date_range_outlined),

                          Padding(padding: EdgeInsets.only(top: 7.0)),
                          Row(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                      child: Text(
                                        'ไวรัสตับอักเสบบี    ',
                                        // "$departmentName",
                                        style: TextStyle(
                                          color: Color(
                                            0xff116EA8,
                                          ),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Kanit",
                                        ),

                                        // textAlign: TextAlign.left,
                                      ),
                                      width: 150),
                                  SizedBox(
                                      child: Text(
                                        '          ',
                                        // "$departmentName",
                                        style: TextStyle(
                                          color: Color(
                                            0xff116EA8,
                                          ),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Kanit",
                                        ),
                                      ),
                                      width: 190),
                                ],
                              ),
                              // Column(children: [
                              //  SizedBox(
                              //         child: Divider(
                              //   height: 10,
                              //   thickness: 1.25,
                              //   color: Colors.grey[400]
                              //   ),
                              //  ),
                              // ],),
                              Padding(padding: EdgeInsets.only(top: 17.0)),
                              Column(
                                children: [
                                  SizedBox(
                                      child: Text(
                                        '                     xxxxx',
                                        // "$departmentName",
                                        style: TextStyle(
                                          color: Color(
                                            0xff2D9CDB,
                                          ),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Kanit",
                                        ),
                                      ),
                                      width: 150),
                                  SizedBox(
                                    child: Text(
                                      '                     [ค่าปกติ]',
                                      // "$departmentName",
                                      style: TextStyle(
                                        color: Color(
                                          0xff828282,
                                        ),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Kanit",
                                      ),
                                    ),
                                    width: 150,
                                  ),
                                ],
                              ),
                            ],
                          ),

                          // Padding(padding: EdgeInsets.only(top: 7.0)),
                          SizedBox(
                            height: 20.0,
                          )
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
