import 'dart:async';
import 'dart:convert';
import 'package:chainatqueue/models/department.dart';
import 'package:chainatqueue/models/getserviceList.dart';
import 'package:chainatqueue/models/patineModel.dart';
import 'package:chainatqueue/screens/internaldetail.dart';
import 'package:chainatqueue/screens/mystyle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;

class Dentist extends StatefulWidget {
  final GetDepartment getDepartment;
  final String hn, ptname,name,subinsclName, cid, age, inputHn, displayname,groupId;
  Dentist(
      {Key key,
      this.getDepartment,
      this.age,
      this.cid,
      this.hn,
      this.name,
      this.subinsclName,
      this.ptname,
      this.inputHn,
      this.groupId,
      this.displayname})
      : super(key: key);

  @override
  _DentistState createState() => _DentistState();
}

class _DentistState extends State<Dentist> {
  GetDepartment getDepartments;
  var servicegroupid, nameService, departmentName,servicegroupid1;
  String hn,
      ptname,
      cid,
      name,
      age,
      inputHn,
      subinsclName,
      displayname,
      dob,
      vn,
      listdepartmentName,
      datavisit,
      maindep;
  bool isHasData;
  List<GetserviceList> getsevices = List();

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> snapshots;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDepartments = widget.getDepartment;
  
    departmentName = getDepartments.servicegroupName;
     servicegroupid = "${widget.groupId}";
    servicegroupid1 = servicegroupid.toString();
    
    listdepartmentName = getDepartments.servicegroupName;
    servicegroupid = getDepartments.servicegroupid;
  subinsclName= "${widget.subinsclName}";
    inputHn = "${widget.inputHn}";
    name = "${widget.name}";
    cid = "${widget.cid}";
    ptname = "${widget.ptname}";
    displayname = "${widget.displayname}";
    print('####Q $inputHn');
    print('####Q $ptname');
     print('####Qnn $name');
    print('####Q $cid');
    print('###Q $listdepartmentName');
    findDepartmentList();
    print(servicegroupid);
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

          cid = '';
        });
      } else {
        isHasData = true;
        setState(() {
          ptname = patientModel.data[0].ptName;
          hn = patientModel.data[0].hn;
          age = patientModel.data[0].age;

          cid = patientModel.data[0].cid;
        });

        // patientModel.data.forEach((element) {
        //   print(element.age);
        //   print(element.ptName);
        //   print(element.hn);
        // });
      }
      print('ttyytyy = $ptname ,$hn,$age,$cid,$dob');
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

  Future<Null> findDepartmentList() async {
    var header = {'Content-Type': 'application/json'};
    var url = Uri.parse(
        "http://q.chainathospital.org/node/api/get_service_list/$servicegroupid");
    try {
      final http.Response response = await http.Client().get(
        url,
      );
      print('res = $response');
      var result = json.decode(response.body);
      print('result = $result');
      for (var map in result) {
        GetserviceList getserviceList = GetserviceList.fromJson(map);
        if (getserviceList.showOnMobile == 1) {
          setState(() {
            getsevices.add(getserviceList);
            hn = "${widget.hn}";
            cid = "${widget.cid}";
         
            inputHn = "${widget.inputHn}";
          });
        } else {
          Text('?????????????????????????????????');
        }
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    ptname = "${widget.ptname}";
    hn = "${widget.hn}";
    cid = "${widget.cid}";
    age = "${widget.age}";
    inputHn = "${widget.inputHn}";
    return Scaffold(
      // backgroundColor: Color(
      //   0xff0baabd,
      // ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 30.0)),
                  Row(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.arrow_back),
                          iconSize: 36.0,
                          color: Color(
                            0xff828282,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      Text(
                        '??????????????????',
                        style: GoogleFonts.prompt(
                          fontSize: 24.0,
                          color: Color(
                            0xff116EA8,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "?????????????????????????????????: $departmentName",
                        style: GoogleFonts.kanit(
                          fontSize: 18.0,
                          color: Color(
                            0xff116EA8,
                          ),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width,
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Divider(
                    height: 10,
                    thickness: 1.0,
                    color: Color(
                      0xffBDBDBD,
                    ),
                  ),
                  SizedBox(
                    height: 1.0,
                  ),
                  // Padding(padding: EdgeInsets.only(top:10.0)),
                  // Container(
                  //   width: MediaQuery.of(context).size.width * 0.85,
                  //   child: Text(
                  //     " $departmentName",
                  //     style: TextStyle(
                  //       color: Colors.blue,
                  //       fontSize: 24,
                  //       fontWeight: FontWeight.w400,
                  //       fontFamily: "Prompt",
                  //     ),
                  //     textAlign: TextAlign.left,
                  //   ),
                  // ),

                  Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: ListView.builder(
                      itemCount: getsevices.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) =>
                          Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5.0),
                        child: Card(
                          color: Color(
                            0xff2D9CDB,
                          ),
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: InkWell(
                            onTap: () {
                              //  MaterialPageRoute route = MaterialPageRoute(
                              //           builder: (value) => Dentist(
                              //                 getDepartment:
                              //                     getDepartments[index],
                              //                 ptname: ptname,
                              //                 cid: cid,
                              //                 hn: hn,
                              //                 age: age,
                              //               ));
                              MaterialPageRoute route = MaterialPageRoute(
                                builder: (value) => Internaldetail(
                                    name: departmentName,
                                    ptname: ptname,
                                    cid: cid,
                                    subinsclName:subinsclName,
                                    hn: hn,
                                    listdepartmentName:listdepartmentName,
                                    inputHn: inputHn,
                                    age: age,
                                    idlist: getsevices[index].serviceGroupid.toString(),
                                     gidlist: getsevices[index].serviceid.toString(),
                                    nlist: getsevices[index].serviceName,
               
                                                grtserviceid:
                                                    getsevices[index].serviceid,
                                                service: getsevices[index].serviceName
                                    ),
                              );
                              Navigator.push(context, route);
                            },
                            child: Container(
                              height: 76.0,
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                children: [
                                  Text(
                                    getsevices[index].serviceName,
                                    // getsevices[index].btnKioskName,
                                    style: GoogleFonts.kanit(
                                      fontSize: 28.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
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
