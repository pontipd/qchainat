import 'dart:convert';
import 'package:chainatqueue/models/department.dart';
import 'package:chainatqueue/models/getnhso.dart';
import 'package:chainatqueue/models/getserviclistt.dart';
import 'package:chainatqueue/models/patineModel.dart';

import 'package:chainatqueue/screens/de.dart';
import 'package:chainatqueue/screens/dentist.dart';
import 'package:chainatqueue/screens/internaldetail.dart';
import 'package:chainatqueue/screens/startouse.dart';
import 'package:http/http.dart' as http;
import 'package:chainatqueue/models/getDepartment.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;

class Department extends StatefulWidget {
  final String hn, ptname, cid, cids, age, pt, inputHn, displayname, name;
  Department(
      {Key key,
      this.age,
      this.cid,
      this.cids,
      this.hn,
      this.ptname,
      this.pt,
      this.inputHn,
      this.displayname,
      this.name})
      : super(key: key);

  @override
  _DepartmentState createState() => _DepartmentState();
}

class _DepartmentState extends State<Department> {
  List<GetDepartment> getDepartments = List();
  String serviceGroup_id,
      hn,
      ptname,
      cid,
      cids,
      age,
      inputHn,
      displayname,
      servicegroupid,
      service,
      name;
  var count11, serviceId;
  String birth;
  int countSelect;
  String fname;
  String hmain;
  String hmainName;
  String lname;
  String maininscl;
  String maininsclMain;
  String maininsclName;
  String nation;
  String personId;
  String primaryAmphurName;
  String primaryMoo;
  String primaryMoobanName;
  String primaryProvinceName;
  String primaryTumbonName;
  String primaryprovince;
  String purchaseprovince;
  String purchaseprovinceName;
  String sex;
  String startdate;
  String startdateSss;
  String subinscl;
  String subinsclName;
  String title;
  String titleName;
  String wsDataSource;
  String wsDateRequest;
  String wsStatus;
  String wsStatusDesc;
  String wsid;
  String pt;
  String wsidBatch;
  List<GetserviceList> getsevices = List();

  @override
  void initState() {
    super.initState();
    onGetData();
    department();

    hn = "${widget.inputHn}";
    ptname = "${widget.ptname}";
    name = "${widget.name}";
    inputHn = "${widget.inputHn}";
    cid = "${widget.cid}";
    getPtright();
    displayname = "${widget.displayname}";
    print('*** $cid');
    print('*** $hn');
  }

  Future<Null> department() async {
    var url = Uri.parse(
        'http://q.chainathospital.org/node/api/get_servicegroup_list');
    try {
      final http.Response response = await http.Client().get(
        url,
      );
      print('res = $response');
      var result = json.decode(response.body);
      print('result = $result');
      if (result.toString() != null) {
        for (var map in result) {
          GetDepartment getDepartment = GetDepartment.fromJson(map);
          print('map === $map');
          if (getDepartment.servicegroupClinic == 'T') {
            setState(() {
              getDepartments.add(getDepartment);
              hn = "${widget.inputHn}";
              cid = "${widget.cid}";
            });
          }
        }
      } else {
        Text('ไม่มีข้อมูล');
      }
    } catch (e) {}
  }
  // Future<Null> department() async {
  //   var header = {'Content-Type': 'application/json'};
  //   var url = Uri.parse(
  //       'http://q.chainathospital.org/node/api/get_servicegroup_list');

  //   try {
  //     // final http.Response response = await http.Client().get(
  //     //   url,
  //     // );
  //     var response = await http.get(url, headers: header);
  //   var result = json.decode(response.body);
  //     print('res = $response');
  //     print('result = $result');
  //     if (result.toString() != null) {
  //       for (var map in result) {
  //         GetDepartment getDepartment = GetDepartment.fromJson(map);
  //         if (getDepartment.servicegroupClinic=='T'){
  //           // servicegroupClinic == "T"
  //           setState(() {
  //             getDepartments.add(getDepartment);
  //             hn = "${widget.hn}";
  //             cid = "${widget.cid}";
  //           });
  //         }
  //       }
  //     } else {
  //       Text('ไม่มีข้อมูล');
  //     }
  //   } catch (e) {}
  // }

  // Future<Null> getdepartment() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   String servicegroupid = preferences.getString('id');
  //   print('servicegroupid ==> $servicegroupid');
  // }

  // ignore: deprecated_member_use

//  Future<Null> getdepartmen() async {
//     String url =Uri.parse("http://q.chainathospital.org/node/api/get_servicegroup_list");
//     try {

//       final http.Response response = await http.Client().get(url,);

//       print('res = $response');
//       var result = json.decode(response.body);
//       print('result = $result');
//       if (result.toString() != null) {
//         for (var map in result) {
//           GetDepartments getDepartmentp = GetDepartments.fromJson(map);

//           setState(() {
//             getDepartment.add(getDepartmentp);
//             // print(' map = $map');
//           });
//         }
//       } else {
//         Text('ไม่มีข้อมูล');
//       }
//     } catch (e) {}
//   }
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

     
      }
      print('##55555 = $ptname ,$hn,$age,$cid,$dob');
    } catch (e) {}

 
  }

  Future<Null> getPtright() async {
    var url =
        Uri.parse('http://q.chainathospital.org/app/kiosk/pt-right?cid=$cid');
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
          birth = getptright.birthdate;
          // countSselect = getptright.countSelect;
          fname = getptright.fname;
          lname = getptright.lname;
          maininscl = getptright.maininscl;
          maininsclMain = getptright.maininsclMain;
          maininsclName = getptright.maininsclName;
          nation = getptright.nation;
          primaryAmphurName = getptright.primaryAmphurName;
          personId = getptright.personId;
          primaryAmphurName = getptright.primaryAmphurName;
          primaryMoo = getptright.primaryMoo;
          primaryMoobanName = getptright.primaryMoobanName;
          primaryProvinceName = getptright.primaryprovince;
          primaryTumbonName = getptright.primaryTumbonName;
          primaryprovince = getptright.primaryprovince;
          purchaseprovince = getptright.purchaseprovince;
          purchaseprovinceName = getptright.purchaseprovinceName;
          sex = getptright.sex;
          startdate = getptright.startdate;
          startdateSss = getptright.startdateSss;
          subinscl = getptright.subinscl;
          subinsclName = getptright.subinsclName;
          title = getptright.title;
          titleName = getptright.titleName;
          wsDataSource = getptright.wsDataSource;
          wsDateRequest = getptright.wsDateRequest;
          wsStatus = getptright.wsStatus;
          wsStatusDesc = getptright.wsStatusDesc;
          wsid = getptright.wsid;
          wsidBatch = getptright.wsidBatch;
          print('555555555555555555555555555555555555555555$subinsclName');
          // checkappointment();
        });
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        'จองคิว',
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
                        " เลือกแผนก/คลินิก",
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
                    height: 15,
                    thickness: 1.0,
                    color: Color(
                      0xffBDBDBD,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                 
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      itemCount: getDepartments.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) =>
                          Container(
                        width: MediaQuery.of(context).size.width * 0.85,
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
                            onTap: () async {
                              if (getDepartments[index].subserviceStatus == 1) {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.leftToRight,
                                      child: Dentist(
                                        getDepartment: getDepartments[index],
                                        ptname: ptname,
                                        cid: cid,
                                        hn: hn,
                                        subinsclName:subinsclName,
                                        age: age,
                                        groupId: getDepartments[index]
                                            .servicegroupid
                                            .toString(),
                                      )),
                                );
                              } else {
                                await checkService(
                                    getDepartments[index].servicegroupid);
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.leftToRight,
                                    child: Internaldetail(
                                      ptname: ptname,
                                      dob: dob,
                                      age: age,
                                      hn: inputHn,
                                      inputHn: inputHn,
                                      cid: cid,
                                      subinsclName:subinsclName,
                                      service: service,
                                      serviceId: serviceId,
                                      grtserviceid: serviceId,
                                      servicegroupId:
                                          (getDepartments[index].servicegroupid)
                                              .toString(),
                                      name: getDepartments[index]
                                          .servicegroupName,
                                    ),
                                  ),
                                );
                              }
                            },
                            //   MaterialPageRoute route = MaterialPageRoute(
                            //       builder: (value) => Dentist(
                            //             getDepartment: getDepartments[index],
                            //             ptname: ptname,
                            //             cid: cid,
                            //             hn: hn,
                            //             inputHn: inputHn,
                            //             age: age,
                            //           ));
                            //   // MaterialPageRoute route = MaterialPageRoute(

                            //   //     builder: (value) => Internaldetail(
                            //   //           getDepartment: getDepartments[index],
                            //   //           // ptname: ptname,
                            //   //           // cid: cid,
                            //   //           // hn: hn,
                            //   //           // age: age,
                            //   //         ));
                            //   Navigator.push(context, route);
                            // },
                            child: Container(
                              height: 76.0,
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                children: [
                                  Text(
                                    getDepartments[index].servicegroupName,
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

  Future<Null> findDepartmentList() async {
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

        setState(() {
          getsevices.add(getserviceList);
        });
      }
    } catch (e) {}
  }

  Future checkService(id) async {
    var url =
        Uri.parse("http://q.chainathospital.org/node/api/get_service_list/$id");
    try {
      final http.Response response = await http.get(
        url,
      );
      print('res = $response');
      var result = json.decode(response.body);
      print('result = $result');
      for (var map in result) {
        GetserviceList getserviceList = GetserviceList.fromJson(map);
        service = getserviceList.serviceName;
        serviceId = (getserviceList.serviceid);

        print("************checkService/////////////////////////////////////");
        print("************checkService$service");
        print("************checkService$serviceId");
      }
    } catch (e) {}
  }
}
