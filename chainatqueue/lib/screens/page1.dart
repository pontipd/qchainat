import 'dart:convert';
import 'dart:convert' as convert;
import 'package:chainatqueue/models/album.dart';
import 'package:chainatqueue/models/appoint.dart';
import 'package:chainatqueue/models/checkhnso.dart';
import 'package:chainatqueue/models/getAppointment.dart';

import 'package:chainatqueue/models/user_model.dart';
import 'package:chainatqueue/screens/appointmentdetil.dart';
import 'package:chainatqueue/screens/getmedicine.dart';
import 'package:chainatqueue/screens/getmedlist.dart';
import 'package:chainatqueue/screens/page2.dart';
import 'package:chainatqueue/screens/page3.dart';
import 'package:chainatqueue/screens/queue.dart';
import 'package:chainatqueue/screens/regitstersetup.dart';
import 'package:chainatqueue/screens/startouse.dart';
import 'package:chainatqueue/transitions/enter_exit_route.dart';
import 'package:chainatqueue/utility/main_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';

import 'Page5.dart';
import 'medicalrecord.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
int selectedPage = 0;
final _pageOptions = [Page1(), Page5(), Drugdispen(), Page3(), Page2()];

class Page1 extends StatefulWidget {
  String hn, ptname, cid, age, pt, inputHn;
  // Getappointmen getappointment;

  Page1({
    Key key,
    this.hn,
    this.age,
    this.cid,
    this.inputHn,
    this.ptname,
    this.pt,
  }) : super(key: key);
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  Future<List<Album>> futureAlbum;
  String displayname, inputHn;
  Future<List<Appoint>> getappointments;
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
    hn = "${widget.hn}";
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
        fetchAppoints();
        print(
            '-----------------------------Document data: ${documentSnapshot.data()} ');
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

 

  Future<Null> readData() async {
    await Firebase.initializeApp().then((value) {
      print('init');
    });
  }

 
  Future<List<Appoint>> fetchAppoints() async {
    // final response = await http.get(Uri.http('http://chainathospital.org',
    //     '/coreapi/api/v2/get_appointment_list/0408812'));

    var header = {'Content-Type': 'application/json'};
    var url = Uri.parse(
        'http://chainathospital.org/coreapi/api/v2/get_appointment_list/${patient.hns}');

    final http.Response response = await http.Client().get(
      url,
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final result = jsonDecode(response.body);
      if (result['status'] == false) {
        print('#########3');
        setState(() {
          // getappointments = Future.value();
          loading = false;
        });
      } else {
        print('rrrrrr=${result['data']}');
        
        List<Object> data = result['data'];

        setState(() {
          loading = false;
          getappointments = Future.value(data
              .map((job) => new Appoint.fromJson(job))
              .where((ap) =>
                  Timestamp.fromDate(DateTime.parse(ap.appoint_date)).seconds >=
                  Timestamp.fromDate(DateTime.now()).seconds)
              .toList());
          // checkhnso();
        });
      }
    } else {
      loading = false;
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
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
      appBar: AppBar(
          title: Text('นัดหมาย'),),
      drawer: MainDrawer(),
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
                    child: Text('นัดหมาย',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan[400]))),
              ),
              Expanded(
                child: Center(
                    child: RefreshIndicator(
                  onRefresh: _refreshData,
                  child: FutureBuilder<List<Appoint>>(
                    future: getappointments,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return AppointItem(
                                appoint: snapshot.data[index], testfn: test);
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Text("error${snapshot.error}");
                      } else if (!loading && !snapshot.hasData) {
                        return  Container(
                  
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 950.0,
                  decoration: BoxDecoration(
                      image:
                          DecorationImage(image: AssetImage('images/go.png'))),             
             child:  Text(
                'ท่านยังไม่มีนัดหมายในขณะนี้',
                style: GoogleFonts.prompt(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
                

                
              );
                      }

                      // By default, show a loading spinner.
                      return CircularProgressIndicator();
                    },
                  ),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AppointItem extends StatelessWidget {
  AppointItem({Key key, this.appoint, this.testfn}) : super(key: key);
  final Appoint appoint;
  final Function testfn;
  List<ChackHnso> checkHnso = List();
  var hnso;
  bool staus;
  ChackHnso chackHnso;
  Widget _CardItemRight(String title, String description) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
            flex: 32,
            child: Text(
              '$title:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            )),
        Expanded(
            flex: 70,
            child: Text(
              description,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16.0,
              ),
            )),
      ],
    );
  }

  bool status;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width * 0.90,
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(appoint.appoint_date == null
                      ? " "
                      : appoint.appoint_date),
                  Text(appoint.appoint_time_begin == null
                      ? " "
                      : appoint.appoint_time_begin),
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
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 28,
                  child: Container(
                      padding: EdgeInsets.all(8),
                      // color: Colors.amber,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey[400],
                              child: Align(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  '',
                                  // 'images/h.png',
                                  // color: Colors.white,
                                  width: 80.0,
                                ),
                              ),
                              radius: 60,
                            ),
                          ])),
                ),
                Expanded(
                  flex: 89,
                  child: Container(
                      height: 136,
                      padding: EdgeInsets.all(5),
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _CardItemRight(
                              'สถานที่',
                              appoint.department == null
                                  ? " "
                                  : appoint.department),
                          _CardItemRight(
                              'แพทย์',
                              appoint.doctor_name == null
                                  ? " "
                                  : appoint.doctor_name),
                          _CardItemRight(
                              'สาเหตุที่นัด',
                              appoint.appoint_reason == null
                                  ? " "
                                  : appoint.appoint_reason),
                        ],
                      )),
                )
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              const SizedBox(width: 2),
              TextButton(
                child: const Text(
                  'ดูรายละเอียด',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xff219653),
                  ),
                ),
                onPressed: () async {
                  hnso = appoint.appoint_right_code;

                  await checkhnso(hnso);
// ไปหน้า รายละเอียดได้เลย
                  if (status == true) {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: Appointdetail(
                          appoint: appoint,
                          ptname: ptname,
                          // appoint: appoint,
                          cid: cid,
                          hn: hn,
                          age: age,
                          // appointMent:
                          //     getappointments[
                          //         0],
                          // inputHn: inputHN,
                          // getAppointment:
                          //     getappointments[
                          //         0],
                          // index: index,
                        ),
                      ),
                    );
                    // MaterialPageRoute route = MaterialPageRoute(
                    //     builder: (value) => Appointdetail(
                    //           appoint: appoint,
                    //           ptname: ptname,
                    //           // appoint: appoint,
                    //           cid: cid,
                    //           hn: hn,
                    //           age: age,
                    //           // appointMent:
                    //           //     getappointments[
                    //           //         0],
                    //           // inputHn: inputHN,
                    //           // getAppointment:
                    //           //     getappointments[
                    //           //         0],
                    //           // index: index,
                    //         ));
                    // Navigator.push(context, route);
                    // ไปหน้า ติดต่อเวชระเบียน
                  } else if (status == false) {
                    MaterialPageRoute route = MaterialPageRoute(
                        builder: (value) => Medicalrecord(
                              appoint: appoint,
                              ptname: ptname,
                              // appoint: appoint,
                              cid: cid,
                              hn: hn,
                              age: age,
                              // ptname: ptname,
                              // cid: cid,
                              // hn: hn,
                              // age: age,
                              // appointMent:
                              //     getappointments[
                              //         0],
                              // inputHn: inputHN,
                              // getAppointment:
                              //     getappointments[
                              //         0],
                              // index: index,
                            ));
                    Navigator.push(context, route);
                  }
                  // MaterialPageRoute route = MaterialPageRoute(
                  //     builder: (value) => Haveappoin(
                  //       inputHn: inputHn,

                  //     ));
                  // Navigator.push(context, route);
                },
                // onTap: () {
                //   //  print(index.toString());
                //   print(getappointments[0]
                //       .data[index]
                //       .appointDate);

                //   MaterialPageRoute route =
                //       MaterialPageRoute(
                //           builder: (value) =>
                //               Appointdetail(

                //                 ptname: ptname,
                //                 cid: cid,
                //                 hn: hn,
                //                 age: age,
                //                 appointMent:
                //                     getappointments[
                //                         0],
                //                 inputHn: inputHN,
                //                 getAppointment:
                //                     getappointments[
                //                         0],
                //                 index: index,
                //               ));
                //   Navigator.push(context, route);
                // },
                // MaterialPageRoute route =
                //     MaterialPageRoute(builder: (value) => Appointdetail(

                //     ));
                // Navigator.push(context, route);
                // testfn(55);
              ),
              const SizedBox(width: 1),
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

     //  print(index.toString());

      // } else {}

    } catch (e) {}
  }
}
