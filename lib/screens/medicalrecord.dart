import 'package:chainatqueue/models/appoint.dart';
import 'package:chainatqueue/models/getAppointment.dart';
import 'package:chainatqueue/models/getDepartment.dart';
import 'package:chainatqueue/screens/haveappointment.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Medicalrecord extends StatefulWidget {
  final String ptname, cid, age, hn, pt, inputHn;
  GetAppointMent getAppointment;
  GetAppointMent appointMent;
  final Appoint appoint;
  int index = 0;

  Medicalrecord(
      {Key key,
      this.age,
      this.cid,
      this.hn,
      this.pt,
      this.ptname,
      this.inputHn,
      this.getAppointment,
      this.appoint,
      this.appointMent,
      this.index})
      : super(key: key);

  @override
  _MedicalrecordState createState() => _MedicalrecordState();
}

class _MedicalrecordState extends State<Medicalrecord> {
  String hn, ptname, dob, cid, age, hn1, pt, inputHn;
  Appoint appoint;
  GetDepartments getDepartment;

  // GetProfile1 getProfile;
  var now = DateTime.now();
  var date;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hn = "${widget.hn}";
    // hn = '0408812';
    // findProfile();
  }

  // Future<Null> findProfile() async {
  //   String url =
  //       'http://chainathospital.org/coreapi/api/v2/get_patient_info/$hn1/$date';
  //   try {
  //     final http.Response response = await http.Client().get(
  //       url,
  //     );
  //     print('res = $response');
  //     // response.toString();
  //     GetProfile1 getProfile =
  //         GetProfile1.fromJson(convert.jsonDecode(response.body));

  //     // print('result = $getProfile');
  //     if (getProfile.status == false) {
  //       setState(() {
  //         ptname = '';
  //         hn1 = '';
  //         age = '';
  //         dob = '';
  //         cid = '';
  //       });
  //     } else {
  //       setState(() {
  //         ptname = getProfile.data[0].ptName;
  //         cid = getProfile.data[0].cid;
  //         hn1 = getProfile.data[0].hn;
  //         dob = getProfile.data[0].dob;
  //         age = getProfile.data[0].age;
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
    // pt = "${widget.pt}";
    return Scaffold(
      appBar: AppBar(
       // backgroundColor: Colors.white,
        title: Text(
          "รายละเอียดการนัดหมาย",
          style: GoogleFonts.prompt(
            fontSize: 24.0,
            color: Colors.white
            // color: Color(
            //   0xff116EA8,
            // ),
          ),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
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
                                widget.appoint.pt_name,
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
                            width: MediaQuery.of(context).size.width * 0.85,
                          ),
                          SizedBox(
                            child: Text(
                              widget.appoint.appoint_date,
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
                            width: MediaQuery.of(context).size.width * 0.85,
                          ),
                          SizedBox(
                            child: Text(
                              widget.appoint.doctor_name,
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
                  // Column(
                  //   children: [
                  //     SizedBox(
                  //         child: Text(
                  //           'สถานที่',
                  //           // "$departmentName",
                  //           style: TextStyle(
                  //             color: Color(
                  //               0xff4F4F4F,
                  //             ),
                  //             fontSize: 18,
                  //             fontWeight: FontWeight.w400,
                  //             fontFamily: "Kanit",
                  //           ),
                  //           textAlign: TextAlign.left,
                  //         ),
                  //         width: MediaQuery.of(context).size.width * 0.85),
                  //     SizedBox(
                  //         child: Text(
                  //          widget
                  //                 .getAppointment.data[widget.index].department
                  //                 .toString(),
                  //           // "$departmentName",
                  //           style: TextStyle(
                  //             color: Color(
                  //               0xff116EA8,
                  //             ),
                  //             fontSize: 18,
                  //             fontWeight: FontWeight.w400,
                  //             fontFamily: "Kanit",
                  //           ),
                  //         ),
                  //         width: MediaQuery.of(context).size.width * 0.85),
                  //     Container(
                  //       width: MediaQuery.of(context).size.width * 0.85,
                  //       child: Divider(
                  //           height: 15,
                  //           thickness: 1.25,
                  //           color: Colors.grey[400]),
                  //     ),
                  //     SizedBox(
                  //         child: Text(
                  //           'การเตรียมตัว',
                  //           // "$departmentName",
                  //           style: TextStyle(
                  //             color: Color(
                  //               0xff4F4F4F,
                  //             ),
                  //             fontSize: 18,
                  //             fontWeight: FontWeight.w400,
                  //             fontFamily: "Kanit",
                  //           ),
                  //           textAlign: TextAlign.left,
                  //         ),
                  //         width: MediaQuery.of(context).size.width * 0.85),
                  //     SizedBox(
                  //         child: Text(
                  //           widget
                  //                 .getAppointment.data[widget.index].appointPreparing
                  //                 .toString(),
                  //           // "$departmentName",
                  //           style: TextStyle(
                  //             color: Color(
                  //               0xff116EA8,
                  //             ),
                  //             fontSize: 18,
                  //             fontWeight: FontWeight.w400,
                  //             fontFamily: "Kanit",
                  //           ),
                  //         ),
                  //         width: MediaQuery.of(context).size.width * 0.85),
                  //     Container(
                  //       width: MediaQuery.of(context).size.width * 0.85,
                  //       child: Divider(
                  //           height: 15,
                  //           thickness: 1.25,
                  //           color: Colors.grey[400]),
                  //     ),
                  //     SizedBox(
                  //         child: Text(
                  //           'สาเหตุที่นัด',
                  //           // "$departmentName",
                  //           style: TextStyle(
                  //             color: Color(
                  //               0xff4F4F4F,
                  //             ),
                  //             fontSize: 18,
                  //             fontWeight: FontWeight.w400,
                  //             fontFamily: "Kanit",
                  //           ),
                  //           textAlign: TextAlign.left,
                  //         ),
                  //         width: MediaQuery.of(context).size.width * 0.85),
                  //     SizedBox(
                  //         child: Text(
                  //          widget
                  //                 .getAppointment.data[widget.index].appointReason
                  //                 .toString(),
                  //           // "$departmentName",
                  //           style: TextStyle(
                  //             color: Color(
                  //               0xff116EA8,
                  //             ),
                  //             fontSize: 18,
                  //             fontWeight: FontWeight.w400,
                  //             fontFamily: "Kanit",
                  //           ),
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         width: MediaQuery.of(context).size.width * 0.85),
                  //     Container(
                  //       width: MediaQuery.of(context).size.width * 0.85,
                  //       child: Divider(
                  //           height: 15,
                  //           thickness: 1.25,
                  //           color: Colors.grey[400]),
                  //     ),
                  //     SizedBox(
                  //         child: Text(
                  //           'สถานะ',
                  //           // "$departmentName",
                  //           style: TextStyle(
                  //             color: Color(
                  //               0xff4F4F4F,
                  //             ),
                  //             fontSize: 18,
                  //             fontWeight: FontWeight.w400,
                  //             fontFamily: "Kanit",
                  //           ),
                  //           textAlign: TextAlign.left,
                  //         ),
                  //         width: MediaQuery.of(context).size.width * 0.85),
                  //     SizedBox(
                  //         child:
                  //          widget
                  //                 .getAppointment.data[widget.index].appointStatus
                  //                 .toString() == 'F'?
                  //         Text(

                  //           'ยังไม่ได้ลงทะเบียนตรวจรักษา',
                  //           // "$departmentName",
                  //           style: TextStyle(
                  //             color: Color(
                  //               0xff116EA8,
                  //             ),
                  //             fontSize: 18,
                  //             fontWeight: FontWeight.w400,
                  //             fontFamily: "Kanit",
                  //           ),
                  //           textAlign: TextAlign.center,
                  //         ):
                  //         Text(

                  //           'ลงทะเบียนตรวจรักษาแล้วแหละ',
                  //           // "$departmentName",
                  //           style: TextStyle(
                  //             color: Color(
                  //               0xff116EA8,
                  //             ),
                  //           fontSize: 18,
                  //             fontWeight: FontWeight.w400,
                  //             fontFamily: "Kanit",
                  //           ),
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         width: MediaQuery.of(context).size.width * 0.85),
                  //     Container(
                  //       width: MediaQuery.of(context).size.width * 0.85,
                  //       child: Divider(
                  //           height: 15,
                  //           thickness: 1.25,
                  //           color: Colors.grey[400]),
                  //     ),
                  //   ],
                  // ),
                  Padding(padding: EdgeInsets.only(top: 35.0)),

                  Card(
                    color: Color(
                      0xff089EAD,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: Column(
                        children: [
                          Padding(padding: EdgeInsets.only(top: 18.0)),
                          SizedBox(
                              child: Text(
                                // "$departmentName",
                                "กรุณาทำรายการ\nที่งานเวชระเบียน\nก่อนรับบริการ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Kanit",
                                ),
                                textAlign: TextAlign.center,
                              ),
                              width: MediaQuery.of(context).size.width * 0.85),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: Divider(
                              height: 10,
                              thickness: 0,
                              // color: Colors.grey[400]
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: 7.0)),
                          // SizedBox(
                          //   child: FloatingActionButton(
                          //     shape: RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(7.5)),
                          //     clipBehavior: Clip.antiAlias,
                          //     onPressed: () {
                          //       MaterialPageRoute route = MaterialPageRoute(
                          //           builder: (value) => QueueQr());
                          //       Navigator.push(context, route);
                          //     },
                          //     backgroundColor: Color(
                          //       0xffF2994A,
                          //     ),
                          //     child: Column(
                          //       mainAxisAlignment: MainAxisAlignment.center,
                          //       children: [
                          //         Container(
                          //           width: MediaQuery.of(context).size.width *
                          //               0.85,
                          //         ),
                          //         Text(
                          //           'กดเพื่อ Scan QR Code',
                          //           style: GoogleFonts.prompt(fontSize: 18.0),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          //   width: MediaQuery.of(context).size.width * 0.75,
                          // ),
                          Padding(padding: EdgeInsets.only(top: 7.0)),
                          SizedBox(
                            height: 10.0,
                          ),
                          //                     SingleChildScrollView(
                          //   physics: ScrollPhysics(),
                          //   child: Column(
                          //     children: <Widget>[
                          //        Text('Hey'),
                          //        ListView.builder(
                          //           physics: NeverScrollableScrollPhysics(),
                          //           shrinkWrap: true,
                          //           itemCount:50,
                          //           itemBuilder: (context,index){
                          //             return  Text('Some text');
                          //           })
                          //     ],
                          //   ),
                          // ),
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
