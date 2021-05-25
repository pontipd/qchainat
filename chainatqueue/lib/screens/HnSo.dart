import 'dart:convert';
import 'package:chainatqueue/models/patineModel.dart';
import 'package:chainatqueue/models/user_model.dart';
import 'package:chainatqueue/screens/startouse.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:chainatqueue/models/getDepartment.dart';
import 'package:chainatqueue/models/getnhso.dart';
import 'package:chainatqueue/models/getserviceList.dart';
import 'package:chainatqueue/screens/bookQresHN.dart';
import 'package:chainatqueue/utility/buttom_bar.dart';
import 'package:chainatqueue/utility/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;

final FirebaseAuth _auth = FirebaseAuth.instance;

class HNSO extends StatefulWidget {
  final GetNHSO getNHSO;
  final GetDepartments getDepartment;
  final String hn, ptname, dob, cid, age, inputController, name;
  HNSO({
    Key key,
    this.getDepartment,
    this.getNHSO,
    this.age,
    this.cid,
    this.dob,
    this.hn,
    this.name,
    this.ptname,
    this.inputController,
  }) : super(key: key);

  @override
  _HNSOState createState() => _HNSOState();

  static HNSO fromJson(jsonDecode) {}
}

class _HNSOState extends State<HNSO> {
  set floatingActionButton(Container floatingActionButton) {}
  String departmentName,
      servicename,
      ptname,
      age,
      cid,
      hn,
      pt,
      hmainname,
      startdate;
  User user;
  UserModel patient;
  GetDepartments getDepartment;
  GetNHSO getNHSO;
  bool loading = false;

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
  void initState() {
    super.initState();

    loading = true;
    print(_auth.currentUser);
    user = _auth.currentUser;
    getuser();
    // findProfile();
    // getPtright();
  }

  Future<User> getuser() async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(user.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        //
        print(documentSnapshot.data());
        patient = UserModel(hns: documentSnapshot.data()['hns']);
        findProfile();

        // fetch();
        print(
            '-----------------------------Document data: ${documentSnapshot.data()} ');
        // hns = patient.hns;
        // var data = jsonEncode({'hn': hns});
        // // gethresult(data);
        // print('hns==== $hns');
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ptname = "${widget.ptname}";
    hn = "${widget.hn}";
    cid = "${widget.cid}";
    age = "${widget.age}";
    var now = DateTime.now();
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(60.0),
      //   // here the desired height
      //   child: AppBar(
      //     backgroundColor: Color(
      //       0xff089EAD,
      //     ),
      //      title: Text(
      //       "โรงพยาบาลชัยนาทนเรนทร",
      //       style: GoogleFonts.kanit(fontSize: 22.0, color: Colors.white),
      //       textAlign: TextAlign.center,
      //     ),
      //     actions: <Widget>[
      //       Container(
      //         width: 60.0,
      //         child: Align(
      //           alignment: Alignment.center,
      //           child: Image.asset(
      //             'images/person.png',
      //             color: Colors.white,
      //             width: 70.0,
      //           ),
      //         ),
      //       )
      //     ],
      //   ),
      // ),
      // drawer: MainDrawer(),
      // // backgroundColor: Color(
      // //       0xffE5E5E5,

      // //     ),
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
                      Text(
                        'สิทธิการรักษาพยาบาล',
                        style: GoogleFonts.prompt(
                          fontSize: 24.0,
                          color: Color(
                            0xff089EAD,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: Column(
                        children: [
                          SizedBox(
                              child: Text(
                                'ข้อมูลจากสำนักงานหลักประกันสุขภาพแห่งชาติ',
                                // "$departmentName",
                                style: TextStyle(
                                  color: Color(
                                    0xff828282,
                                  ),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Kanit",
                                ),
                                textAlign: TextAlign.center,
                              ),
                              width: MediaQuery.of(context).size.width * 0.85),
                          Padding(padding: EdgeInsets.only(top: 7.0)),
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
                            'สิทธิที่เข้ารับการบริการ $cid',
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
                          width: MediaQuery.of(context).size.width * 0.85),
                      SizedBox(
                          child: Text(
                            '    $pt',
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
                          width: MediaQuery.of(context).size.width * 0.85),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: Divider(
                            height: 15,
                            thickness: 1.25,
                            color: Colors.grey[400]),
                      ),
                      SizedBox(
                          child: Text(
                            'ประเภทธิย่อย',
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
                          width: MediaQuery.of(context).size.width * 0.85),
                      SizedBox(
                          child: Text(
                            '    ช่วงอายุ 12-59 ปี',
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
                          width: MediaQuery.of(context).size.width * 0.85),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: Divider(
                            height: 15,
                            thickness: 1.25,
                            color: Colors.grey[400]),
                      ),
                      SizedBox(
                          child: Text(
                            'วันที่เริ่มใช้สิทธิ',
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
                          width: MediaQuery.of(context).size.width * 0.85),
                      SizedBox(
                          child: Text(
                            '     $startdate',
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
                          width: MediaQuery.of(context).size.width * 0.85),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: Divider(
                            height: 15,
                            thickness: 1.25,
                            color: Colors.grey[400]),
                      ),
                      SizedBox(
                          child: Text(
                            'สถานพยาบาลที่เข้ารับบริการเบื้องต้น',
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
                          width: MediaQuery.of(context).size.width * 0.85),
                      SizedBox(
                          child: Text(
                            '     $hmainname',
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
                          width: MediaQuery.of(context).size.width * 0.85),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: Divider(
                            height: 15,
                            thickness: 1.25,
                            color: Colors.grey[400]),
                      ),
                      SizedBox(
                          child: Text(
                            'สถานพยาบาลที่รับส่งต่อ',
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
                          width: MediaQuery.of(context).size.width * 0.85),
                      SizedBox(
                          child: Text(
                            '     รพ.ภูมิพลอดุลยเดช ',
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
                          width: MediaQuery.of(context).size.width * 0.85),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: Divider(
                            height: 15,
                            thickness: 1.25,
                            color: Colors.grey[400]),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 50.0)),
                  Text(
                    "ข้อมูล ณ วันที่ ${now.day} ${now.month}  ${now.year} เวลา ${now.hour}.${now.second} น.",
                    style: GoogleFonts.prompt(
                      fontSize: 18.0,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      // bottomNavigationBar: BottomBar(),
    );
  }

  // Future<void> onGetData() async {
  //   var header = {'Content-Type': 'application/json'};
  //   var url = Uri.parse(
  //       'http://q.chainathospital.org/app/kiosk/pt-right?cid=1103700796517');

  //   var response = await http.get(url, headers: header);

  //  try {
  //     final http.Response response = await http.Client().get(
  //       url,
  //     );
  //   GetNHSO chackHnso =
  //         GetNHSO.fromJson(convert.jsonDecode(response.body));
  //     setState(() {

  //       // for (var i = 0; i < chackHnso.checkNhso.length; i++) {
  //       //   checkHnso.add(chackHnso);
  //       // }
  //       }
  //       // for (var i = 0; i < chackHnso.checkNhso.length; i++) {
  //       //   checkHnso.add(chackHnso);
  //       // }
  //       // for (var i = 0; i < checkHnso.length; i++) {
  //       //   hnso =
  //       //       checkHnso.contains(getappointments[i].data[i].appointRightCode);
  //       // }
  //       // if (hnso == true) {
  //       //   hnso1 = 1;
  //       // }
  //     );
  //   } catch (e) {}

  // }

  Future<Null> findProfile() async {
    var header = {'Content-Type': 'application/json'};
    var url = Uri.parse(
        'http://chainathospital.org/coreapi/api/v2/get_patient_info/${patient.hns}');
    try {
      final http.Response response = await http.Client().get(
        url,
      );
      print('res = $response');
      // response.toString();
      PatientModel getProfile =
          PatientModel.fromJson(convert.jsonDecode(response.body));

      // print('result = $getProfile');
      if (getProfile.status == false) {
        setState(() {
          ptname = '';
          hn = '';
          age = '';

          cid = '';
        });
      } else {
        setState(() {
          ptname = getProfile.data[0].ptName;
          cid = getProfile.data[0].cid;
          hn = getProfile.data[0].hn;

          age = getProfile.data[0].age;

          print('///////////////////////$cid');
          // checkappointment();
          getPtright();
        });
      }
    } catch (e) {}
  }

  Future<Null> getPtright() async {
    var header = {'Content-Type': 'application/json'};

    var url =
        Uri.parse('http://q.chainathospital.org/app/kiosk/pt-right?cid=$cid');

    var response = await http.get(url, headers: header);

    try {
      final http.Response response = await http.Client().get(
        url,
      );
      print('res = $response');
      var result = json.decode(response.body);
      print('result = $result');
      GetNHSO getptright = GetNHSO.fromJson(convert.jsonDecode(response.body));
      if (getptright.toString() != null) {
        setState(() {
          pt = getptright.subinsclName;
          hmainname = getptright.hmainName;
          startdate = getptright.startdate;
          // checkappointment();
        });
      }
    } catch (e) {}
  }
}
