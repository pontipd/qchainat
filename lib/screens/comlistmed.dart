import 'dart:convert';
import 'dart:convert' as convert;
import 'package:chainatqueue/models/album.dart';
import 'package:chainatqueue/models/appoint.dart';
import 'package:chainatqueue/models/checkhnso.dart';
import 'package:chainatqueue/models/getAppointment.dart';
import 'package:chainatqueue/models/getconfig.dart';
import 'package:chainatqueue/models/getgueue.dart';
import 'package:chainatqueue/models/gethresult.dart';
import 'package:chainatqueue/models/getrx.dart';
import 'package:chainatqueue/models/hresulty.dart';
import 'package:chainatqueue/models/rxde.dart';
import 'package:chainatqueue/models/rxqn.dart';

import 'package:chainatqueue/models/user_model.dart';
import 'package:chainatqueue/screens/Medicineroom.dart';
import 'package:chainatqueue/screens/Page5.dart';
import 'package:chainatqueue/screens/Selectdepartment.dart';
import 'package:chainatqueue/screens/appointmentdetil.dart';
import 'package:chainatqueue/screens/dentist.dart';
import 'package:chainatqueue/screens/getmedicine.dart';
import 'package:chainatqueue/screens/internaldetail.dart';
import 'package:chainatqueue/screens/page2.dart';
import 'package:chainatqueue/screens/page3.dart';
import 'package:chainatqueue/screens/queue.dart';
import 'package:chainatqueue/screens/startouse.dart';
import 'package:chainatqueue/transitions/enter_exit_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:page_transition/page_transition.dart';
import 'hresultdetil.dart';
import 'medicalrecord.dart';
import 'page1.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
int selectedPage = 0;
final _pageOptions = [Page1(), Queue(), Page5(), Page3(), Page2()];

class Comlistmed extends StatefulWidget {
  String ptname, cid, age, pt, inputHn, rxid, qfir, count;
  int qstatus;
  // Getappointmen getappointment;

  Comlistmed(
      {Key key,
      this.age,
      this.cid,
      this.inputHn,
      this.ptname,
      this.pt,
      this.count,
      this.qfir,
      this.rxid})
      : super(key: key);
  @override
  _ComlistmedState createState() => _ComlistmedState();
}

class _ComlistmedState extends State<Comlistmed> {
  String displayname, inputHn;
  // Future<List<Appoint>> getappointments;
  // Future<List<Hresulty>> hresulty;
  Future<List<Rxde>> rxde;
  List<GetRx> getrX = List();

  List<ChackHnso> checkHnso = List();
  var hnso;
  int qstatus;
  ChackHnso chackHnso;
  String staus,
      statusDrug = '0',
      servicid,
      oldStatus = '0',
      servicgroub,
      q,
      qids;
  bool status;
  String rxtype;
  String rxid, qfir, count;
  User user;
  UserModel patient;
  var floatingActionButton;
  bool loading = false;
  var now = DateTime.now();
  var date;
  @override
  void initState() {
    super.initState();
    // finddisplay();
    loading = true;
    rxid = "${widget.rxid}";
    age = "${widget.age}";
    count = "${widget.count}";
    qfir = "${widget.qfir}";
    print('-------------$qfir');
    print('==========$count');
    // print('object------------------------$age');
    inputHn = "${widget.inputHn}";
    print(_auth.currentUser);
    user = _auth.currentUser;
    getuser();
    configRx1();
    readData();

    var month = now.month.toString().padLeft(2, '0');
    var day = now.day.toString().padLeft(2, '0');
    date = "${now.year}" + "-" + "$month" + "-" + "$day";
    print(date);
    // futureAlbum = fetchAlbum();
  }

  

  Future configRx1() async {
    var url =
        Uri.parse('http://q.chainathospital.org/node/api/get_drug_config');
    try {
      final response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
      );
      //  print('ress =${response.body}');
      var result = json.decode(response.body);
      print('ress =$result');
      for (var map in result) {
        Getconfig getconfig = Getconfig.fromJson(map);
        if (int.parse(count) <= getconfig.drugQty) {
          print('count $count');
          setState(() {
            //ยาด่วน
            statusDrug = '1';
            print('drug(1 ด่วน 0 ปกติ) $statusDrug');
          });
        } else {
          setState(() {
            statusDrug = "0";
            print('drug(1 ด่วน 0 ปกติ) $statusDrug');
          });
        }
      }
    } catch (e) {
      print('errr');
      print(e);
    }
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

        // fetch();
        print(
            '-----------------------------Document data: ${documentSnapshot.data()} ');
        hns = patient.hns;

        Map<String, dynamic> _map = {
          "rx_number": "${widget.rxid}",
          // "date": "2021-04-20",
        };
        var data = jsonEncode(_map);
        fetchs(data);
        print('hns==== $hns');
      } else {
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

  //     });
  //   });

  // }
  // }

  Future<Null> readData() async {
    await Firebase.initializeApp().then((value) {
      print('init');
    });
  }

  Future<List<Rxde>> fetchs(data) async {
    try {
      var header = {'Content-Type': 'application/json'};
      var url =
          Uri.parse('http://chainathospital.org/coreapi/api/v2/get_rx_detail');

      final response = await http.post(url, headers: header, body: data);

      if (response.statusCode == 200) {
        print(response.statusCode);
        print('rxrxrxrxrxrxrxrxrxrxr');
        print(json.decode(response.body));
        print('*********$response.');

        final result = jsonDecode(response.body);

        if (result['status'] == false) {
          print('#########3');
          setState(() {
            loading = false;
          });
        } else {
          print('rrrrrr=${result['data']}');

          List data = result['data'];
          setState(() {
            loading = false;

            rxde = Future.value(
                data.map((job) => new Rxde.fromJson(job)).toList());
            // checkhnso();
          });
        }
      } else {
        loading = false;
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load album');
      }
    } catch (e) {
      print('error === $e');
    }
  }

  Future _refreshData() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {});
  }

  Future test(int value) {
    print(value);
  }

  // Future<Null> medList(http.Client client, var json) async {
  //   var url = Uri.parse(
  //       'http://chainathospital.org/coreapi/api/v2/get_rx_list_by_qn');

  //   print('ooooooooooooooooooooooooooo');
  //   try {
  //     final response = await client.post(url,
  //         headers: {"Content-Type": "application/json"}, body: json);
  //     var getRxx = jsonDecode(response.body);
  //     GetRx getRx = GetRx.fromJson(convert.jsonDecode(response.body));
  //     rxtype = getRx.data[0].rxType;
  //     rxid = getRx.data[0].rxOperatorId;
  //     print('ooooooooooooooooooooooooooo');
  //     print(getRx.data[0].rxType);
  //     print('$rxtype');
  //     print(getRx.data[0].dataPharmacy[0].pharmacyDrugName);
  //     for (var i = 0; i < getRx.data[0].dataPharmacy.length; i++) {
  //       setState(() {
  //         getrX.add(getRx);
  //         // rxtype = getRx.data[0].rxType;
  //       });
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('kkkkk'),
      ),

      //     bottomNavigationBar: ConvexAppBar(
      //   items: [
      //     TabItem(icon: Icons.home, title: 'Home'),
      //     TabItem(icon: Icons.map, title: 'Discovery'),
      //     TabItem(icon: Icons.add, title: 'Add'),
      //     TabItem(icon: Icons.message, title: 'Message'),
      //     TabItem(icon: Icons.people, title: 'Profile'),
      //   ],
      //   initialActiveIndex: 2,//optional, default as 0
      //   onTap: (int i) => print('click index=$i'),
      // ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.90,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Center(
                    child: Text('ตรวจสอบรายการ',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan[400]))),
              ),
              Expanded(
                child: Center(
                  child: Card(
                      elevation: 2.0,
                      child: Container(
                          height: MediaQuery.of(context).size.height,
                          child: RefreshIndicator(
                            onRefresh: _refreshData,
                            child: FutureBuilder<List<Rxde>>(
                              future: rxde,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                    itemCount: snapshot.data.length,
                                    itemBuilder: (context, index) {
                                      return AppointItem(
                                          rxde: snapshot.data[index],
                                          testfn: test);
                                    },
                                  );
                                } else if (snapshot.hasError) {
                                  return Text("error${snapshot.error}");
                                } else if (!loading && !snapshot.hasData) {
                                  return Text("w,jjjjjjjj");
                                }

                                // By default, show a loading spinner.
                                return CircularProgressIndicator();
                              },
                            ),
                          ))),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              floatingActionButton = Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 50.0,
                child: FloatingActionButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.5)),
                  clipBehavior: Clip.antiAlias,
                  onPressed: () async {
                    await checkq();
                    // MaterialPageRoute route = MaterialPageRoute(
                    //     builder: (value) => Department(

                    //         ));
                    // Navigator.push(context, route);
                  },
                  backgroundColor: Color(
                    0xffef8b43,
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
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future checkq() async {
    if (oldStatus == '1' && qfir == '1') {
      setState(() {
        servicid = '56';
        qstatus = 11;
        servicgroub = '26';
      });
    } else if (oldStatus == '1' && qfir == '0') {
      setState(() {
        servicid = '56';
        qstatus = 12;
        servicgroub = '25';
      });
    } else if (oldStatus == '0' && qfir == '1' && statusDrug == '0') {
      setState(() {
        servicid = '52';
        qstatus = 11;
        servicgroub = '26';
      });
    } else if (oldStatus == '0' && qfir == '1' && statusDrug == '1') {
      setState(() {
        servicid = '51';
        qstatus = 11;
        servicgroub = '26';
      });
    } else if (oldStatus == '0' && qfir == '0' && statusDrug == '0') {
      setState(() {
        servicid = '52';
        qstatus = 12;
        servicgroub = '25';
      });
    } else if (oldStatus == '0' && qfir == '0' && statusDrug == '1') {
      setState(() {
        servicid = '51';
        qstatus = 12;
        servicgroub = '25';
      });
    }
    //save queue
    Map<String, dynamic> _map = {
      "patient_info": {
        "pt_name": "น.ส.ศรีสุนันท์ หาคม",
        "hn": "0116405",
        "cid": "1180400006631",
        "dob": "1985-08-06",
        "age": "35 ปี",
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
        "appoint_id": null,
        "pt_name": null,
        "hn": null,
        "appoint_date": null,
        "appoint_time_begin": "",
        "appoint_time_end": "",
        "depcode": "010",
        "department": null,
        "appoint_preparing": null,
        "appoint_reason": null,
        "doctor_id": null,
        "doctor_name": null,
        "appoint_status": null,
        "appoint_right_code": null,
        "appoint_right": null
      },
      "servicegroupid": '25',
      "serviceid": '51',
      "created_from": 2,
      "q_status_id": '23',
      "u_id": null,
      "quickly": 0
    };
    var json = jsonEncode(_map);
    print(json);
    await getQueues(json);
  }
 Future getQueues(json) async {
    print(json);
    var url = Uri.parse('http://q.chainathospital.org/app/kiosk/create-queue');
    try {
      final response = await http.post(
        url,
        headers: <String, String>{"Content-Type": "application/json"},
        body: json,
      );
      var getData = await jsonDecode(response.body);
      var getQ = await Getqueue.fromJson(getData);
      print(getQ.modelQueue.qIds);
      setState(() {
        q = getQ.modelQueue.qNum;
        qids = getQ.modelQueue.qIds.toString();
      });

      print('qqqqq $q');
    } catch (e) {
      print('errrrr');
      print(e);
    }
  }
}

class AppointItem extends StatelessWidget {
  AppointItem({Key key, this.appoint, this.testfn, this.hresulty, this.rxde})
      : super(key: key);
  final Appoint appoint;
  final Hresulty hresulty;
  final Rxde rxde;

  final Function testfn;
  List<ChackHnso> checkHnso = List();
  List<GetRx> getRx = List();
  List<GetRx> getrX = List();
  GetRx getrx;

  var hnso;
  bool staus;
  ChackHnso chackHnso;
  Widget _CardItemRight(String title, String description) {
    // return
    // Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   children: [
    // Expanded(
    //     flex: 70,
    //     child: Text(
    //       '  $title',
    //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    //     )),
    // Expanded(
    //     flex: 10,
    //     child: Text(
    //       description,
    //       overflow: TextOverflow.ellipsis,
    //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    //     )),
    //     Expanded(
    //     flex: 20,
    //     child: Text(
    //       description,
    //       overflow: TextOverflow.ellipsis,
    //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    //     )),
    //   ],
    // );
  }

  bool status;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
            width: MediaQuery.of(context).size.width * 0.90,
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.only(top: 15.0)),
                Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          rxde.drug_name == null ? " " : rxde.drug_name,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xff666666),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.1,
                        child: Text(
                          rxde.drug_name == null ? " " : rxde.qty,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xff666666),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.225,
                        child: Text(
                          rxde.drug_unit == null ? " " : rxde.drug_unit,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xff666666),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [],
                  ),
                ),
              ],
            )),
        // Divider(height: 10, thickness: 1.25, color: Colors.grey[400]),
      ],
    );
  }
}
