import 'dart:convert';

import 'package:async/async.dart';
import 'package:chainatqueue/models/getDepartment.dart';
import 'package:chainatqueue/models/gethresult.dart';
import 'package:chainatqueue/models/getserviceList.dart';
import 'package:chainatqueue/models/hresulty.dart';
import 'package:chainatqueue/screens/CH.dart';
import 'package:chainatqueue/screens/bookQresHN.dart';
import 'package:chainatqueue/screens/concluderesu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:kioskregis/model/department.dart';
// import 'package:kioskregis/model/getserviceList.dart';
// import 'package:kioskregis/mystyle.dart';
import 'package:http/http.dart' as http;

class Coresults extends StatefulWidget {
  final GetDepartments getDepartment;
  final GetHresult result;
  final hresult;
  final Hresulty hresulty;

  int index = 0;

  Coresults(
      {Key key, this.getDepartment, this.result, this.hresult, this.hresulty})
      : super(key: key);

  @override
  _CoresultsState createState() => _CoresultsState();
}

class _CoresultsState extends State<Coresults> {
  set floatingActionButton(Container floatingActionButton) {}
  String departmentName, servicename;
  GetDepartments getDepartment;
  Hresulty hresulty;

  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getDepartment = widget.getDepartment;

  //   departmentName = getDepartment.servicegroupName;
  //   print(getDepartment);
  //   findDepartmentList();
  // }

  // Future<Null> findDepartmentList() async {
  //   var header = {'Content-Type': 'application/json'};
  //   var url = Uri.parse(
  //       'http://q.chainathospital.org/node/api/get_servicegroup_list');

  //   var response = await http.get(url, headers: header);
  //   var result = json.decode(response.body);
  //   for (var map in result) {
  //    GetserviceList getserviceList = GetserviceList.fromJson(map);
  //       setState(() {
  //         servicename = getserviceList.serviceName;
  //       });

  //   }
  // }

  // Future<Null> findDepartmentList() async {
  //   String url = "http://q.chainathospital.org/node/api/get_service_list/$id";
  //   try {
  //     final http.Response response = await http.Client().get(
  //       url,
  //     );
  //     print('res = $response');
  //     var result = json.decode(response.body);
  //     print('result = $result');
  //     for (var map in result) {
  //       GetserviceList getserviceList = GetserviceList.fromJson(map);
  //       setState(() {
  //         servicename = getserviceList.serviceName;
  //       });
  //     }
  //   } catch (e) {}
  // }

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
         elevation: 0,
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
                
                  // Row(
                  //   children: <Widget>[
                  //     IconButton(
                  //         icon: Icon(Icons.arrow_back),
                  //         iconSize: 36.0,
                  //         color: Color(
                  //           0xff828282,
                  //         ),
                  //         onPressed: () {
                  //           Navigator.pop(context);
                  //         }),
                  //     Text(
                  //       'สรุปผลการตรวจ',
                  //       style: GoogleFonts.prompt(
                  //         fontSize: 24.0,
                  //         color: Color(
                  //           0xff116EA8,
                  //         ),
                  //       ),
                  //     )
                  //   ],
                  // ),
                  SizedBox(
                    height: 10.0,
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
                          Row(
                            children: [
                              Padding(padding: EdgeInsets.only(top: 45.0)),
                              SizedBox(
                                  child: Text(
                                    '  สรุปผลการตรวจ',
                                    // "$departmentName",
                                    style: TextStyle(
                                      color: Color(
                                        0xff116EA8,
                                      ),
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Kanit",
                                    ),

                                    textAlign: TextAlign.center,
                                  ),
                                  width: 300),
                              // SizedBox(
                              //   child: Icon(
                              //     Icons.delete_outline,
                              //     size: 30,
                              //   ),
                              //   width:
                              //       MediaQuery.of(context).size.width - 392.0,
                              // ),
                            ],
                          ),

                          // Icon(Icons.date_range_outlined),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: Divider(
                                height: 10,
                                thickness: 1.25,
                                color: Colors.grey[400]),
                          ),
                          Padding(padding: EdgeInsets.only(top: 7.0)),
                          Row(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                      child: Text(
                                        '       ',
                                        // "$departmentName",
                                        style: TextStyle(
                                          color: Color(
                                            0xff828282,
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
                                        '        ',
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
                                      width: 150),
                                  SizedBox(
                                      child: Text(
                                        ' ',
                                        // "$departmentName",
                                        style: TextStyle(
                                          color: Color(
                                            0xff828282,
                                          ),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Kanit",
                                        ),

                                        textAlign: TextAlign.center,
                                      ),
                                      width: 150),
                                  SizedBox(
                                      child: Text(
                                        ' ',
                                        // "$departmentName",
                                        style: TextStyle(
                                          color: Color(
                                            0xff828282,
                                          ),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Kanit",
                                        ),

                                        // textAlign: TextAlign.center,
                                      ),
                                      width: 150),
                                       SizedBox(
                                      child: Text(
                                        ' ',
                                        // "$departmentName",
                                        style: TextStyle(
                                          color: Color(
                                            0xff828282,
                                          ),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Kanit",
                                        ),

                                        textAlign: TextAlign.center,
                                      ),
                                      width: 150),
                                       SizedBox(
                                      child: Text(
                                        '',
                                        // "$departmentName",
                                        style: TextStyle(
                                          color: Color(
                                            0xff828282,
                                          ),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Kanit",
                                        ),

                                        textAlign: TextAlign.center,
                                      ),
                                      width: 150),
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
                                        '',
                                        // "$departmentName",
                                        style: TextStyle(
                                          color: Color(
                                            0xff2D9CDB,
                                          ),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Kanit",
                                        ),

                                        textAlign: TextAlign.left,
                                      ),
                                      width: 150),
                                  SizedBox(
                                    child: Text(
                                      '',
                                      // "$departmentName",
                                      style: TextStyle(
                                        color: Color(
                                            0xff2D9CDB,
                                          ),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Kanit",
                                      ),

                                      textAlign: TextAlign.left,
                                    ),
                                    width: 150,
                                  ),
                                  SizedBox(
                                    child: Text(
                                      '',
                                      // "$departmentName",
                                      style: TextStyle(
                                        color: Color(
                                            0xff2D9CDB,
                                          ),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Kanit",
                                      ),

                                      textAlign: TextAlign.left,
                                    ),
                                    width: 150,
                                  ),
                                  SizedBox(
                                    child: Text(
                                      '',
                                      // "$departmentName",
                                      style: TextStyle(
                                        color: Color(
                                            0xff2D9CDB,
                                          ),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Kanit",
                                      ),

                                      textAlign: TextAlign.left,
                                    ),
                                    width: 150,
                                  ),
                                  SizedBox(
                                    child: Text(
                                      '',
                                      // "$departmentName",
                                      style: TextStyle(
                                       color: Color(
                                            0xff2D9CDB,
                                          ),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Kanit",
                                      ),

                                      textAlign: TextAlign.left,
                                    ),
                                    width: 150,
                                  ),
                                  SizedBox(
                                    child: Text(
                                      '',
                                      // "$departmentName",
                                      style: TextStyle(
                                        color: Color(
                                            0xff2D9CDB,
                                          ),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Kanit",
                                      ),

                                      textAlign: TextAlign.left,
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
                          Row(
                            children: [
                              Padding(padding: EdgeInsets.only(top: 45.0)),
                              SizedBox(
                                  child: Text(
                                    '  สรุปผลการตรวจ',
                                    // "$departmentName",
                                    style: TextStyle(
                                      color: Color(
                                        0xff116EA8,
                                      ),
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Kanit",
                                    ),

                                    textAlign: TextAlign.center,
                                  ),
                                  width: 300),
                              // SizedBox(
                              //   child: Icon(
                              //     Icons.delete_outline,
                              //     size: 30,
                              //   ),
                              //   width:
                              //       MediaQuery.of(context).size.width - 392.0,
                              // ),
                            ],
                          ),

                          // Icon(Icons.date_range_outlined),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: Divider(
                                height: 10,
                                thickness: 1.25,
                                color: Colors.grey[400]),
                          ),
                          Padding(padding: EdgeInsets.only(top: 7.0)),
                          Row(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                      child: Text(
                                        '       ',
                                        // "$departmentName",
                                        style: TextStyle(
                                          color: Color(
                                            0xff828282,
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
                                        '        ',
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
                                      width: 150),
                                  SizedBox(
                                      child: Text(
                                        ' ',
                                        // "$departmentName",
                                        style: TextStyle(
                                          color: Color(
                                            0xff828282,
                                          ),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Kanit",
                                        ),

                                        textAlign: TextAlign.center,
                                      ),
                                      width: 150),
                                  SizedBox(
                                      child: Text(
                                        ' ',
                                        // "$departmentName",
                                        style: TextStyle(
                                          color: Color(
                                            0xff828282,
                                          ),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Kanit",
                                        ),

                                        // textAlign: TextAlign.center,
                                      ),
                                      width: 150),
                                       SizedBox(
                                      child: Text(
                                        ' ',
                                        // "$departmentName",
                                        style: TextStyle(
                                          color: Color(
                                            0xff828282,
                                          ),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Kanit",
                                        ),

                                        textAlign: TextAlign.center,
                                      ),
                                      width: 150),
                                       SizedBox(
                                      child: Text(
                                        '',
                                        // "$departmentName",
                                        style: TextStyle(
                                          color: Color(
                                            0xff828282,
                                          ),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Kanit",
                                        ),

                                        textAlign: TextAlign.center,
                                      ),
                                      width: 150),
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
                                        '',
                                        // "$departmentName",
                                        style: TextStyle(
                                          color: Color(
                                            0xff2D9CDB,
                                          ),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Kanit",
                                        ),

                                        textAlign: TextAlign.left,
                                      ),
                                      width: 150),
                                  SizedBox(
                                    child: Text(
                                      '',
                                      // "$departmentName",
                                      style: TextStyle(
                                        color: Color(
                                            0xff2D9CDB,
                                          ),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Kanit",
                                      ),

                                      textAlign: TextAlign.left,
                                    ),
                                    width: 150,
                                  ),
                                  SizedBox(
                                    child: Text(
                                      '',
                                      // "$departmentName",
                                      style: TextStyle(
                                        color: Color(
                                            0xff2D9CDB,
                                          ),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Kanit",
                                      ),

                                      textAlign: TextAlign.left,
                                    ),
                                    width: 150,
                                  ),
                                  SizedBox(
                                    child: Text(
                                      '',
                                      // "$departmentName",
                                      style: TextStyle(
                                        color: Color(
                                            0xff2D9CDB,
                                          ),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Kanit",
                                      ),

                                      textAlign: TextAlign.left,
                                    ),
                                    width: 150,
                                  ),
                                  SizedBox(
                                    child: Text(
                                      '',
                                      // "$departmentName",
                                      style: TextStyle(
                                       color: Color(
                                            0xff2D9CDB,
                                          ),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Kanit",
                                      ),

                                      textAlign: TextAlign.left,
                                    ),
                                    width: 150,
                                  ),
                                  SizedBox(
                                    child: Text(
                                      '',
                                      // "$departmentName",
                                      style: TextStyle(
                                        color: Color(
                                            0xff2D9CDB,
                                          ),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Kanit",
                                      ),

                                      textAlign: TextAlign.left,
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
