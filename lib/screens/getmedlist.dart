import 'dart:convert';
import 'dart:convert' as convert;
import 'package:chainatqueue/models/album.dart';
import 'package:chainatqueue/models/appoint.dart';
import 'package:chainatqueue/models/checkhnso.dart';
import 'package:chainatqueue/models/depenlist.dart';
import 'package:chainatqueue/models/getAppointment.dart';

import 'package:chainatqueue/models/user_model.dart';
import 'package:chainatqueue/screens/appointmentdetil.dart';
import 'package:chainatqueue/screens/germedicinedetil.dart';
import 'package:chainatqueue/screens/getmedicine.dart';
import 'package:chainatqueue/screens/page1.dart';
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

class Drugdispen extends StatefulWidget {
  String hn, ptname, cid, age, pt, inputHn;
  // Getappointmen getappointment;

  Drugdispen({
    Key key,
    this.hn,
    this.age,
    this.cid,
    this.inputHn,
    this.ptname,
    this.pt,
  }) : super(key: key);
  @override
  _DrugdispenState createState() => _DrugdispenState();
}

class _DrugdispenState extends State<Drugdispen> {
  Future<List<Album>> futureAlbum;
  String displayname, inputHn;
  Future<List<Depenlist>> getappointments;
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

  Future<List<Depenlist>> fetchAppoints() async {
    // final response = await http.get(Uri.http('http://chainathospital.org',
    //     '/coreapi/api/v2/get_appointment_list/0408812'));

    var header = {'Content-Type': 'application/json'};
    var url = Uri.parse(
       // 'http://q.chainathospital.org/app/drug-dispensing/drug-dispensing-list?hn=0408812&date=2021-05-18');
    'http://q.chainathospital.org/app/drug-dispensing/drug-dispensing-list?hn=${patient.hns}&date=$date');

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
          getappointments = Future.value(
              data.map((job) => new Depenlist.fromJson(job)).toList());
          // checkhnso();
        });
      }
    } else {
      loading = false;
      throw Exception('Failed to load album');
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

      appBar: AppBar(
          title: Text('รับยาใกล้บ้าน'),),
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
              Padding(padding: EdgeInsets.only(top: 20.0)),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Center(
                    child: Text('รับยาใกล้บ้าน',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan[400]))),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: Center(
                    child: RefreshIndicator(
                  onRefresh: _refreshData,
                  child: FutureBuilder<List<Depenlist>>(
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
                        return InkWell(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 950.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('images/ruru.png'))),
                            child: Text(
                              'ท่านยังไม่มีรายการรับยาใกล้บ้าน',
                              style: GoogleFonts.prompt(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[600],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }

                      //           return Column(
                      //             children: [

                      //                Container(
                      //                 child: InkWell(
                      //   child: Container( width: MediaQuery.of(context).size.width * 0.9,
                      //     height: 50.0,child:  Text(
                      //   'ท่านยังไม่มีนัดหมายในขณะนี้',
                      //   style: GoogleFonts.prompt(
                      //     fontSize: 22.0,
                      //     fontWeight: FontWeight.w400,
                      //     color: Colors.grey[600],
                      //   ),
                      //   textAlign: TextAlign.center,
                      // ), ),),
                      //               ),
                      //               Container(
                      //                 child: InkWell(onTap: () {},
                      //   child: Container( width: MediaQuery.of(context).size.width * 0.9,
                      //     height: 550.0,
                      //     decoration: BoxDecoration(
                      //         image:DecorationImage(image: AssetImage('images/ruru.png'))), ),),
                      //               ), ],
                      //           );
                      //         }

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
  final Depenlist appoint;
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
            flex: 30,
            child: Text(
              '$title:',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16.0,
                fontFamily: "Kanit",
                 color: Color(0xff4F4F4F),
                
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
                fontFamily: "Kanit",
                color: Color(0xff2D9CDB),
              ),
            )),
      ],
    );
  }

  bool status;
  @override
  Widget build(BuildContext context) {
    String rxnumber = appoint.rx_operator_id;
    print('rxnumber====> $rxnumber');
    return Card(
      elevation: 5,
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
                          "สถานที่รับยา : ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          appoint.pharmacy_drug_name == null
                              ? "-"
                              : appoint.pharmacy_drug_name,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 100,
                  child: Container(
                      padding: EdgeInsets.all(8),
                     // color: Colors.amber,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _CardItemRight(
                                'เลขที่ใบสั่งยา ',
                                appoint?.rx_operator_id == null
                                    ? "-"
                                    : appoint?.rx_operator_id),
                            _CardItemRight(
                                'วันที่ ',
                                appoint.prescription_date == null
                                    ? "-"
                                    : appoint.prescription_date),
                            _CardItemRight(
                                'แพทย์สั่งยา ',
                               
                                appoint.doctor_name == 'null'
                                  ? "-"
                                  :appoint.doctor_name ,
                               
                                    ),
                            _CardItemRight(
                                'แผนก/คลินิก ',
                                appoint.deptname == null
                                    ? "-"
                                    : appoint.deptname),
                          ])),
                ),
              ],
            ),
          ),

          Row(
          
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              const SizedBox(width: 1),
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
                      builder: (value) => Havemedicinedetail(

                        rxnumber:rxnumber,
                        appoint:appoint,
                      ));
                  Navigator.push(context, route);
                },
              ),
              const SizedBox(width: 1),
            ],
          ),
        ],
      ),
    );
  }
}
