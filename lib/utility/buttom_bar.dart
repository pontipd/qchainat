import 'dart:async';
import 'dart:convert';
import 'package:chainatqueue/models/gethresult.dart';
import 'package:chainatqueue/models/getrx.dart';
import 'package:chainatqueue/models/patineModel.dart';
import 'package:chainatqueue/screens/getmedicine.dart';
import 'package:chainatqueue/screens/page2.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:chainatqueue/models/getappoint.dart';
import 'package:chainatqueue/screens/HnSo.dart';
import 'package:chainatqueue/screens/appointment.dart';
import 'package:chainatqueue/screens/haveappointment.dart';
import 'package:chainatqueue/screens/hresult.dart';
import 'package:chainatqueue/screens/picup.dart';
import 'package:chainatqueue/screens/queue.dart';
import 'package:chainatqueue/screens/startouse.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progress_indicators/progress_indicators.dart';

class BottomBar extends StatefulWidget {
  BottomBar({Key key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  var floatingActionButton;
  String displayname, hns, ptname, age, cid, dob, vn, datavisit, maindep, rxID;
  var now = DateTime.now();

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> snapshots;
  List<GetHresult> gethresults = List();
  List<GetRx> getData = List();

  // List<Getappointmen> getappointments = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    finddisplay();
    checkhn();
    onGetData();
    
    
  }

  // checkAppointment;

  // Future<bool> loader() {
  //   return showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder:(context)=> AlertDialog(
  //       title: ScalingText("loooo...."),
  //     )
  //   );
  // }

  Future<void> onGetData() async {
    var header = {'Content-Type': 'application/json'};
    var url = Uri.parse(
        'http://chainathospital.org/coreapi/api/v2/get_patient_info/$inputHn?=&fbclid=IwAR0DRRJ6Cr1OY4Y9SZoz75UGyFyPF2tYakZj6TH67Fa6lSuPvMKb-iqHxUo');

    var response = await http.get(url, headers: header);

    try {
      PatientModel patientModel =
          PatientModel.fromJson(convert.jsonDecode(response.body));
      if (patientModel.status == false) {
        isHasData = false;
        setState(() {
          ptname = '';
          hn = '';
          age = '';
          dob = '';
          cid = '';
        });
      } else {
        isHasData = true;
        setState(() {
          ptname = patientModel.data[0].ptName;
          hn = patientModel.data[0].hn;
          age = patientModel.data[0].age;
          dob = patientModel.data[0].dob;
          cid = patientModel.data[0].cid;
        });

        // patientModel.data.forEach((element) {
        //   print(element.age);
        //   print(element.ptName);
        //   print(element.hn);
        // });
      }
      print('##55555 = $ptname ,$hn,$age,$cid,$dob');
    } catch (e) {}

    // PatientModel patientModel =
    //     PatientModel.fromJson(convert.jsonDecode(response.body));

    // if (patientModel.status == false) {
    //   isHasData = false;
    //   setState(() {
    //     name = '';
    //     hn = '';
    //     age = '';
    //     dob = '';
    //     cid = '';
    //   });
    // } else {
    //   isHasData = true;
    //   setState(() {
    //     name = patientModel.data[0].ptName;
    //     hn = patientModel.data[0].hn;
    //     age = patientModel.data[0].age;
    //     dob = patientModel.data[0].dob;
    //     cid = patientModel.data[0].cid;
    //   });

    //   // patientModel.data.forEach((element) {
    //   //   print(element.age);
    //   print(element.ptName);
    //   //   print(element.hn);
    //   // });
    // }
  }

  Future<Null> finddisplay() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance.authStateChanges().listen((event) {
        displayname = event.displayName;

        print('## = $displayname');
      });
    });
  }

  Future<Null> checkhn() async {
    var header = {'Content-Type': 'application/json'};
    var url = Uri.parse(
        'http://chainathospital.org/coreapi/api/v2/get_patient_info/$displayname?=&fbclid=IwAR0DRRJ6Cr1OY4Y9SZoz75UGyFyPF2tYakZj6TH67Fa6lSuPvMKb-iqHxUo');

    var response = await http.get(url, headers: header);

    try {
      Getappointmen getappointmen =
          Getappointmen.fromJson(convert.jsonDecode(response.body));
      if (getappointmen.status == false) {
        isHasData = false;
        MaterialPageRoute route = MaterialPageRoute(
            builder: (value) => Haveappoin(
                  hn: hns,
                  inputHn: inputHn,
                ));
        Navigator.push(context, route);
      } else {
        isHasData = true;
        MaterialPageRoute route = MaterialPageRoute(
            builder: (value) => Haveappoin(
                  hn: hns,
                  inputHn: inputHn,
                ));
        Navigator.push(context, route);
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    var month = now.month.toString().padLeft(2, '0');
    var day = now.day.toString().padLeft(2, '0');
    var text = '${now.year}-$month-$day ${now.hour}:${now.minute}';
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        color: Colors.transparent,
        elevation: 9.0,
        clipBehavior: Clip.antiAlias,
        child: Container(
            height: 70.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(
                    0xffFFFFFF,
                  ),
                  Color(
                    0xff089EAD,
                  ),
                ],
                stops: [
                  1,
                  1,
                ],
              ),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 45.0,
                      width: MediaQuery.of(context).size.width / 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            children: [
                              InkWell(
                                onTap: () async {
                                  print(inputHn);
                                  await checkhn();
                                  if (isHasData == true) {
                                    checkAppointment;
                                  } else if (isHasData == false) {
                                    MaterialPageRoute route = MaterialPageRoute(
                                        builder: (value) => Appointment(
                                              hn: hns,
                                              inputHn: inputHn,
                                            ));
                                    Navigator.push(context, route);
                                  }
                                  // MaterialPageRoute route = MaterialPageRoute(
                                  //     builder: (value) => Haveappoin(
                                  //       inputHn: inputHn,

                                  //     ));
                                  // Navigator.push(context, route);
                                },
                                child: Icon(Icons.date_range_outlined),
                              ),
                              Text(
                                'นัดหมาย',
                                style: GoogleFonts.kanit(
                                    fontSize: 14.0, color: Colors.grey[600]),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )
                        ],
                      )),
                  Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width / 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  MaterialPageRoute route = MaterialPageRoute(
                                      builder: (value) => Queue(
                                            ptname: ptname,
                                            cid: cid,
                                            dob: dob,
                                            inputHn:inputHn,
                                            age: age,
                                          ));
                                  Navigator.push(context, route);
                                },
                                child: Icon(
                                  Icons.people,
                                ),
                              ),
                              Text(
                                'คิวตรวจ',
                                style: GoogleFonts.kanit(
                                    fontSize: 14.0, color: Colors.grey[600]),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )
                        ],
                      )),
                  Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width / 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Map<String, dynamic> _map = {
                                    "hn": inputHn,
                                    "date_start": "2021-03-05",
                                    "date_end": "2021-03-05"
                                  };
                                  var json = jsonEncode(_map);
                                  checkrxTye(http.Client(), json);
                                },
                                child: Icon(
                                  Icons.roofing,
                                  // color: Colors.white,
                                ),
                              ),
                              Text(
                                'รับยาใกล้บ้าน',
                                style: GoogleFonts.kanit(
                                    fontSize: 14.0, color: Colors.grey[600]),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )
                        ],
                      )),
                  Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width / 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  MaterialPageRoute route = MaterialPageRoute(
                                      builder: (value) => Hresult(
                                            // gethresult: gethresults[0],
                                            hn: hns,
                                            inputHn: inputHn,
                                          ));
                                  Navigator.push(context, route);
                                },
                                child: Icon(
                                  Icons.pending_actions,
                                  // color: Colors.white,
                                ),
                              ),
                              Text(
                                'ผลตรวจ',
                                style: GoogleFonts.kanit(
                                    fontSize: 14.0, color: Colors.grey[600]),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )
                        ],
                      )),
                  Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width / 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  MaterialPageRoute route = MaterialPageRoute(
                                      builder: (value) =>     Page2(
                                            // ptname: ptname,
                                            // cid: cid,
                                            // dob: dob,
                                            // age: age,
                                          ));
                                  Navigator.push(context, route);
                                },
                                child: Icon(
                                  Icons.article_outlined,
                                  // color: Colors.white,
                                ),
                              ),
                              Text(
                                'ตรวจสิทธิ',
                                style: GoogleFonts.kanit(
                                    fontSize: 14.0, color: Colors.grey[600]),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )
                        ],
                      )),
                ])));
  }

  Future<Null> get checkAppointment async {
    try {
      var header = {'Content-Type': 'application/json'};
      var url = Uri.parse(
          'http://chainathospital.org/coreapi/api/v2/get_appointment_list/$displayname');

      var response = await http.get(url, headers: header);
      print("res =$response");
      var result = json.decode(response.body);
      print('result ==>>> = $result');
      print(result['status']);
      // Getappointmen getappointmen =
      //     Getappointmen.fromJson(result);
      // print('getappointmen = $getappointmen');

      if (result['status']) {
        MaterialPageRoute route = MaterialPageRoute(
            builder: (value) => Haveappoin(
                  hn: hns,

                  inputHn: displayname,
                  // getappointment: getappointments[0],
                ));
        Navigator.push(context, route);
      } else {
        MaterialPageRoute route =
            MaterialPageRoute(builder: (value) => Appointment());
        Navigator.push(context, route);
      }
      // if (getappointmen.status == false) {
      //   MaterialPageRoute route =
      //       MaterialPageRoute(builder: (value) => Appointment());
      //   Navigator.push(context, route);
      // } else {
      //   MaterialPageRoute route = MaterialPageRoute(
      //       builder: (value) => Haveappoin(
      //             hn: hns,
      //             inputHn: displayname,
      //             getappointment: getappointments[0],
      //           ));
      //   Navigator.push(context, route);
      // }
    } catch (e) {}
  }

  Future<Null> checkrxTye(http.Client client, var json) async {
    var url =
        Uri.parse('http://chainathospital.org/coreapi/api/v2/get_rx_list');
    try {
      final response = await client.post(url,
          headers: {"Content-Type": "application/json"}, body: json);
      var getData = jsonDecode(response.body);
      print('++++++++++++ $getData');
      GetRx getRx = GetRx.fromJson(convert.jsonDecode(response.body));
      print(getRx);
      print('ffffffffff $rxID');
      if (getData['status']) {
        if (getRx.data[0].rxType == '2') {
          // if (getRx.data[0].rxType == '2'&& getRx.data[0].rxOperatorId != null) {
          rxID = getRx.data[0].rxOperatorId;
          // MaterialPageRoute route = MaterialPageRoute(
          //     builder: (value) => Havemedicine(
          //           inputHn: displayname,
          //           getData: getData,
          //         ));
          // Navigator.push(context, route);
        } else {
          MaterialPageRoute route =
              MaterialPageRoute(builder: (value) => Getmedicine());
          Navigator.push(context, route);
        }
      } else {
        showDialog(
          context: context,
          builder: (context) => SimpleDialog(
            title: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "รับยา",
                      style: TextStyle(
                        color: Color(
                          0xff7b8794,
                        ),
                        fontSize: 36,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Prompt",
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Divider(
                    height: 15,
                    thickness: 1.0,
                    color: Color(
                      0xff727876,
                    ),
                  ),
                  Text(
                    "ไม่มีรายการยา",
                    style: TextStyle(
                      color: Color(
                        0xff0baabd,
                      ),
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Prompt",
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  button1(),
                  SizedBox(
                    height: 20.0,
                  )
                ],
              ),
            ),
          ),
        );
      }
    } catch (e) {}
  }

  Widget button1() => Container(
      width: MediaQuery.of(context).size.width * 0.9,
      alignment: Alignment.bottomCenter,
      margin: new EdgeInsets.symmetric(horizontal: 30.0),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.2,
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    MaterialPageRoute route =
                        MaterialPageRoute(builder: (value) => Getmedicine());
                    Navigator.push(context, route);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ปิดน้าต่าง',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontFamily: "Prompt",
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  color: Color(0xff0baabd),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ));

  Future<Null> gethresult(http.Client client, var json) async {
    var header = {'Content-Type': 'application/json'};
    var url = Uri.parse(
        'http://chainathospital.org/coreapi/api/v2/get_med_exam_list/$inputHn');

    try {
      final response = await client.post(url,
          headers: {"Content-Type": "application/json"}, body: json);

      print('res**********ssssss*ressssssss = $response');
      var getData = jsonDecode(response.body);
      print('test*** ==> $getData ');
      GetHresult gethresult = GetHresult.fromJson(convert.jsonDecode(getData));
      setState(() {
        for (var i = 0; i < gethresult.data.length; i++) {
          gethresults.add(gethresult);
        }
        // checkhnso();
      });
      // if (getAppointMent.status == false) {
      //   date = '';
      //   department = '';
      //   doctorname = '';
      //   reson = '';
      // } else {
      //   for (var i = 0; i < getappointments.length; i++) {

      //     date = getAppointMent.data[i].appointDate;
      //     department = getAppointMent.data[i].department;
      //     doctorname = getAppointMent.data[i].doctorName;
      //     reson = getAppointMent.data[i].appointReason;
      //   }
      // }

    } catch (e) {}
  }
}

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: _shrineColorScheme,
    textTheme: _buildShrineTextTheme(base.textTheme),
  );
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
        button: base.button.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
      )
      .apply(
        fontFamily: 'Kanit',
        displayColor: shrineBrown900,
        bodyColor: shrineBrown900,
      );
}

const ColorScheme _shrineColorScheme = ColorScheme(
  primary: shrinePink100,
  primaryVariant: shrineBrown900,
  secondary: shrinePink50,
  secondaryVariant: shrineBrown900,
  surface: shrineSurfaceWhite,
  background: shrineBackgroundWhite,
  error: shrineErrorRed,
  onPrimary: shrineBrown900,
  onSecondary: shrineBrown900,
  onSurface: shrineBrown900,
  onBackground: shrineBrown900,
  onError: shrineSurfaceWhite,
  brightness: Brightness.light,
);

const Color shrinePink50 = Color(0xFF089EAD);
const Color shrinePink100 = Color(0xFF089EAD);
const Color sh = Color(0xFF089EAD);
const Color shrinePink400 = Color(0xFF089EAD);

const Color shrineBrown900 = Color(0xFF089EAD);
const Color shrineBrown600 = Color(0xFF089EAD);
const Color manu = Color(0xFF979797);

const Color shrineErrorRed = Color(0xFF089EAD);

const Color shrineSurfaceWhite = Color(0xFF089EAD);
const Color shrineBackgroundWhite = Color(0xFF089EAD);

const defaultLetterSpacing = 0.03;
