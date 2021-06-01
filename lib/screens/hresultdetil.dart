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

    void gotoPageUA() {
      Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.leftToRight,
          child: UA(
            hresulty: results,
          ),
        ),
      );
    }

    void gotoPageCBC() {
      Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.leftToRight,
          child: CBC(
            hresulty: results,
          ),
        ),
      );
    }

    print('sssssss $results');

    Widget _cardColumn(String title, String subTitle, String desc,
        Function callback, bool showAction) {
      return Card(
        elevation: 4,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 60,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                alignment: Alignment.centerLeft,
                // color: Colors.amber,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
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
                    Text(
                      subTitle,
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
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 40,
              child: Container(
                // margin: EdgeInsets.symmetric(horizontal: 8),
                alignment: Alignment.bottomRight,
                // color: Colors.blue,
                child: showAction
                    ? TextButton(
                        child: Text(
                          '    รายละเอียด',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.orange),
                        ),
                        onPressed: callback,
                      )
                    : Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: Text(
                          desc,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.orange),
                        ),
                      ),
              ),
            ),
          ],
        ),
      );
    }

    var _txtStyle = TextStyle(
      color: Color(
        0xff116EA8,
      ),
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontFamily: "Kanit",
    );

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
                  Padding(padding: EdgeInsets.only(top: 9.0)),
                  Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                  child: Text(
                                    '     วันที่รับการตรวจ :',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18.0,
                                      color: Color(
                                        0xff116EA8,
                                      ),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.5),
                              Padding(padding: EdgeInsets.only(top: 7.0)),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                  child: Text(
                                    widget.hresulty.med_exam_date == null
                                        ? " "
                                        : widget.hresulty.med_exam_date,
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.3),
                              Padding(padding: EdgeInsets.only(top: 3.0)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 5.0)),
                  Column(
                    children: [
                      Row(
                        children: [],
                      ),
                    ],
                  ),

                  // Padding(padding: EdgeInsets.only(top: 17.0)),

                  Card(
                      elevation: 4,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 70,
                                    child: Container(
                                      child: Text(
                                        'น้ำหนัก:',
                                        style: _txtStyle,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      child: Text(
                                        '${results?.weight ?? "-"} กก.',
                                        style: _txtStyle,
                                        // textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 70,
                                    child: Container(
                                      child: Text(
                                        'ส่วนสูง:',
                                        style: _txtStyle,
                                        // textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      child: Text(
                                        '${results?.height ?? "-"} ซม.',
                                        style: _txtStyle,
                                        // textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 70,
                                    child: Container(
                                      child: Text(
                                        'ดัขนีมวลกาย:',
                                        style: _txtStyle,
                                        // textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      child: Text(
                                        '${results?.bmi ?? "-"}',
                                        style: _txtStyle,
                                        // textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 70,
                                    child: Container(
                                      child: Text(
                                        'ความดัน:',
                                        style: _txtStyle,
                                        // textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      child: Text(
                                        '${results?.bp ?? "-"}',
                                        style: _txtStyle,
                                        // textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 70,
                                    child: Container(
                                      child: Text(
                                        'ชีพจร:',
                                        style: _txtStyle,
                                        // textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      child: Text(
                                        ' ${widget.hresulty.pulse} ครั้ง/นาที',
                                        style: _txtStyle,
                                        // textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 70,
                                    child: Container(
                                      child: Text(
                                        'หายใจ:',
                                        style: _txtStyle,
                                        // textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      child: Text(
                                        ' ${widget?.hresulty?.respiration ?? "-"} ครั้ง/นาที',
                                        style: _txtStyle,
                                        // textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                      )),

                  Column(
                    children: [
                      CardDescription('CXR', 'เอ็กซเรย์ปอด',
                          results?.CXR ?? "-", null, false),
                      SizedBox(
                        height: 10,
                      ),
                      CardDescription('Stool Examination  ', 'ตรวจอุจาระ',
                          results?.Stool_examination ?? "-", null, false),
                      SizedBox(
                        height: 10,
                      ),
                      CardDescription('EGK', 'ตรวจคลื่นไฟฟ้าหัวใจ',
                          results?.Stool_examination ?? "-", null, false),
                      SizedBox(
                        height: 10,
                      ),
                      CardDescription(
                          'UA', 'ตรวจปัสสาวะ', '', gotoPageUA, true),
                      SizedBox(
                        height: 10,
                      ),
                      CardDescription(
                          'ผลการตรวจห้องปฏิบัติการ', '', '', gotoPageCBC, true),
                    ],
                  ),

                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  // Column(
                  //   children: [
                  //     Row(
                  //       children: [
                  //         Expanded(
                  //             child: Container(
                  //           color: Colors.red,
                  //           child: Text('left'),
                  //         )),
                  //         Expanded(
                  //             child: Container(
                  //           color: Colors.green,
                  //           child: Text('right'),
                  //         )),
                  //       ],
                  //     ),
                  //   ],
                  // ),

                  Padding(padding: EdgeInsets.only(top: 3.0)),
                  floatingActionButton = Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50.0,
                    child: FloatingActionButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.5)),
                      clipBehavior: Clip.antiAlias,
                      onPressed: () {
                        MaterialPageRoute route =
                            MaterialPageRoute(builder: (value) => Coresults());
                        Navigator.push(context, route);
                      },
                      backgroundColor: Color(
                        0xff2D9CDB,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.90,
                          ),
                          Text(
                            'สรุปผลการตรวจ',
                            style: GoogleFonts.kanit(fontSize: 18.0),
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

class CardDescription extends StatelessWidget {
  String title;
  String subTitle;
  Function callback;
  String desc;
  bool showAction;

  CardDescription(
      this.title, this.subTitle, this.desc, this.callback, this.showAction);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 70,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              alignment: Alignment.centerLeft,
              // color: Colors.amber,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
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
                  Text(
                    subTitle,
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
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 30,
            child: Container(
              // margin: EdgeInsets.symmetric(horizontal: 8),
              alignment: Alignment.bottomRight,
              // color: Colors.blue,
              child: showAction
                  ? TextButton(
                      child: Text(
                        'รายละเอียด',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.orange),
                      ),
                      onPressed: callback,
                    )
                  : Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Text(
                        desc,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.orange),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
