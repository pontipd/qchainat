import 'dart:convert';
import 'package:chainatqueue/models/getgueue.dart';
import 'package:chainatqueue/models/patineModel.dart';
import 'package:chainatqueue/models/rxde.dart';
import 'package:chainatqueue/models/user_model.dart';
import 'package:chainatqueue/screens/Page5.dart';
import 'package:chainatqueue/screens/page1.dart';
import 'package:chainatqueue/screens/page2.dart';
import 'package:chainatqueue/screens/page3.dart';
import 'package:chainatqueue/screens/queue.dart';
import 'package:chainatqueue/screens/startouse.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
// import 'package:kioskregis/model/department.dart';
// import 'package:kioskregis/model/getserviceList.dart';
// import 'package:kioskregis/mystyle.dart';

int selectedPage = 0;
final _pageOptions = [Page1(), Queue(), Page5(), Page3(), Page2()];

class Comrx extends StatefulWidget {
  String ptname, cid, age, pt, inputHn, rxid;

  Comrx(
      {Key key,
      this.age,
      this.cid,
      this.inputHn,
      this.ptname,
      this.pt,
      this.rxid})
      : super(key: key);
  @override
  _ComrxState createState() => _ComrxState();
}

class _ComrxState extends State<Comrx> {
  String displayname, inputHn;
   Future<List<Rxde>> rxde;
 
  var hnso;

  String staus;
  bool status;
  String rxtype;
  String rxid;
  User user;
  UserModel patient;
  var floatingActionButton;
  bool loading = false;
  var now = DateTime.now();
  var date;
  @override
  void initState() {
    super.initState();
    finddisplay();
    loading = true;
    rxid = "${widget.rxid}";
    print('object------------------------$rxid');
    inputHn = "${widget.inputHn}";
   
    getuser();
    
    readData();

    
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
        //
        print(documentSnapshot.data());
        patient = UserModel(hns: documentSnapshot.data()['hns']);

        // fetch();
        print(
            '-----------------------------Document data: ${documentSnapshot.data()} ');
        hns = patient.hns;

        Map<String, dynamic> _map = {
          "rx_number":"${widget.rxid}" ,
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

  @override
  Widget build(BuildContext context) {
   

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
                              '',
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
                      // onPressed: () {
                      //   MaterialPageRoute route = MaterialPageRoute(
                      //     builder: (value) => BookgueueresHN(
                      //         name: departmentName,
                      //         ptname: ptname,
                      //         cid: cid,
                      //         hn: hn,
                      //         inputHn: inputHn,
                      //         age: age,
                      //         getserviceList: getserviceList),
                      //   );
                      //   Navigator.push(context, route);

                      // },
                      //
                      onPressed: () async {
                       
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
      print(getQ.modelQueue.qIds);
      setState(() {
        // q = getQ.modelQueue.qNum;
        // qids = getQ.modelQueue.qIds.toString();
      });

      // print('qqqqq $q');

      // print('test ==> $getData ');
      // Map<String, dynamic> getqueue = jsonDecode(getData);
      // var getQ = Getqueue.fromJson(jsonDecode(getData));

      // print(getQ.modelQueue);
    } catch (e) {
      print(e);
    }
  }
}
