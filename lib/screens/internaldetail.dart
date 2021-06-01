import 'dart:convert';
import 'package:chainatqueue/models/getgueue.dart';
import 'package:chainatqueue/models/getnhso.dart';
import 'package:chainatqueue/models/patineModel.dart';
import 'package:chainatqueue/provider/app_provider.dart';
import 'package:chainatqueue/screens/startouse.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:chainatqueue/models/getDepartment.dart';
import 'package:chainatqueue/models/getappoint.dart';
import 'package:chainatqueue/models/getserviceList.dart';
import 'package:chainatqueue/screens/bookQnonh.dart';
import 'package:chainatqueue/screens/bookQresHN.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

// import 'package:kioskregis/model/department.dart';
// import 'package:kioskregis/model/getserviceList.dart';
// import 'package:kioskregis/mystyle.dart';
FirebaseMessaging messaging = FirebaseMessaging.instance;

class Internaldetail extends StatefulWidget {
  final int grtserviceid, serviceId;
  final String name,
      hn,
      tokenn,
      serv,
      ptname,
      cid,
      phone,
      age,
      inputHn,
      displayname,
      hns,
      listdepartmentName,
      dob,
      pt,
      reason,
      doctorId,
      doctorname,
      appointStatus,
      nlist,
      appointRightCode,
      apponitRight,
      idlist,
      gidlist,
      subinsclName,
      servicegroupId,
      service;

  Internaldetail(
      {Key key,
      this.name,
      this.tokenn,
      this.phone,
      this.serviceId,
      this.gidlist,
      this.idlist,
      this.serv,
      this.service,
      this.subinsclName,
      this.nlist,
      this.listdepartmentName,
      this.age,
      this.cid,
      this.hn,
      this.hns,
      this.grtserviceid,
      this.ptname,
      this.inputHn,
      this.dob,
      this.appointRightCode,
      this.appointStatus,
      this.apponitRight,
      this.doctorId,
      this.doctorname,
      this.pt,
      this.servicegroupId,
      this.reason,
      this.displayname})
      : super(key: key);

  @override
  _InternaldetailState createState() => _InternaldetailState();
}

class _InternaldetailState extends State<Internaldetail> {
  set floatingActionButton(Container floatingActionButton) {}
  int id;
  String departmentName,
      service,
      serviceId,
      serviceGroupid,
      serviceid1,
      idlist,
      gidlist,
      q,
      qHn,
      phone,
      queueLeft,
      serid,
      name,
      hn,
      serv,
      ptname,
      cid,
      age,
      inputHn,
      displayname,
      dob,
      pt,
      tokenn,
      statusdesc,
      request,
      status,
      listdepartmentName,
      servicegroupId,
      grtserviceid,
      qids,
      servicename,
      servid,
      nlist,
      reason,
      doctorId,
      doctorname,
      appointStatus,
      appointRightCode,
      service_status_name,
      queue_left,
      apponitRight;
  int countSselect;
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
 
  String token;
  String uid;
  String wsidBatch;
  GetserviceList getserviceList;
  var now = DateTime.now();
  var date;

  bool isHasData = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cid = "${widget.cid}";
    print('77777777internal $cid');

    getPtright();
    findProfile();
    serv = "${widget.serv}";
    phone = "${widget.phone}";
    // service = getserviceList.serviceName;
    inputHn = "${widget.inputHn}";
    cid = "${widget.cid}";
    listdepartmentName = "${widget.listdepartmentName}";
    displayname = "${widget.displayname}";
    departmentName = "${widget.name}";

    serviceGroupid = "${widget.servicegroupId}";
    serid = "${widget.grtserviceid}";
    serviceId = "${widget.serviceId}";
    service = "${widget.service}";
    serviceid1 = "${widget.serviceId}";
    tokenn = "${widget.tokenn}";
    print(serviceGroupid);
    print(serid);
    print('####internal  $inputHn');
    print('####internal $cid');
    findDepartmentList();
    print(departmentName);

    print(serviceGroupid);
    print(serviceid1);
    var month = now.month.toString().padLeft(2, '0');
    var day = now.day.toString().padLeft(2, '0');
    date = "${now.year}" + "-" + "$month" + "-" + "$day";
    print('date   ---- $date');

    messaging.getToken().then(setToken);
    setState(() {
      token = token;
      tokenn = token;
      print('tokenn =====>$tokenn');
    });

    // onGetData();
  }

  void setToken(String token) {
    setState(() {
      token = token;
      tokenn = token;

      print('tokenn =====>$tokenn');
    });
  }


  Future<void> findProfile() async {
    var appState = Provider.of<AppProvider>(context, listen: false);
    var header = {'Content-Type': 'application/json'};
    var url = Uri.parse(
        'http://chainathospital.org/coreapi/api/v2/get_patient_info/${appState.patientInfo.hns}');

    var response = await http.get(url, headers: header);
    var result = jsonDecode(response.body);
    print('------$result');
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
          dob = patientModel.data[0].dob;
          cid = patientModel.data[0].cid;
          phone = patientModel.data[0].phone;
          uid = appState.patientInfo.uid;
          print('*****1====$hn');
          print('*****1====$age');
          print('*****1====$phone');
          checkhn();
        });
      }
      print('ttyytyy = $ptname ,$hn,$age,$cid,$dob,$uid');
    } catch (e) {
      print(e);
    }
  }

  Future<Null> findDepartmentList() async {
    var header = {'Content-Type': 'application/json'};
    var url = Uri.parse(
        'http://q.chainathospital.org/node/api/get_servicegroup_list');

    var response = await http.get(url, headers: header);
    var result = json.decode(response.body);
    for (var map in result) {
      GetserviceList getserviceList = GetserviceList.fromJson(map);
      setState(() {
        // service = getserviceList.serviceName;
      });
    }
  }

  Future<Null> checkhn() async {
    var appState = Provider.of<AppProvider>(context, listen: false);
    var header = {'Content-Type': 'application/json'};
    var url = Uri.parse(
        'http://chainathospital.org/coreapi/api/v2/get_patient_info/${appState.patientInfo.hns}/$date');

    var response = await http.get(url, headers: header);

    try {
      Getappointmen getappointmen =
          Getappointmen.fromJson(convert.jsonDecode(response.body));
      if (getappointmen.status == false) {
        isHasData = false;
      } else {
        isHasData = true;
      }
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
          countSselect = getptright.countSelect;
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
          //     print('555555555555555555555555555555555555555555$subinsclName');
          // checkappointment();
        });
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    departmentName = "${widget.service}";
    ptname = "${widget.ptname}";
    idlist = "${widget.idlist}";
    gidlist = "${widget.gidlist}";
    hn = "${widget.hn}";
    cid = "${widget.cid}";
    phone = "${widget.phone}";
    serv = "${widget.cid}";
    servicename = "${widget.nlist}";
    serviceGroupid = "${widget.servicegroupId}";
    serviceId = "${widget.grtserviceid}";
    age = "${widget.age}";
    inputHn = "${widget.inputHn}";
    tokenn = "${widget.tokenn}";
    subinsclName = "${widget.subinsclName}";
    tokenn = tokenn;
    return Scaffold(
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
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  SizedBox(
                    child: Text(
                      "                             ตรวจสอบรายการ",
                      style: GoogleFonts.prompt(
                        fontSize: 18.0,
                        color: Color(
                          0xff116EA8,
                        ),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    width: 450,
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Divider(
                    height: 15,
                    thickness: 1.0,
                    color: Color(
                      0xfff828282,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Card(
                    color: Colors.grey[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          SizedBox(
                              child: Text(
                                "$departmentName",
                                // "$service",
                                style: TextStyle(
                                  color: Color(
                                    0xff116EA8,
                                  ),
                                  fontSize: 32,
                                  height: 2,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Kanit",
                                ),
                                textAlign: TextAlign.center,
                              ),
                              width: MediaQuery.of(context).size.width * 0.85),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: Divider(
                                height: 25,
                                thickness: 1.25,
                                color: Colors.grey[400]),
                          ),
                          Padding(padding: EdgeInsets.only(top: 7.0)),
                          SizedBox(
                            child: Text(
                              "ตรวจรักษา",
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
                          Padding(padding: EdgeInsets.only(top: 7.0)),
                          SizedBox(
                            height: 40.0,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 300.0,
                  ),
                  floatingActionButton = Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: 50.0,
                    child: FloatingActionButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.5)),
                      clipBehavior: Clip.antiAlias,
                      onPressed: () async {
                        print(inputHn);
                        print(idlist);
                        print(gidlist);
                        print(subinsclName);
                        print('dddddd $cid');
                        print('=========> $tokenn');
                        await checkhn(); 
                        await findProfile();
                        if (isHasData == true) {
                          Map<String, dynamic> _map = {
                            "patient_info": {
                              "pt_name": ptname,
                              "hn": inputHn,
                              "cid": cid,
                              "dob": dob,
                              "age": age,
                              "phone": phone,
                              "data_visit": [
                                {
                                  "vn": "null",
                                  "main_dep": "null",
                                  "department": "null",
                                  "qn": "null"
                                },
                                {
                                  "vn": "null",
                                  "main_dep": "null",
                                  "department": "null",
                                  "qn": "null"
                                }
                              ],
                              "vn": ["null", "null"],
                              "main_dep": ["null", "null"],
                              "department": [
                                "null : null",
                                "null",
                                "null : null",
                                "null"
                              ]
                            },
                            "right": {
                              "birthdate": "birthdate",
                              "count_select": countSselect,
                              "fname": fname,
                              "lname": lname,
                              "maininscl": maininscl,
                              "maininscl_main": "maininsclM",
                              "maininscl_name": pt,
                              "nation": nation,
                              "person_id": personId,
                              "primary_amphur_name": primaryAmphurName,
                              "primary_moo": primaryMoo,
                              "primary_mooban_name": primaryMoobanName,
                              "primary_province_name": primaryProvinceName,
                              "primary_tumbon_name": primaryTumbonName,
                              "primaryprovince": primaryprovince,
                              "sex": sex,
                              "subinscl": subinscl,
                              "subinscl_name": subinsclName,
                              "title": title,
                              "title_name": titleName,
                              "ws_data_source": wsDataSource,
                              "ws_date_request": wsDateRequest,
                              "ws_status": wsStatus,
                              "ws_status_desc": wsStatusDesc,
                              "wsid": wsid,
                              "wsid_batch": wsidBatch
                            },
                            "appoint": {
                              "appoint_id": null,
                              "pt_name": null,
                              "hn": null,
                              "appoint_date": null,
                              "appoint_time_begin": null,
                              "appoint_time_end": null,
                              "depcode": null,
                              "department": null,
                              "appoint_preparing": null,
                              "appoint_reason": null,
                              "doctor_id": null,
                              "doctor_name": null,
                              "appoint_status": null,
                              "appoint_right_code": null,
                              "appoint_right": null,
                            },
                            // "servicegroupid": idlist,
                            //   "serviceid": gidlist,
                            //   "created_from": 2,
                            //   "quickly": 0
                            "servicegroupid": serviceGroupid,
                            "serviceid": serid,
                            "created_from": 2,
                            "quickly": 0,
                            "q_status_id": 6,
                            "u_id": uid,
                            "token": tokenn
                          };
                          var json = jsonEncode(_map);
                          await queue(http.Client(), json);
                          print('$json');
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.leftToRight,
                                  child: BookgueueresHN(
                                    // hn: hns,
                                    qids: qids,
                                    service_status_name: service_status_name,
                                    queue_left: queue_left,
                                    qHn: qHn,
                                    q: q,
                                    idlist: idlist,
                                    gidlist: gidlist,
                                    servicename: servicename,
                                    listdepartmentName: listdepartmentName,
                                    departmentName: departmentName,
                                    inputHn: inputHn,
                                  )));
                        } else if (isHasData == false) {
                          Map<String, dynamic> _map = {
                            "patient_info": {
                              "pt_name": ptname,
                              "hn": inputHn,
                              "cid": cid,
                              "dob": dob,
                              "age": age,
                              "data_visit": null,
                              "vn": null,
                              "main_dep": null,
                              "department": null
                            },
                            "right": {
                              "birthdate": "birth",
                              "count_select": 'countSselect',
                              "fname": 'fname',
                              "lname": 'lname',
                              "maininscl": 'maininscl',
                              "maininscl_main": 'maininsclM',
                              "maininscl_name": 'pt',
                              "nation": 'nation',
                              "person_id": 'personId',
                              "primary_amphur_name": 'amphur',
                              "primary_moo": 'moo',
                              "primary_mooban_name": 'mooban',
                              "primary_province_name": 'province',
                              "primary_tumbon_name": 'tumbon',
                              "primaryprovince": 'zipcode',
                              "sex": 'sex',
                              "subinscl": 'subinscl',
                              "subinscl_name": 'pt1',
                              "title": 'title',
                              "title_name": 'titlename',
                              "ws_data_source": 'source',
                              "ws_date_request": 'request',
                              "ws_status": 'status1',
                              "ws_status_desc": 'statusdesc',
                              "wsid": 'wsid',
                              "wsid_batch": 'wsidbatch'
                            },
                            "appoint": {
                              "appoint_id": "3567018",
                              "pt_name": ptname,
                              "hn": inputHn,
                              "appoint_date": "",
                              "appoint_time_begin": "",
                              "appoint_time_end": "",
                              "depcode": "010",
                              "department": service,
                              "appoint_preparing": null,
                              "appoint_reason": reason,
                              "doctor_id": doctorId,
                              "doctor_name": doctorname,
                              "appoint_status": appointStatus,
                              "appoint_right_code": appointRightCode,
                              "appoint_right": apponitRight
                            },
                            "servicegroupid": serviceGroupid,
                            "serviceid": serid,
                            "created_from": 1,
                            "quickly": 0,
                            "q_status_id": 6,
                            "u_id": "test"
                          };
                          var json = await jsonEncode(_map);
                          await queue(http.Client(), json);
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.leftToRight,
                              child: BookgueueONHN(
                                // departmentName:departmentName,
                                // hn: hns,
                                q: q,

                                listdepartmentName: listdepartmentName,
                                inputHn: inputHn,
                              ),
                            ),
                          );
                        }
                      },
                      backgroundColor: Color(
                        0xff2D9CDB,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                          ),
                          Text(
                            'ยืนยันการจองคิว',
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
        ),
      ),
    );
  }

  Future<Null> queue(http.Client client, var json) async {
    var url = Uri.parse('http://q.chainathospital.org/app/kiosk/create-queue');
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json,
      );
      var getData = await jsonDecode(response.body);
      var getQ = await Getqueue.fromJson(getData);
      print('pgpgpgpgpgpgp');
      print(getQ.service_status_name);
      print(getQ.queue_left);
      print(getQ.modelQueue.qIds);

      setState(() {
        q = getQ.modelQueue.qNum;
        qids = getQ.modelQueue.qIds.toString();
        service_status_name = getQ.service_status_name;
        queue_left = getQ.queue_left;
        qHn = getQ.modelQueue.qHn;
      });

      print('qqqqq $q');
      print('qqqqq $service_status_name');
      print('qqqqq $queue_left');
      print('qqqqq $qHn');

      //  print('test ==> $getData ');
      // Map<String, dynamic> getqueue = jsonDecode(getData);
      // var getQe = Getqueue.fromJson(jsonDecode(getData));
      // print('qqqqq');
      // print(getQ.service_status_name);
      // print(getQ.queue_left);
      //print(getQe.service_status_name);
    } catch (e) {
      print(e);
    }
  }
}
