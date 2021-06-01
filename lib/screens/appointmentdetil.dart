import 'dart:convert';

import 'package:chainatqueue/models/appoint.dart';
import 'package:chainatqueue/models/getAppointment.dart';
import 'package:chainatqueue/models/getDepartment.dart';
import 'package:chainatqueue/models/getserviceList.dart';
import 'package:chainatqueue/screens/bookQresHN.dart';
import 'package:chainatqueue/screens/page1.dart';
import 'package:chainatqueue/screens/queue.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:kioskregis/model/department.dart';
// import 'package:kioskregis/model/getserviceList.dart';
// import 'package:kioskregis/mystyle.dart';
import 'package:http/http.dart' as http;

class Appointdetail extends StatefulWidget {
  final String hn, ptname, cid, age, pt, inputHn;
  GetAppointMent getAppointment;
  GetAppointMent appointMent;
  final Appoint appoint;

  int index = 0;

  Appointdetail(
      {Key key,
      this.getAppointment,
      this.appoint,
      this.hn,
      this.appointMent,
      this.inputHn,
      this.age,
      this.cid,
      this.ptname,
      this.pt,
      this.index})
      : super(key: key);

  @override
  _AppointdetailState createState() => _AppointdetailState();
}

class _AppointdetailState extends State<Appointdetail> {
  set floatingActionButton(Container floatingActionButton) {}
 Appoint appoint;
  GetDepartments getDepartment;

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
    // ptname = "${widget.ptname}";
    // hn = "${widget.hn}";
    // cid = "${widget.cid}";
    // age = "${widget.age}";
    return Scaffold(

      appBar: AppBar(
      //  backgroundColor: Colors.white,
        title: Text("รายละเอียดการนัดหมาย",
        style: GoogleFonts.prompt(
                                fontSize: 24.0,
                                color: Colors.white,
                              ),),

                        leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.white),

onPressed: () {
                            Navigator.pop(context);
                          }
  //  onPressed: () => 
  //   Navigator.of(context).pop(),

    
  ), 

  centerTitle: true,
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
                        // Padding(padding: EdgeInsets.only(top: 30.0)),
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
                        //       'รายละเอียดการนัดหมาย',
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
                          height: 20.0,
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
                                SizedBox(
                                    child: Text(
                                      widget.appoint.pt_name == null
                                  ? " "
                                  : widget.appoint.pt_name,
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
                                    width: MediaQuery.of(context).size.width *
                                        0.85),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
                                  child: Divider(
                                      height: 15,
                                      thickness: 1.25,
                                      color: Colors.grey[400]),
                                ),
                                Padding(padding: EdgeInsets.only(top: 7.0)),
                                SizedBox(
                                  child: Text(
                                   widget.appoint.hn,
                                    style: TextStyle(
                                      color: Color(
                                        0xff4F4F4F,
                                      ),
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Kanit",
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
                                ),
                                SizedBox(
                                  child: Text(
                                    widget.appoint.appoint_date == null
                                  ? "-"
                                  : widget.appoint.appoint_date,
                                    //"วันที่ จ. 15 กุมภาพันธ์ 2564\n10.00 น. ",
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
                                ),
                                SizedBox(
                                  child: Text(
                                     widget.appoint.doctor_name == null
                                  ? "-"
                                  : widget.appoint.doctor_name ,
                                    style: TextStyle(
                                      color: Color(
                                        0xff4F4F4F,
                                      ),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Kanit",
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
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
                        Column(
                          children: [
                            SizedBox(
                                child: Text(
                                  'สถานที่',
                                  // "$departmentName",
                                  style: TextStyle(
                                    color: Color(
                                      0xff4F4F4F,
                                    ),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Kanit",
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                width:
                                    MediaQuery.of(context).size.width * 0.85),
                            SizedBox(
                                child: Text(
                                widget.appoint.department == null
                                  ? "-"
                                  :widget.appoint.department ,
                                  // "$departmentName",
                                  style: TextStyle(
                                    color: Color(
                                      0xff116EA8,
                                    ),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Kanit",
                                  ),
                                ),
                                width:
                                    MediaQuery.of(context).size.width * 0.85),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.85,
                              child: Divider(
                                  height: 15,
                                  thickness: 1.25,
                                  color: Colors.grey[400]),
                            ),
                            SizedBox(
                                child: Text(
                                  'การเตรียมตัว',
                                  // "$departmentName",
                                  style: TextStyle(
                                    color: Color(
                                      0xff4F4F4F,
                                    ),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Kanit",
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                width:
                                    MediaQuery.of(context).size.width * 0.85),
                            SizedBox(
                                child: Text(
                                  widget.appoint.appoint_preparing == null
                                  ? "-"
                                  : widget.appoint.appoint_preparing,
                                  // "$departmentName",
                                  style: TextStyle(
                                    color: Color(
                                      0xff116EA8,
                                    ),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Kanit",
                                  ),
                                ),
                                width:
                                    MediaQuery.of(context).size.width * 0.85),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.85,
                              child: Divider(
                                  height: 15,
                                  thickness: 1.25,
                                  color: Colors.grey[400]),
                            ),
                            SizedBox(
                                child: Text(
                                  'สาเหตุที่นัด',
                                  // "$departmentName",
                                  style: TextStyle(
                                    color: Color(
                                      0xff4F4F4F,
                                    ),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Kanit",
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                width:
                                    MediaQuery.of(context).size.width * 0.85),
                            SizedBox(
                                child: Text(
                                widget.appoint.appoint_reason == null
                                  ? " "
                                  : widget.appoint.appoint_reason,
                                 
                                  // "$departmentName",
                                  style: TextStyle(
                                    color: Color(
                                      0xff116EA8,
                                    ),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Kanit",
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                                width:
                                    MediaQuery.of(context).size.width * 0.85),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.85,
                              child: Divider(
                                  height: 15,
                                  thickness: 1.25,
                                  color: Colors.grey[400]),
                            ),
                            SizedBox(
                                child: Text(
                                  'สถานะ',
                                  // "$departmentName",
                                  style: TextStyle(
                                    color: Color(
                                      0xff4F4F4F,
                                    ),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Kanit",
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                width:
                                    MediaQuery.of(context).size.width * 0.85),
                            SizedBox(
                                child: widget.appoint.appoint_status
                                            .toString() ==
                                        'F'
                                    ? Text(
                                        'ยังไม่ได้ลงทะเบียนตรวจรักษา',
                                        // "$departmentName",
                                        style: TextStyle(
                                          color: Color(
                                            0xff116EA8,
                                          ),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Kanit",
                                        ),
                                        textAlign: TextAlign.justify,
                                      )
                                    : Text(
                                        'ลงทะเบียนตรวจรักษาแล้ว',
                                        // "$departmentName",
                                        style: TextStyle(
                                          color: Color(
                                            0xff116EA8,
                                          ),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Kanit",
                                        ),
                                       textAlign: TextAlign.justify,
                                      ),
                                      
                                width:
                                    MediaQuery.of(context).size.width * 0.85),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.85,
                              child: Divider(
                                  height: 15,
                                  thickness: 1.25,
                                  color: Colors.grey[400]),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: 10.0)),
                        floatingActionButton = Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: 50.0,
                          child: FloatingActionButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.5)),
                            clipBehavior: Clip.antiAlias,
                            onPressed: () {
                              MaterialPageRoute route = MaterialPageRoute(
                                  builder: (value) => BookgueueresHN());
                              Navigator.push(context, route);
                            },
                            backgroundColor: Color(
                            0xff089EAD,
                          ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
                                ),
                                Text(
                                  'โทรหาคลินิก',
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
              ),),
    
    );
  }
}
