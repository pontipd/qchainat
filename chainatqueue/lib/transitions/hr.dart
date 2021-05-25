import 'dart:convert';

import 'package:async/async.dart';
import 'package:chainatqueue/models/getDepartment.dart';
import 'package:chainatqueue/models/gethresult.dart';
import 'package:chainatqueue/models/getserviceList.dart';
import 'package:chainatqueue/models/hresulty.dart';
import 'package:chainatqueue/screens/CBC.dart';
import 'package:chainatqueue/screens/CH.dart';
import 'package:chainatqueue/screens/Ua.dart';
import 'package:chainatqueue/screens/bookQresHN.dart';
import 'package:chainatqueue/screens/concluderesu.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:kioskregis/model/department.dart';
// import 'package:kioskregis/model/getserviceList.dart';
// import 'package:kioskregis/mystyle.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';

class Hresultdetail extends StatefulWidget {
  final GetDepartments getDepartment;
  final GetHresult result;
  final hresult;
  final Hresulty hresulty;

  int index = 0;

  Hresultdetail(
      {Key key, this.getDepartment, this.result, this.hresult, this.hresulty})
      : super(key: key);

  @override
  _HresultdetailState createState() => _HresultdetailState();
}

class _HresultdetailState extends State<Hresultdetail> {
  set floatingActionButton(Container floatingActionButton) {}
  String departmentName, servicename;
  GetDepartments getDepartment;
  Hresulty hresulty;

  var a;
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
    Widget _buildNormalContainer() {
      return Center(
        child: Container(
          height: 100.0,
          width: 100.0,
          color: Colors.red,
        ),
      );
    }

    Widget _buildWideContainers() {
      return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Container(
                height: 100.0,
                width: 100.0,
                color: Colors.red,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: 100.0,
                width: 100.0,
                color: Colors.yellow,
              ),
            )
          ],
        ),
      );
    }

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
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 600) {
            return _buildWideContainers();
          } else {
            return _buildNormalContainer();
          }
        },
      ),
    );
    //   body: Center(
    //     child: Container(
    //       width: MediaQuery.of(context).size.width * 0.90,
    //       height: MediaQuery.of(context).size.height,
    //       child: SingleChildScrollView(
    //         child: Container(
    //           width: MediaQuery.of(context).size.width * 0.90,
    //           child: Column(
    //             children: <Widget>[
    //               Padding(padding: EdgeInsets.only(top: 20.0)),
    //               Card(
    //                 color: Colors.white,
    //                 shape: RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.circular(5.0),
    //                 ),
    //                 child: Container(
    //                   width: MediaQuery.of(context).size.width * 0.95,
    //                   child: Row(
    //                     children: [
    //                       Column(
    //                         children: [
    //                           SizedBox(
    //                               child: Text(
    //                                 '     วันที่รับการตรวจ :',
    //                                 style: TextStyle(
    //                                   fontWeight: FontWeight.w400,
    //                                   fontSize: 18.0,
    //                                   color: Color(
    //                                     0xff116EA8,
    //                                   ),
    //                                 ),
    //                                 textAlign: TextAlign.center,
    //                               ),
    //                               width:
    //                                   MediaQuery.of(context).size.width * 0.5),
    //                           Padding(padding: EdgeInsets.only(top: 7.0)),
    //                         ],
    //                       ),
    //                       Column(
    //                         children: [
    //                           SizedBox(
    //                               child: Text(
    //                                 widget.hresulty.med_exam_date == null
    //                                     ? " "
    //                                     : widget.hresulty.med_exam_date,
    //                                 // "$departmentName",
    //                                 style: TextStyle(
    //                                   fontWeight: FontWeight.w400,
    //                                   fontSize: 16.0,
    //                                   color: Color(
    //                                     0xff116EA8,
    //                                   ),
    //                                 ),
    //                                 textAlign: TextAlign.left,
    //                               ),
    //                               width:
    //                                   MediaQuery.of(context).size.width * 0.3),
    //                           Padding(padding: EdgeInsets.only(top: 3.0)),
    //                         ],
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //               Padding(padding: EdgeInsets.only(top: 5.0)),
    //               Row(
    //                 children: [
    //                   Column(
    //                     children: [
    //                       Card(
    //                         color: Colors.white,
    //                         shape: RoundedRectangleBorder(
    //                           borderRadius: BorderRadius.circular(5.0),
    //                         ),
    //                         child: Container(
    //                           width:
    //                               MediaQuery.of(context).size.width * 0.85 / 2,
    //                           child: Column(
    //                             children: [
    //                               Row(
    //                                 children: [
    //                                   Padding(
    //                                       padding: EdgeInsets.only(top: 45.0)),
    //                                   SizedBox(
    //                                       child: {widget.hresulty.weight} ==
    //                                               null
    //                                           ? Text(' - ')
    //                                           : Text(
    //                                               '  น้ำหนัก:${widget.hresulty.weight} กก.',

    //                                               // "$departmentName",
    //                                               style: TextStyle(
    //                                                 color: Color(
    //                                                   0xff116EA8,
    //                                                 ),
    //                                                 fontSize: 16,
    //                                                 fontWeight: FontWeight.w400,
    //                                                 fontFamily: "Kanit",
    //                                               ),

    //                                               textAlign: TextAlign.left,
    //                                             ),
    //                                       width: 160),
    //                                   // SizedBox(
    //                                   //   child: Icon(
    //                                   //     Icons.delete_outline,
    //                                   //     size: 30,
    //                                   //   ),
    //                                   //   width:
    //                                   //       MediaQuery.of(context).size.width - 392.0,
    //                                   // ),
    //                                 ],
    //                               ),

    //                               // Icon(Icons.date_range_outlined),

    //                               Row(
    //                                 children: [
    //                                   Column(
    //                                     children: [
    //                                       SizedBox(
    //                                           child: {widget.hresulty.height} ==
    //                                                   null
    //                                               ? Text(' - ')
    //                                               : Text(
    //                                                   '  ส่วนสูง :${widget.hresulty.height} ซม.',
    //                                                   // "$departmentName",
    //                                                   style: GoogleFonts.kanit(
    //                                                     fontSize: 16.0,
    //                                                     color: Color(
    //                                                       0xff116EA8,
    //                                                     ),
    //                                                   ),

    //                                                   textAlign: TextAlign.left,
    //                                                 ),
    //                                           width: 160),
    //                                     ],
    //                                   ),
    //                                 ],
    //                               ),
    //                               Padding(padding: EdgeInsets.only(top: 8.0)),
    //                               Row(
    //                                 children: [
    //                                   Column(
    //                                     children: [
    //                                       SizedBox(
    //                                           child: {widget.hresulty.bmi} ==
    //                                                   null
    //                                               ? Text(' - ')
    //                                               : Text(
    //                                                   '  ดัขนีมวลกาย :${widget.hresulty.bmi} ',
    //                                                   // "$departmentName",
    //                                                   style: GoogleFonts.kanit(
    //                                                     fontSize: 16.0,
    //                                                     color: Color(
    //                                                       0xff116EA8,
    //                                                     ),
    //                                                   ),

    //                                                   textAlign: TextAlign.left,
    //                                                 ),
    //                                           width: 160),
    //                                     ],
    //                                   ),
    //                                 ],
    //                               ),

    //                               // Padding(padding: EdgeInsets.only(top: 7.0)),
    //                               SizedBox(
    //                                 height: 20.0,
    //                               ),
    //                             ],
    //                           ),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                   Column(
    //                     children: [
    //                       Card(
    //                         color: Colors.white,
    //                         shape: RoundedRectangleBorder(
    //                           borderRadius: BorderRadius.circular(5.0),
    //                         ),
    //                         child: Container(
    //                           width:
    //                               MediaQuery.of(context).size.width * 0.86 / 2,
    //                           child: Column(
    //                             children: [
    //                               Row(
    //                                 children: [
    //                                   Padding(
    //                                       padding: EdgeInsets.only(top: 45.0)),
    //                                   SizedBox(
    //                                       child: {widget.hresulty.bp} == null
    //                                           ? Text(' - ')
    //                                           : Text(
    //                                               '  ความดัน  ${widget.hresulty.bp}',

    //                                               // "$departmentName",
    //                                               style: TextStyle(
    //                                                 color: Color(
    //                                                   0xff116EA8,
    //                                                 ),
    //                                                 fontSize: 16,
    //                                                 fontWeight: FontWeight.w400,
    //                                                 fontFamily: "Kanit",
    //                                               ),

    //                                               textAlign: TextAlign.left,
    //                                             ),
    //                                       width: 160),
    //                                 ],
    //                               ),

    //                               Row(
    //                                 children: [
    //                                   Column(
    //                                     children: [
    //                                       SizedBox(
    //                                           child: {widget.hresulty.pulse} ==
    //                                                   null
    //                                               ? Text(' - ')
    //                                               : Text(
    //                                                   '  ชีพจร:${widget.hresulty.pulse} ครั้ง/นาที',
    //                                                   // "$departmentName",
    //                                                   style: GoogleFonts.kanit(
    //                                                     fontSize: 15.0,
    //                                                     color: Color(
    //                                                       0xff116EA8,
    //                                                     ),
    //                                                   ),

    //                                                   textAlign: TextAlign.left,
    //                                                 ),
    //                                           width: 160),
    //                                     ],
    //                                   ),
    //                                 ],
    //                               ),
    //                               Padding(padding: EdgeInsets.only(top: 8.0)),
    //                               Row(
    //                                 children: [
    //                                   Column(
    //                                     children: [
    //                                       SizedBox(
    //                                           child: {
    //                                                     widget.hresulty
    //                                                         .respiration
    //                                                   } ==
    //                                                   null
    //                                               ? Text(' - ')
    //                                               : Text(
    //                                                   '  ชีพจร:${widget.hresulty.respiration} ครั้ง/นาที',
    //                                                   // "$departmentName",
    //                                                   style: GoogleFonts.kanit(
    //                                                     fontSize: 15.0,
    //                                                     color: Color(
    //                                                       0xff116EA8,
    //                                                     ),
    //                                                   ),

    //                                                   textAlign: TextAlign.left,
    //                                                 ),
    //                                           width: 160),
    //                                     ],
    //                                   ),
    //                                 ],
    //                               ),

    //                               // Padding(padding: EdgeInsets.only(top: 7.0)),
    //                               SizedBox(
    //                                 height: 20.0,
    //                               ),
    //                             ],
    //                           ),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //               Card(
    //                 color: Colors.white,
    //                 shape: RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.circular(5.0),
    //                 ),
    //                 child: Container(
    //                   width: MediaQuery.of(context).size.width * 0.90,
    //                   child: Column(
    //                     children: [
    //                       Padding(padding: EdgeInsets.only(top: 5.0)),
    //                       SizedBox(
    //                           child: Text(
    //                             '  ผลการตรวจห้องปฏิบัติการ',
    //                             // "$departmentName",
    //                             style: TextStyle(
    //                               color: Color(
    //                                 0xff116EA8,
    //                               ),
    //                               fontSize: 17,
    //                               fontWeight: FontWeight.w400,
    //                               fontFamily: "Kanit",
    //                             ),
    //                             textAlign: TextAlign.left,
    //                           ),
    //                           width: MediaQuery.of(context).size.width * 0.85),
    //                       Row(
    //                         mainAxisAlignment: MainAxisAlignment.end,
    //                         children: <Widget>[
    //                           Padding(padding: EdgeInsets.only(top: 1.0)),
    //                           const SizedBox(
    //                             width: 8.0,
    //                           ),
    //                           TextButton(
    //                             child: const Text(
    //                               'รายละเอียด',
    //                               style: TextStyle(
    //                                   fontWeight: FontWeight.w400,
    //                                   fontSize: 16,
    //                                   color: Colors.orange),
    //                             ),
    //                             onPressed: () {
    //                              Navigator.push(
    //               context,
    //               PageTransition(
    //                 type: PageTransitionType.rightToLeft,
    //                 child: G(
    //                                         hresulty: results,
    //                                       ))
    //                              );
    //                             },
    //                           ),
    //                           const SizedBox(
    //                             width: 8,
    //                           ),
    //                         ],
    //                       ),
    //                       Padding(padding: EdgeInsets.only(top: 1.0)),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //               Card(
    //                 color: Colors.white,
    //                 shape: RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.circular(5.0),
    //                 ),
    //                 child: Container(
    //                   width: MediaQuery.of(context).size.width,
    //                   child: Column(
    //                     children: [
    //                       // Icon(Icons.date_range_outlined),

    //                       Padding(padding: EdgeInsets.only(top: 7.0)),
    //                       Row(
    //                         children: [
    //                           Column(
    //                             children: [
    //                               SizedBox(
    //                                   child: Text(
    //                                     'CXR',
    //                                     // "$departmentName",
    //                                     style: TextStyle(
    //                                       color: Color(
    //                                         0xff116EA8,
    //                                       ),
    //                                       fontSize: 16,
    //                                       fontWeight: FontWeight.w400,
    //                                       fontFamily: "Kanit",
    //                                     ),

    //                                     // textAlign: TextAlign.left,
    //                                   ),
    //                                   width: 160),
    //                               SizedBox(
    //                                   child: Text(
    //                                     '    เอ็กซเรย์ปอด       ',
    //                                     // "$departmentName",
    //                                     style: TextStyle(
    //                                       color: Color(
    //                                         0xff116EA8,
    //                                       ),
    //                                       fontSize: 16.0,
    //                                       fontWeight: FontWeight.w400,
    //                                       fontFamily: "Kanit",
    //                                     ),
    //                                   ),
    //                                   width: 190),
    //                             ],
    //                           ),
    //                           // Column(children: [
    //                           //  SizedBox(
    //                           //         child: Divider(
    //                           //   height: 10,
    //                           //   thickness: 1.25,
    //                           //   color: Colors.grey[400]
    //                           //   ),
    //                           //  ),
    //                           // ],),
    //                           Padding(padding: EdgeInsets.only(top: 17.0)),
    //                           Column(
    //                             children: [
    //                               SizedBox(
    //                                   child: {widget.hresulty.CXR} == null
    //                                       ? Text(' - ')
    //                                       : Text(
    //                                           '${widget.hresulty.CXR}',

    //                                           // "$departmentName",
    //                                           style: TextStyle(
    //                                             color: Color(
    //                                               0xff2D9CDB,
    //                                             ),
    //                                             fontSize: 16,
    //                                             fontWeight: FontWeight.w400,
    //                                             fontFamily: "Kanit",
    //                                           ),
    //                                           textAlign: TextAlign.right,
    //                                         ),
    //                                   width: 145),
    //                               SizedBox(
    //                                 child: Text(
    //                                   '                     ',
    //                                   // "$departmentName",
    //                                   style: TextStyle(
    //                                     color: Color(
    //                                       0xff828282,
    //                                     ),
    //                                     fontSize: 16.0,
    //                                     fontWeight: FontWeight.w400,
    //                                     fontFamily: "Kanit",
    //                                   ),
    //                                 ),
    //                                 width: 150,
    //                               ),
    //                             ],
    //                           ),
    //                         ],
    //                       ),

    //                       // Padding(padding: EdgeInsets.only(top: 7.0)),
    //                       SizedBox(
    //                         height: 20.0,
    //                       )
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //               Card(
    //                 color: Colors.white,
    //                 shape: RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.circular(5.0),
    //                 ),
    //                 child: Container(
    //                   width: MediaQuery.of(context).size.width,
    //                   child: Column(
    //                     children: [
    //                       // Icon(Icons.date_range_outlined),

    //                       Padding(padding: EdgeInsets.only(top: 7.0)),
    //                       Row(
    //                         children: [
    //                           Column(
    //                             children: [
    //                               SizedBox(
    //                                   child: Text(
    //                                     'UA     ',
    //                                     // "$departmentName",
    //                                     style: TextStyle(
    //                                       color: Color(
    //                                         0xff116EA8,
    //                                       ),
    //                                       fontSize: 16,
    //                                       fontWeight: FontWeight.w400,
    //                                       fontFamily: "Kanit",
    //                                     ),

    //                                     // textAlign: TextAlign.left,
    //                                   ),
    //                                   width: 150),
    //                               SizedBox(
    //                                   child: Text(
    //                                     '    ตรวจปัสสาวะ      ',
    //                                     // "$departmentName",
    //                                     style: TextStyle(
    //                                       color: Color(
    //                                         0xff116EA8,
    //                                       ),
    //                                       fontSize: 16.0,
    //                                       fontWeight: FontWeight.w400,
    //                                       fontFamily: "Kanit",
    //                                     ),
    //                                   ),
    //                                   width: 190),
    //                             ],
    //                           ),
    //                           // Column(children: [
    //                           //  SizedBox(
    //                           //         child: Divider(
    //                           //   height: 10,
    //                           //   thickness: 1.25,
    //                           //   color: Colors.grey[400]
    //                           //   ),
    //                           //  ),
    //                           // ],),
    //                           Padding(padding: EdgeInsets.only(top: 5.0)),
    //                           Column(
    //                             children: [
    //                               Row(
    //                                 children: <Widget>[
    //                                   SizedBox(width: 35.0),
    //                                   TextButton(
    //                                     child: Text(
    //                                       '    รายละเอียด',
    //                                       style: TextStyle(
    //                                           fontWeight: FontWeight.w400,
    //                                           fontSize: 16,
    //                                           color: Colors.orange),
    //                                     ),
    //                                     onPressed: () {
    //                                       Navigator.push(
    //               context,
    //               PageTransition(
    //                 type: PageTransitionType.rightToLeft,
    //                 child: UA(
    //                                                     hresulty: results,
    //                                                   ),),
    //                                       );
    //                                     },
    //                                   ),
    //                                 ],
    //                               ),
    //                             ],
    //                           ),
    //                         ],
    //                       ),

    //                       // Padding(padding: EdgeInsets.only(top: 7.0)),
    //                       SizedBox(
    //                         height: 18.0,
    //                       )
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //               Card(
    //                 color: Colors.white,
    //                 shape: RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.circular(5.0),
    //                 ),
    //                 child: Container(
    //                   width: MediaQuery.of(context).size.width,
    //                   child: Column(
    //                     children: [
    //                       // Icon(Icons.date_range_outlined),

    //                       Padding(padding: EdgeInsets.only(top: 7.0)),
    //                       Row(
    //                         children: [
    //                           Column(
    //                             children: [
    //                               SizedBox(
    //                                   child: Text(
    //                                     'Stool Examination     ',
    //                                     // "$departmentName",
    //                                     style: TextStyle(
    //                                       color: Color(
    //                                         0xff116EA8,
    //                                       ),
    //                                       fontSize: 16,
    //                                       fontWeight: FontWeight.w400,
    //                                       fontFamily: "Kanit",
    //                                     ),

    //                                     // textAlign: TextAlign.left,
    //                                   ),
    //                                   width: 160),
    //                               SizedBox(
    //                                   child: Text(
    //                                     '    ตรวจอุจาระ      ',
    //                                     // "$departmentName",
    //                                     style: TextStyle(
    //                                       color: Color(
    //                                         0xff116EA8,
    //                                       ),
    //                                       fontSize: 16.0,
    //                                       fontWeight: FontWeight.w400,
    //                                       fontFamily: "Kanit",
    //                                     ),
    //                                   ),
    //                                   width: 190),
    //                             ],
    //                           ),
    //                           // Column(children: [
    //                           //  SizedBox(
    //                           //         child: Divider(
    //                           //   height: 10,
    //                           //   thickness: 1.25,
    //                           //   color: Colors.grey[400]
    //                           //   ),
    //                           //  ),
    //                           // ],),
    //                           Padding(padding: EdgeInsets.only(top: 17.0)),
    //                           Column(
    //                             children: [
    //                               SizedBox(
    //                                   child:
    //                                       {widget.hresulty.Stool_examination} ==
    //                                               null
    //                                           ? Text(' - ')
    //                                           : Text(
    //                                               '${widget.hresulty.Stool_examination}',

    //                                               // "$departmentName",
    //                                               style: TextStyle(
    //                                                 color: Color(
    //                                                   0xff2D9CDB,
    //                                                 ),
    //                                                 fontSize: 16,
    //                                                 fontWeight: FontWeight.w400,
    //                                                 fontFamily: "Kanit",
    //                                               ),
    //                                               textAlign: TextAlign.right,
    //                                             ),
    //                                   width: 145),
    //                               SizedBox(
    //                                 child: Text(
    //                                   '                     ',
    //                                   // "$departmentName",
    //                                   style: TextStyle(
    //                                     color: Color(
    //                                       0xff828282,
    //                                     ),
    //                                     fontSize: 16.0,
    //                                     fontWeight: FontWeight.w400,
    //                                     fontFamily: "Kanit",
    //                                   ),
    //                                 ),
    //                                 width: 150,
    //                               ),
    //                             ],
    //                           ),
    //                         ],
    //                       ),

    //                       // Padding(padding: EdgeInsets.only(top: 7.0)),
    //                       SizedBox(
    //                         height: 20.0,
    //                       )
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //               Card(
    //                 color: Colors.white,
    //                 shape: RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.circular(5.0),
    //                 ),
    //                 child: Container(
    //                   width: MediaQuery.of(context).size.width,
    //                   child: Column(
    //                     children: [
    //                       // Icon(Icons.date_range_outlined),

    //                       Padding(padding: EdgeInsets.only(top: 7.0)),
    //                       Row(
    //                         children: [
    //                           Column(
    //                             children: [
    //                               SizedBox(
    //                                   child: Text(
    //                                     'EGK     ',
    //                                     // "$departmentName",
    //                                     style: TextStyle(
    //                                       color: Color(
    //                                         0xff116EA8,
    //                                       ),
    //                                       fontSize: 16,
    //                                       fontWeight: FontWeight.w400,
    //                                       fontFamily: "Kanit",
    //                                     ),

    //                                     // textAlign: TextAlign.left,
    //                                   ),
    //                                   width: 160),
    //                               SizedBox(
    //                                   child: Text(
    //                                     '    ตรวจคลื่นไฟฟ้าหัวใจ      ',
    //                                     // "$departmentName",
    //                                     style: TextStyle(
    //                                       color: Color(
    //                                         0xff116EA8,
    //                                       ),
    //                                       fontSize: 16.0,
    //                                       fontWeight: FontWeight.w400,
    //                                       fontFamily: "Kanit",
    //                                     ),
    //                                   ),
    //                                   width: 190),
    //                             ],
    //                           ),
    //                           // Column(children: [
    //                           //  SizedBox(
    //                           //         child: Divider(
    //                           //   height: 10,
    //                           //   thickness: 1.25,
    //                           //   color: Colors.grey[400]
    //                           //   ),
    //                           //  ),
    //                           // ],),
    //                           Padding(padding: EdgeInsets.only(top: 17.0)),
    //                           Column(
    //                             children: [
    //                               SizedBox(
    //                                   child: Text(
    //                                     '',
    //                                     // '                             ${results['']}',
    //                                     // "$departmentName",
    //                                     style: TextStyle(
    //                                       color: Color(
    //                                         0xff2D9CDB,
    //                                       ),
    //                                       fontSize: 16,
    //                                       fontWeight: FontWeight.w400,
    //                                       fontFamily: "Kanit",
    //                                     ),
    //                                     textAlign: TextAlign.left,
    //                                   ),
    //                                   width: 150),
    //                               SizedBox(
    //                                 child: Text(
    //                                   '                     ',
    //                                   // "$departmentName",
    //                                   style: TextStyle(
    //                                     color: Color(
    //                                       0xff828282,
    //                                     ),
    //                                     fontSize: 16.0,
    //                                     fontWeight: FontWeight.w400,
    //                                     fontFamily: "Kanit",
    //                                   ),
    //                                 ),
    //                                 width: 150,
    //                               ),
    //                             ],
    //                           ),
    //                         ],
    //                       ),

    //                       // Padding(padding: EdgeInsets.only(top: 7.0)),
    //                       SizedBox(
    //                         height: 20.0,
    //                       )
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //               Padding(padding: EdgeInsets.only(top: 10.0)),
    //               floatingActionButton = Container(
    //                 width: MediaQuery.of(context).size.width * 0.9,
    //                 height: 50.0,
    //                 child: FloatingActionButton(
    //                   shape: RoundedRectangleBorder(
    //                       borderRadius: BorderRadius.circular(7.5)),
    //                   clipBehavior: Clip.antiAlias,
    //                   onPressed: () {
    //                     MaterialPageRoute route =
    //                         MaterialPageRoute(builder: (value) => Coresults());
    //                     Navigator.push(context, route);
    //                   },
    //                   backgroundColor: Color(
    //                     0xff2D9CDB,
    //                   ),
    //                   child: Column(
    //                     mainAxisAlignment: MainAxisAlignment.center,
    //                     children: [
    //                       Container(
    //                         width: MediaQuery.of(context).size.width * 0.90,
    //                       ),
    //                       Text(
    //                         'สรุปผลการตรวจ',
    //                         style: GoogleFonts.kanit(fontSize: 18.0),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
