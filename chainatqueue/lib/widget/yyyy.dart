import 'dart:convert';

import 'package:chainatqueue/models/getDepartment.dart';
import 'package:chainatqueue/models/gethresult.dart';
import 'package:chainatqueue/models/getserviceList.dart';
import 'package:chainatqueue/models/hresulty.dart';
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

class UA extends StatefulWidget {
  final GetHresult result;
  final hresult;
  final Hresulty hresulty;

  int index = 0;
  UA({Key key, this.result, this.hresult, this.hresulty}) : super(key: key);

  @override
  _UAState createState() => _UAState();
}

class _UAState extends State<UA> {
  set floatingActionButton(Container floatingActionButton) {}
  Hresulty hresulty;
  var a;

  Widget _CardItemRight(String title, String description) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            flex: 15,
            child: Text(
              '  $title',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
            )),
        Expanded(
            flex: 60,
            child: Text(
              description,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            )),
      ],
    );
  }

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
          "ผลตรวจสุขภาพประจำปี",
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
                          Padding(padding: EdgeInsets.only(top: 7.0)),
                          Row(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                      child: Text(
                                        'UA_Glucose     ',
                                        // "$departmentName",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          color: Color(
                                           0xff116EA8,
                                          ),
                                        ),
                                      ),
                                      width:170),
                                  SizedBox(
                                      child: Text(
                                        '  ตรวจปัสสาวะ      ',
                                        // "$departmentName",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          color: Color(
                                            0xff116EA8,
                                          ),
                                        ),
                                      ),
                                      width: 200),
                                ],
                              ),
                              Padding(padding: EdgeInsets.only(top: 17.0)),
                              Column(
                                children: [
                                  SizedBox(
                                      child: {widget.hresulty.UA_Glucose} ==
                                              null
                                          ? Text(' - ')
                                          : Text(
                                              '${widget.hresulty.UA_Glucose}',
                                              // "$departmentName",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                                color: Color(
                                                  0xff116EA8,
                                                ),
                                              ),

                                              textAlign: TextAlign.right,
                                            ),
                                      width: 130),
                                  SizedBox(
                                    child: Text(
                                      ' [ค่าปกติ]',
                                      // "$departmentName",
                                      style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                                color: Color(
                                                  0xff828282,
                                                ),
                                              ),
                                              textAlign: TextAlign.right,

                                    ),
                                    width: 120,
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
                          Padding(padding: EdgeInsets.only(top: 7.0)),
                          Row(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                      child: Text(
                                        'UA_Protein     ',
                                        // "$departmentName",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          color: Color(
                                            0xff116EA8,
                                          ),
                                        ),
                                      ),
                                      width: 170),
                                  SizedBox(
                                      child: Text(
                                        '  ตรวจปัสสาวะ      ',
                                        // "$departmentName",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          color: Color(
                                            0xff116EA8,
                                          ),
                                        ),
                                      ),
                                      width: 200),
                                ],
                              ),
                              Padding(padding: EdgeInsets.only(top: 17.0)),
                              Column(
                                children: [
                                  SizedBox(
                                      child: {widget.hresulty.UA_Protein} ==
                                              null
                                          ? Text(' - ')
                                          : Text(
                                              '${widget.hresulty.UA_Protein}',
                                              // "$departmentName",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                                color: Color(
                                                  0xff116EA8,
                                                ),
                                              ),

                                              textAlign: TextAlign.right,
                                            ),
                                      width: 130),
                                  SizedBox(
                                    child: Text(
                                      ' [ค่าปกติ]',
                                      // "$departmentName",
                                      style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                                color: Color(
                                                  0xff828282,
                                                ),
                                              ),
                                              textAlign: TextAlign.right,

                                    ),
                                    width: 120,
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
                          Padding(padding: EdgeInsets.only(top: 7.0)),
                          Row(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                      child: Text(
                                        'UA_pH     ',
                                        // "$departmentName",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          color: Color(
                                            0xff116EA8,
                                          ),
                                        ),
                                      ),
                                      width: 170),
                                  SizedBox(
                                      child: Text(
                                        '  ตรวจปัสสาวะ      ',
                                        // "$departmentName",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          color: Color(
                                            0xff116EA8,
                                          ),
                                        ),
                                      ),
                                      width: 200),
                                ],
                              ),
                              Padding(padding: EdgeInsets.only(top: 17.0)),
                              Column(
                                children: [
                                  SizedBox(
                                      child: {widget.hresulty.UA_pH} ==
                                              null
                                          ? Text(' - ')
                                          : Text(
                                              '${widget.hresulty.UA_pH}',
                                              // "$departmentName",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                                color: Color(
                                                  0xff116EA8,
                                                ),
                                              ),

                                              textAlign: TextAlign.right,
                                            ),
                                      width: 90),
                                  SizedBox(
                                    child: Text(
                                      ' [ค่าปกติ]',
                                      // "$departmentName",
                                      style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                                color: Color(
                                                  0xff828282,
                                                ),
                                              ),
                                              textAlign: TextAlign.right,

                                    ),
                                    width: 130,
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
                          Padding(padding: EdgeInsets.only(top: 7.0)),
                          Row(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                      child: Text(
                                        'UA_SpGr     ',
                                        // "$departmentName",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          color: Color(
                                            0xff116EA8,
                                          ),
                                        ),
                                      ),
                                      width: 170),
                                  SizedBox(
                                      child: Text(
                                        '  ตรวจปัสสาวะ      ',
                                        // "$departmentName",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          color: Color(
                                            0xff116EA8,
                                          ),
                                        ),
                                      ),
                                      width: 200),
                                ],
                              ),
                              Padding(padding: EdgeInsets.only(top: 17.0)),
                              Column(
                                children: [
                                  SizedBox(
                                      child: {widget.hresulty.UA_SpGr} ==
                                              null
                                          ? Text(' - ')
                                          : Text(
                                              '${widget.hresulty.UA_SpGr}',
                                              // "$departmentName",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                                color: Color(
                                                  0xff116EA8,
                                                ),
                                              ),

                                              textAlign: TextAlign.right,
                                            ),
                                      width: 90),
                                  SizedBox(
                                    child: Text(
                                      ' [ค่าปกติ]',
                                      // "$departmentName",
                                      style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                                color: Color(
                                                  0xff828282,
                                                ),
                                              ),
                                              textAlign: TextAlign.right,

                                    ),
                                    width: 130,
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










