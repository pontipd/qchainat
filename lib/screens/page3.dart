import 'dart:convert';
import 'dart:convert' as convert;
import 'package:chainatqueue/models/album.dart';
import 'package:chainatqueue/models/appoint.dart';
import 'package:chainatqueue/models/checkhnso.dart';
import 'package:chainatqueue/models/getAppointment.dart';
import 'package:chainatqueue/models/gethresult.dart';
import 'package:chainatqueue/models/getrx.dart';
import 'package:chainatqueue/models/hresulty.dart';

import 'package:chainatqueue/models/user_model.dart';
import 'package:chainatqueue/screens/appointmentdetil.dart';
import 'package:chainatqueue/screens/getmedicine.dart';
import 'package:chainatqueue/screens/getmedlist.dart';
import 'package:chainatqueue/screens/page2.dart';
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
import 'package:async/async.dart';
import 'Page5.dart';
import 'hresultdetil.dart';
import 'medicalrecord.dart';
import 'page1.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
int selectedPage = 0;
final _pageOptions = [Page1(), Page5(), Drugdispen(), Page3(), Page2()];

class Page3 extends StatefulWidget {
  String ptname, cid, age, pt, inputHn;
  // Getappointmen getappointment;

  Page3({
    Key key,
    this.age,
    this.cid,
    this.inputHn,
    this.ptname,
    this.pt,
  }) : super(key: key);
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  Future<List<Album>> futureAlbum;
  String displayname, inputHn;
  Future<List<Appoint>> getappointments;
  Future<List<Hresulty>> hresulty;

  List<ChackHnso> checkHnso = List();
  var hnso;
  ChackHnso chackHnso;
  String staus;
  bool status;
  User user;
  UserModel patient;

  bool loading = false;
  var now = DateTime.now();
  var date;
  @override
  void initState() {
    super.initState();
    finddisplay();
    loading = true;

    inputHn = "${widget.inputHn}";
    print(_auth.currentUser);
    user = _auth.currentUser;
    getuser();
    // getAppointment();
    readData();

    var month = now.month.toString().padLeft(2, '0');
    var day = now.day.toString().padLeft(2, '0');
    date = "${now.year}" + "-" + "$month" + "-" + "$day";
    print(date);
    // futureAlbum = fetchAlbum();
  }

  // Future<User> getuser() async {
  //   await FirebaseFirestore.instance
  //       .collection('user')
  //       .doc(user.uid)
  //       .get()
  //       .then((DocumentSnapshot documentSnapshot) {
  //     if (documentSnapshot.exists) {
  //       //
  //       print(documentSnapshot.data());
  //       patient = UserModel(hns: documentSnapshot.data()['hns']);
  //       fetchAppoints();
  //       print(
  //           '-----------------------------Document data: ${documentSnapshot.data()} ');
  //     } else {
  //       print('Document does not exist on the database');
  //     }
  //   });
  // }

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
        var data = jsonEncode({'hn': hns});
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
        // getAppointment();
      });
    });
    // checkAppointment;
  }

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

  // Future<Null> get checkAppointment async {
  //   try {
  //     var header = {'Content-Type': 'application/json'};
  //     var url = Uri.parse(
  //         'http://chainathospital.org/coreapi/api/v2/get_appointment_list/$inputHn');

  //     var response = await http.get(url, headers: header);
  //     print("res =${response.body}");
  //     var result = json.decode(response.body);
  //     print('result = $result');
  //     print(result['status']);
  //     // Getappointmen getappointmen =
  //     //     Getappointmen.fromJson(result);
  //     // print('getappointmen = $getappointmen');

  //     if (result['status']) {
  //     } else {}
  //     // if (getappointmen.status == false) {
  //     //   MaterialPageRoute route =
  //     //       MaterialPageRoute(builder: (value) => Appointment());
  //     //   Navigator.push(context, route);
  //     // } else {
  //     //   MaterialPageRoute route = MaterialPageRoute(
  //     //       builder: (value) => Haveappoin(
  //     //             hn: hns,
  //     //             inputHn: displayname,
  //     //             getappointment: getappointments[0],
  //     //           ));
  //     //   Navigator.push(context, route);
  //     // }
  //   } catch (e) {}
  // }

  Future<List<Hresulty>> fetchs(data) async {
    try {
      var header = {'Content-Type': 'application/json'};
      var url = Uri.parse(
          'http://chainathospital.org/coreapi/api/v2/get_med_exam_list');

      final response = await http.post(url, headers: header, body: data);

      if (response.statusCode == 200) {
        print(response.statusCode);
        print('jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj');
        print(json.decode(response.body));
        print('*********$response');

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

            hresulty = Future.value(
                data.map((job) => new Hresulty.fromJson(job)).toList());
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

  // Future<List<Getappoint>> getAppointment() async {
  //   print('ffffffff =$hn');
  //   var header = {'Content-Type': 'application/json'};
  //   var url = Uri.parse(
  //       'http://chainathospital.org/coreapi/api/v2/get_appointment_list/${patient.hns}');

  //   try {
  //     final http.Response response = await http.Client().get(
  //       url,
  //     );
  //     final result = jsonDecode(response.body);
  //     List data = result.data;
  //     return data.map((job) => new Getappoint().fromJson(job)).toList();
  //     // print('res = ${response.body}');
  //     // GetAppointMent getAppointMent =
  //     //     GetAppointMent.fromJson(convert.jsonDecode(response.body));
  //     // setState(() {
  //     //   for (var i = 0; i < getAppointMent.data.length; i++) {
  //     //     getappointments.add(getAppointMent);
  //     //   }
  //     //   // checkhnso();
  //     // });
  //     // if (getAppointMent.status == false) {
  //     //   date = '';
  //     //   department = '';
  //     //   doctorname = '';
  //     //   reson = '';
  //     // } else {
  //     //   for (var i = 0; i < getappointments.length; i++) {

  //     //     date = getAppointMent.data[i].appointDate;
  //     //     department = getAppointMent.data[i].department;
  //     //     doctorname = getAppointMent.data[i].doctorName;
  //     //     reson = getAppointMent.data[i].appointReason;
  //     //   }
  //     // }

  //   } catch (e) {}
  //   //  checkhnso();
  // }

  Future _refreshData() async {
    await Future.delayed(Duration(seconds: 5));
    setState(() {});
  }

  Future test(int value) {
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

      appBar: AppBar(
        title: Text('ผลตรวจสุขภาพ'),
      ),
      drawer: MainDrawer(),

      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.90,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Expanded(
                child: Center(
                    child: RefreshIndicator(
                  onRefresh: _refreshData,
                  child: FutureBuilder<List<Hresulty>>(
                    future: hresulty,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return AppointItem(
                                hresulty: snapshot.data[index], testfn: test);
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Text("error${snapshot.error}");
                      } else if (!loading && !snapshot.hasData) {
                        return Container(
                          child: Column(
                            children: [
                              Padding(padding: EdgeInsets.only(top: 10.0)),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: Center(
                                    child: Text('ผลตรวจสุขภาพ',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.cyan[400]))),
                              ),
                              Padding(padding: EdgeInsets.only(top: 10.0)),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: Text(
                                  'ท่านยังไม่มีผลตรวจสุขภาพประจำปี',
                                  style: GoogleFonts.prompt(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey[600],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 10.0)),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                height: 480.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('images/ruru.png'))),
                              ),
                            ],
                          ),
                        );
                      }

                      // By default, show a loading spinner.
                      return CircularProgressIndicator();
                    },
                  ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppointItem extends StatelessWidget {
  AppointItem({Key key, this.appoint, this.testfn, this.hresulty})
      : super(key: key);
  final Appoint appoint;
  final Hresulty hresulty;
  final Function testfn;
  List<ChackHnso> checkHnso = List();
  var hnso;
  bool staus;
  ChackHnso chackHnso;
  Widget _CardItemRight(String title, String description) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            flex: 15,
            child: Text(
              '  $title',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
            )),
        Expanded(
            flex: 60,
            child: Text(
              description,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xff2D9CDB),
              ),
            )),
      ],
    );
  }

  bool status;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width * 0.90,
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Text(
                          "ปีที่ : ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          hresulty.med_exam_year == null
                              ? "-"
                              : hresulty.med_exam_year,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xff666666),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          Divider(height: 10, thickness: 1.25, color: Colors.grey[400]),
          // ListTile(
          //   leading: Icon(Icons.album),
          //   title: Text(appoint.appoint_id),
          //   subtitle: Text(appoint.pt_name),
          // ),

          Container(
            width: MediaQuery.of(context).size.width * 0.90,
            // width: double.maxFinite,
            // color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 70,
                  child: Container(
                      height: 55,
                      padding: EdgeInsets.all(8),
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _CardItemRight(
                              'วันที่ :',
                              hresulty.med_exam_date == null
                                  ? " "
                                  : hresulty.med_exam_date),
                        ],
                      )),
                )
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              const SizedBox(width: 8),
              TextButton(
                child: const Text(
                  'รายละเอียด',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xff219653),
                  ),
                ),
                onPressed: () {
                  MaterialPageRoute route = MaterialPageRoute(
                      builder: (value) => Hresultdetail(
                            hresulty: hresulty,
                          ));
                  Navigator.push(context, route);
                },
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }

  Future<Null> checkhnso(nhso) async {
    print('------------');
    var header = {'Content-Type': 'application/json'};
    var url = Uri.parse(
        'http://chainathospital.org/coreapi/api/v2/check_state_nhso/');

    try {
      var response = await http.get(url, headers: header);
      ChackHnso chackHnso =
          ChackHnso.fromJson(convert.jsonDecode(response.body));

      for (var i = 0; i < chackHnso.nonCheckNhso.length; i++) {
        checkHnso.add(chackHnso);
      }

      if (chackHnso.nonCheckNhso.contains(hnso) == true) {
        status = true;
        print('[[[[[$hnso]]]]]');
      } else {
        print('[[[[[$hnso]]]]]');
        status = false;
      }

      //   //  print(index.toString());

      // } else {}

    } catch (e) {}
  }
}
