import 'dart:convert';
import 'package:ars_dialog/ars_dialog.dart';
import 'package:chainatqueue/models/getappoint.dart';
import 'package:chainatqueue/models/patineModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:chainatqueue/models/getDepartment.dart';
import 'package:chainatqueue/models/gethresult.dart';
import 'package:chainatqueue/models/getserviceList.dart';
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

class Hresult extends StatefulWidget {
  final GetHresult getHresult;

  final String hn, ptname, cid, age, displayname, pt, inputHn;
  bool isHasData = false;
  Hresult({
    Key key,
    this.getHresult,
    this.displayname,
    this.hn,
    this.age,
    this.cid,
    this.inputHn,
    this.ptname,
    this.pt,
  }) : super(key: key);

  @override
  _HresultState createState() => _HresultState();
}

class _HresultState extends State<Hresult> {
  set floatingActionButton(Container floatingActionButton) {}
  String departmentName,
      servicename,
      inputHn,
      hnhns,
      hn,
      ptname,
      age,
      cid,
      dob,
      vn,
      datavisit,
      maindep,
      rxID;
  String displayname;
  bool isHasData = false;
  List<GetHresult> gethresults = List();
  var result = [];
  bool lo = false;
  bool _ischeckData = false;

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
  //
  //

  @override
  void initState() {
    super.initState();
    onGetData();
    readData();
    finddisplay();
    hn = "${widget.hn}";
    inputHn = "${widget.inputHn}";
    // var data = jsonEncode({'hn': '${widget.inputHn}'});
    var data = jsonEncode({'hn': "${widget.inputHn}"});
    // Map<String, dynamic> _map = {"hn": '${widget.inputHn}'};
    // var json = jsonEncode(_map);
    gethresult(data);
  }

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

  Future<Null> readData() async {
    await Firebase.initializeApp().then((value) {
      print('init');
    });
  }

  Future<Null> finddisplay() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance.authStateChanges().listen((event) {
        displayname = event.displayName;
        inputHn = event.displayName;
        print('## = $displayname');
        print('##12 = $inputHn');
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
        // MaterialPageRoute route = MaterialPageRoute(
        //     builder: (value) => Haveappoin(
        //           hn: hns,
        //           inputHn: inputHn,
        //         ));
        // Navigator.push(context, route);
      } else {
        isHasData = true;
        // MaterialPageRoute route = MaterialPageRoute(
        //     builder: (value) => Haveappoin(
        //           hn: hns,
        //           inputHn: inputHn,
        //         ));
        // Navigator.push(context, route);
      }
    } catch (e) {}
  }

// FirebaseFirestore.instance
//     .collection('users')
//     .doc(userId)
//     .get()
//     .then((DocumentSnapshot documentSnapshot) {
//       if (documentSnapshot.exists) {
//         print('Document data: ${documentSnapshot.data()}');
//       } else {
//         print('Document does not exist on the database');
//       }
//     });

  Future gethresult(var json) async {
    try {
      lo = true;
      // ProgressDialog progressDialog = ProgressDialog(context,
      //     message: Text("This is the message"),
      //     title: Text("This is the title"));

      // //You can set Message using this function
      // progressDialog.setTitle(Text("Loading"));
      // progressDialog
      //     .setMessage(Text("Please Wait, Injecting your phone with my virus"));
      // progressDialog.show();

      print('*********$json');
      var header = {'Content-Type': 'application/json'};
      // var url = Uri.parse(
      //     'http://chainathospital.org/coreapi/api/v2/get_med_exam_list/$inputHn');
      var url = Uri.parse(
          'http://chainathospital.org/coreapi/api/v2/get_med_exam_list/$inputHn');
      final response = await http.post(url, headers: header, body: json);
      var getData = jsonDecode(response.body);
      // progressDialog.dismiss();

      setState(() {
        // print('test ==> $getData ');
        if (getData['status']) {
          result = getData['data'];
          _ischeckData = true;
          print('xxxxxxxxxxxxxxxxxxxxxxxxx');
          print(result[0]['hn']);

          print(result[0]['medExamId']);

          print('==============$result');
        } else {
          _ischeckData = false;
        }
      });

      // GetHresult gethresult = GetHresult.fromJson(convert.jsonDecode(getData));

      // setState(() {
      //   if (getData['status'])
      //     for (var i = 0; i < gethresult.data.length; i++) {
      //       gethresults.add(gethresult);
      //     }
      //   // checkhnso();
      // });
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

      lo = false;
    } catch (e) {
      lo = false;
      print('error === $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // ptname = "${widget.ptname}";
    // hn = "${widget.hn}";
    // cid = "${widget.cid}";
    // age = "${widget.age}";
hn = "${widget.hn}";
    inputHn = "${widget.inputHn}";
    inputHn = "${widget.inputHn}";
    return Scaffold(
      
      // backgroundColor: Color(
      //       0xffE5E5E5,

      //     ),
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
                        '??????????????????????????????????????????????????????',
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
                    height: 10.0,
                  ),
                  Padding(padding: EdgeInsets.only(top: 5.0)),
                  Text(
                    '?????????????????? ??? ?????????????????? 12 ???.???. 2564 ???????????? 12.00 ???.',
                    style: GoogleFonts.kanit(
                      fontSize: 18.0,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20.0),
                  SingleChildScrollView(
                    physics: ScrollPhysics(),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: result.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, i) => Container(
                              width: MediaQuery.of(context).size.width * .95,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 1.0),
                              child: Card(
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
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(top: 45.0)),
                                          SizedBox(
                                              child: Text(
                                                '    ?????? :   ${result[i]['med_exam_year']} ',

                                                // "$departmentName",
                                                style: TextStyle(
                                                  color: Color(
                                                    0xff2D9CDB,
                                                  ),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "Kanit",
                                                ),

                                                textAlign: TextAlign.left,
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
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.85,
                                        child: Divider(
                                            height: 10,
                                            thickness: 1.25,
                                            color: Colors.grey[400]),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(top: 7.0)),
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              SizedBox(
                                                  child: Text(
                                                    '?????????????????? :  ${result[i]['med_exam_date']}',
                                                    style: GoogleFonts.kanit(
                                                      fontSize: 16.0,
                                                      color: Colors.grey[600],
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
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(top: 17.0)),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(top: 45.0)),
                                          InkWell(
                                            onTap: () {
                                              MaterialPageRoute route =
                                                  MaterialPageRoute(
                                                      builder: (value) =>
                                                          Hresultdetail(
                                                              hresult:
                                                                  result[i]));
                                              Navigator.push(context, route);
                                            },
                                            child: SizedBox(
                                              child: Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Text(
                                                  '  ??????????????????????????????',
                                                  // "$departmentName",
                                                  style: TextStyle(
                                                    color: Color(
                                                      0xff219653,
                                                    ),
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: "Kanit",
                                                  ),

                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.8,
                                            ),
                                          ),
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
                                      // Padding(padding: EdgeInsets.only(top: 7.0)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
}
