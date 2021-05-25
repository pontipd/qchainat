import 'dart:async';
import 'dart:convert';
import 'dart:convert' as convert;
import 'package:chainatqueue/models/album.dart';
import 'package:chainatqueue/models/appoint.dart';
import 'package:chainatqueue/models/checkhnso.dart';
import 'package:chainatqueue/models/getAppointment.dart';
import 'package:chainatqueue/models/getnhso.dart';
import 'package:chainatqueue/models/patineModel.dart';

import 'package:chainatqueue/models/user_model.dart';
import 'package:chainatqueue/screens/appointmentdetil.dart';
import 'package:chainatqueue/screens/getmedicine.dart';
import 'package:chainatqueue/screens/getmedlist.dart';
import 'package:chainatqueue/screens/page1.dart';
import 'package:chainatqueue/screens/page3.dart';
import 'package:chainatqueue/screens/queue.dart';
import 'package:chainatqueue/screens/startouse.dart';
import 'package:chainatqueue/transitions/enter_exit_route.dart';
import 'package:chainatqueue/utility/main_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'Page5.dart';
import 'medicalrecord.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
int selectedPage = 0;
final _pageOptions = [Page1(), Page5(), Drugdispen(), Page3(), Page2()];

class Page2 extends StatefulWidget {
  String hn, ptname, cid, age, pt, inputHn;
  // Getappointmen getappointment;

  Page2({
    Key key,
    this.hn,
    this.age,
    this.cid,
    this.inputHn,
    this.ptname,
    this.pt,
  }) : super(key: key);
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  Future<List<Album>> futureAlbum;
  String displayname, inputHn;
  String departmentName,
      servicename,
      ptname,
      age,
      cid,
      hn,
      pt,
      hmainname,
      startdate;
  Future<List<Appoint>> getappointments;
  List<ChackHnso> checkHnso = List();
  var hnso;
  ChackHnso chackHnso;
  String staus;
  bool status;
  User user;
  UserModel patient;
  Timer _timer;bool loading = false;
  var now = DateTime.now();
  var date;
  @override
  void initState() {
    super.initState();
    loading = true; 
    print(_auth.currentUser);
    user = _auth.currentUser;
    getuser(); readData();
    var month = now.month.toString().padLeft(2, '0');
    var day = now.day.toString().padLeft(2, '0');
    date = "${now.year}" + "-" + "$month" + "-" + "$day";
    print(date);
    // futureAlbum = fetchAlbum();
  }

  Future<User> getuser() async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(user.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        loading = false;
        //
        print(documentSnapshot.data());
        patient =  UserModel(cids: documentSnapshot.data()['cids']);
        getPtright(cids);
        print(
            '-----------------------------Document data: ${documentSnapshot.data()} ');
      } else {
        loading = false;
        print('Document does not exist on the database');
      }
    });
  }

  // Future<Null> finddisplay() async {
  //   await Firebase.initializeApp().then((value) async {
  //     await FirebaseAuth.instance.authStateChanges().listen((event) {
  //       displayname = event.displayName;
  //       inputHn = event.displayName;
  //       print('## = $displayname');
  //       print('##12 = $inputHn');
  //       // getAppointment();
  //     });
  //   });
  //   // checkAppointment;
  // }

  // Future<List<Album>> fetchAlbum() async {
  //   var url = Uri.parse(
  //       'http://chainathospital.org/coreapi/api/v2/get_appointment_list/$inputHn');
  //   final response = await http.get(Uri.https('$url', 'albums'));

  //   if (response.statusCode == 200) {
  //     // If the server did return a 200 OK response,
  //     // then parse the JSON.
  //     // return Album.fromJson(jsonDecode(response.body));

  //     List result = jsonDecode(response.body);
  //     print('result ==== $result');

  //     return result.map((job) => new GetAppointMent().fromJson(job)).toList();
  //   } else {
  //     // If the server did not return a 200 OK response,
  //     // then throw an exception.
  //     throw Exception('Failed to load album');
  //   }
  // }

  Future<Null> readData() async {
    await Firebase.initializeApp().then((value) {
      print('init');
    });
  }

  

  Future getPtright(cids) async {
    // final response = await http.get(Uri.http('http://chainathospital.org',
    //     '/coreapi/api/v2/get_appointment_list/0408812'));

    var header = {'Content-Type': 'application/json'};
    var url =
        Uri.parse('http://q.chainathospital.org/app/kiosk/pt-right?cid=${patient.cids}');

    final http.Response response = await http.Client().get(
      url,
    );
    try {
      if (response.statusCode == 200) {
         loading = false;
        // If the server did return a 200 OK response,
        // then parse the JSON.
        final result = jsonDecode(response.body);
        print('result = $result');
        GetNHSO getptright =
            GetNHSO.fromJson(convert.jsonDecode(response.body));
        if (getptright.toString() != null) {
          setState(() {
             loading = false;
            pt = getptright.subinsclName;
            hmainname = getptright.hmainName;
            startdate = getptright.startdate;
            // checkappointment();
          });
        }
      } else {
        print('ไม่พบบบบบบบ');
        showDialog(
            context: context,
            builder: (context) {
              // _timer = Timer(Duration(seconds: 3), () {
              //   Navigator.of(context).pop();
              // });
              return AlertDialog(
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: 460.0,
                        height: 120.0,
                        child: Column(
                          children: [
                            Text(
                              'ไม่สามารถติดต่อฐานข้อมูลได้',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 22.0),
                              textAlign: TextAlign.center,
                            ),
                            Divider(
                              height: 15,
                              thickness: 1.0,
                              color: Colors.grey[200],
                            ),
                            Text(
                              'โปรดลองใหม่อีกครั้ง',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 20.0),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            width: 150.0,
                            height: 53.0,
                            child: RaisedButton(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(5.0),
                                  side: BorderSide(
                                    color: Color(
                                      0xff089EAD,
                                    ),
                                  )),
                              onPressed: () {
                                // MaterialPageRoute route =
                                //     MaterialPageRoute(builder: (value) => HosScreen());
                                Navigator.pop(context);
                              },
                              child: Text(
                                'ปิดหน้าต่าง',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 22.0,
                                  color: Color(
                                    0xff089EAD,
                                  ),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
             
            }
           
            ).then((val) {
          if (_timer.isActive) {
            _timer.cancel();
          }
        });
      }
    } catch (e) {}
  }

  Future _refreshData() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {});
  }

  Future test(int value) {
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('สิทธิการรักษาพยาบาล'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.90,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
              ),
              Expanded(
                child: Center(
                  child: RefreshIndicator(
                    onRefresh: _refreshData,
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
                                      width: MediaQuery.of(context).size.width *
                                          0.85),
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
                                    'สิทธิที่เข้ารับการบริการ',
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
                                    pt == null ? "-" : pt,
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.85),
                              SizedBox(
                                  child: Text(
                                    'ช่วงอายุ 12-59 ปี',
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.85),
                              SizedBox(
                                  child: Text(
                                    startdate == null ? "-" : startdate,
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.85),
                              SizedBox(
                                  child: Text(
                                    hmainname == null ? "-" : hmainname,
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.85),
                              SizedBox(
                                  child: Text(
                                    'รพ.ภูมิพลอดุลยเดช ',
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
            ],
          ),
        ),
      ),
    );
  }
}
