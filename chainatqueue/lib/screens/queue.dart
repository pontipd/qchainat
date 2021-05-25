import 'package:chainatqueue/models/patineModel.dart';
import 'package:chainatqueue/screens/Page5.dart';
import 'package:chainatqueue/screens/Selectdepartment.dart';
import 'package:chainatqueue/screens/department.dart';
import 'package:chainatqueue/screens/haveappointment.dart';
import 'package:chainatqueue/screens/login.dart';
import 'package:chainatqueue/screens/page1.dart';
import 'package:chainatqueue/screens/page2.dart';
import 'package:chainatqueue/screens/page3.dart';
import 'package:chainatqueue/screens/startouse.dart';
import 'package:chainatqueue/utility/buttom_bar.dart';
import 'package:chainatqueue/utility/main_drawer.dart';
import 'package:chainatqueue/widget/app_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:async';

import 'HnSo.dart';
import 'getmedicine.dart';
import 'hresult.dart';
int selectedPage = 0;
   final _pageOptions = [Page1(), Queue(), Page5(), Page3(), Page2()];
class Queue extends StatefulWidget {
  final String hn, ptname, dob, cid, age,inputHn, inputController,name;
  Queue({
    Key key,
    this.age,
    this.cid,
    this.dob,
    this.hn,
    this.inputHn,
    this.name,
    this.ptname,
    this.inputController,
  }) : super(key: key);

  @override
  _QueueState createState() => _QueueState();
}

class _QueueState extends State<Queue> {
  var floatingActionButton;
  double screen;
  String displayname, hns , inputHn,name;
  String user, password;
  // var ptname = '';
  // var cid = '';
  // var hn = '';
  // var age = '';
  // var dob = '';
  // var inputHn = '';

  bool isHasData = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    finddisplay();
    // onGetData();
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

  // Future<void> onGetData() async {
  //   var header = {'Content-Type': 'application/json'};
  //   var url = Uri.parse(
  //       'http://chainathospital.org/coreapi/api/v2/get_patient_info/$displayname?=&fbclid=IwAR0DRRJ6Cr1OY4Y9SZoz75UGyFyPF2tYakZj6TH67Fa6lSuPvMKb-iqHxUo');

  //   var response = await http.get(url, headers: header);

  //   try {
  //     PatientModel patientModel =
  //         PatientModel.fromJson(convert.jsonDecode(response.body));
  //     if (patientModel.status == false) {
  //       isHasData = false;
  //       setState(() {
  //         ptname = '';
  //         hn = '';
  //         age = '';
  //         dob = '';
  //         cid = '';
  //       });
  //     } else {
  //       isHasData = true;
  //       setState(() {
  //         ptname = patientModel.data[0].ptName;
  //         hn = patientModel.data[0].hn;
  //         age = patientModel.data[0].age;
  //         dob = patientModel.data[0].dob;
  //         cid = patientModel.data[0].cid;
  //       });
      
  //     }
      
  //   } catch (e) {}
  // }

int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Page1(),
    Queue(),
    // Havemedicine(),
    Hresult(),
    // HNSO(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
        hn = "${widget.hn}";
        inputHn = "${widget.inputHn}";
        cid = "${widget.cid}";
      name="${widget.name}";
        ptname = "${widget.ptname}";

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Appointment'),
      // ),
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(60.0),
      //   // here the desired height
      //   child: AppBar(
      //     backgroundColor: Color(
      //       0xff089EAD,
      //     ),
      //     title: Text(
      //       "โรงพยาบาลชัยนาทนเรนทร",
      //       style: GoogleFonts.kanit(fontSize: 22.0, color: Colors.white),
      //       textAlign: TextAlign.center,
      //     ),
      //     actions: <Widget>[
      //       Container(
      //         width: 60.0,
      //         child: Align(
      //           alignment: Alignment.center,
      //           child: Image.asset(
      //             'images/person.png',
      //             color: Colors.white,
      //             width: 70.0,
      //           ),
      //         ),
      //       )
      //     ],
      //   ),
      // ),

      // drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Color(
            0xffeff7f9,
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 16.0,
                child: Text(
                  "คิวตรวจ",
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.kanit(
                    color: Color(
                      0xff089EAD,
                    ),
                    fontSize: 24.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                // width: 342,
                // height: 20,
              ),
              Padding(padding: EdgeInsets.only(top: 90.0)),
              Text(
                'อัพเดทคิว  12 ก.พ. 2564 เวลา 12.00 น.',
                style: GoogleFonts.prompt(
                  fontSize: 16.0,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40.0,
              ),
              InkWell(
                onTap: () {
                  // MaterialPageRoute route =
                  //     MaterialPageRoute(builder: (value) => HaveAppointment());
                  // Navigator.push(context, route);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 200.0,
                  decoration: BoxDecoration(
                      image:
                          DecorationImage(image: AssetImage('images/go.png'))),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              Text(
                'ท่านยังไม่มีคิวห้องตรวจ/ห้องจ่ายยา',
                style: GoogleFonts.prompt(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[600],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              SizedBox(
                height: 40.0,
              ),
              floatingActionButton = Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 50.0,
                child: FloatingActionButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.5)),
                  clipBehavior: Clip.antiAlias,
                  onPressed: () {
                    MaterialPageRoute route = MaterialPageRoute(
                        builder: (value) => Department(
                              inputHn: inputHn,
                              ptname: ptname,
                              name:name,
                              cid: cid,
                              age: age,
                            ));
                    Navigator.push(context, route);
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
                        'จองคิว',
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

      //   bottomNavigationBar: AppBottomBar(
      //   onItemTapped: _onItemTapped,
      //   selectedIndex: _selectedIndex,
      // ),
      // bottomNavigationBar: BottomBar(),
    );
  }
}
