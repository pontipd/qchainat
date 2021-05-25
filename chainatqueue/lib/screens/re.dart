import 'dart:developer';
import 'dart:async';
import 'package:chainatqueue/models/checkhnso.dart';
import 'package:chainatqueue/models/getAppointment.dart';
import 'package:chainatqueue/models/getappoint.dart';
import 'package:chainatqueue/models/gethresult.dart';
import 'package:chainatqueue/models/user_model.dart';
import 'package:chainatqueue/screens/HnSo.dart';
import 'package:chainatqueue/screens/appointmentdetil.dart';
import 'package:chainatqueue/screens/hresult.dart';
import 'package:chainatqueue/screens/picup.dart';
import 'package:chainatqueue/screens/queue.dart';
import 'package:chainatqueue/screens/startouse.dart';
import 'package:chainatqueue/utility/buttom_bar.dart';
import 'package:chainatqueue/utility/main_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Hresult extends StatefulWidget {
  final String hn, ptname, cid, age, pt, inputHn;
  Getappointmen getappointment;
  final GetHresult getHresult;
   bool isHasData = false;
String currentUserID = FirebaseAuth.instance.currentUser.uid;
  Hresult(
      {Key key,
      this.hn,
      this.age,
      this.cid,
      this.inputHn,
      this.ptname,
      this.getHresult,
      this.pt,
      this.getappointment})
      : super(key: key);

  @override
  _HresultState createState() => _HresultState();
}

class _HresultState extends State<Hresult> {
  set floatingActionButton(Container floatingActionButton) {}
  // List<Widget> showWidget = [
  //   Haveappoin(),
  //   Queue(),
  //   Getmedicine(),
  //   Hresult(),
  //   HNSO()
  // ];
  // int index = 0;
 bool isHasData = false;
 List<GetHresult> gethresults = List();

  @override
  void initState() {
    super.initState();
    hn = "${widget.hn}";
    inputHn = "${widget.inputHn}";
    getAppointment();
    readData();
    gethresult();
  }

  var hnso, hnso1, nameD, hn1;
  ChackHnso chackHnso;
  String currentUserID = FirebaseAuth.instance.currentUser.uid;
  List<GetAppointMent> getappointments = List();
  List<ChackHnso> checkHnso = List();



  Future<Null> getAppointment() async {
    var header = {'Content-Type': 'application/json'};
    var url = Uri.parse(
        'http://chainathospital.org/coreapi/api/v2/get_appointment_list/$inputHn');

    try {
      final http.Response response = await http.Client().get(
        url,
      );
      print('res = $response');
      GetAppointMent getAppointMent =
          GetAppointMent.fromJson(convert.jsonDecode(response.body));
      setState(() {
        for (var i = 0; i < getAppointMent.data.length; i++) {
          getappointments.add(getAppointMent);
        }
        checkhnso();
      });
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

    } catch (e) {}
  }


  Future<Null> gethresult() async {
    var header = {'Content-Type': 'application/json'};
   var url = Uri.parse(
        'http://chainathospital.org/coreapi/api/v2/get_med_exam_list/$inputHn');

    try {
      final http.Response response = await http.Client().post(
        url,
      );
      print('res = $response');
      GetHresult getHresult =
         GetHresult.fromJson(convert.jsonDecode(response.body));
      setState(() {
        for (var i = 0; i < getHresult.data.length; i++) {
          gethresults.add(getHresult);
        }
        checkhnso();
      });
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

    } catch (e) {}
  }



  Future<Null> checkhnso() async {
    var header = {'Content-Type': 'application/json'};
    var url = Uri.parse(
        'http://chainathospital.org/coreapi/api/v2/get_patient_info/$inputHn?=&fbclid=IwAR0DRRJ6Cr1OY4Y9SZoz75UGyFyPF2tYakZj6TH67Fa6lSuPvMKb-iqHxUo');

    var response = await http.get(url, headers: header);

    try {
      final http.Response response = await http.Client().get(
        url,
      );
      ChackHnso chackHnso =
          ChackHnso.fromJson(convert.jsonDecode(response.body));
      setState(() {
        for (var i = 0; i < chackHnso.nonCheckNhso.length; i++) {
          checkHnso.add(chackHnso);
        }
        // for (var i = 0; i < chackHnso.checkNhso.length; i++) {
        //   checkHnso.add(chackHnso);
        // }
        // for (var i = 0; i < checkHnso.length; i++) {
        //   hnso =
        //       checkHnso.contains(getappointments[i].data[i].appointRightCode);
        // }
        // if (hnso == true) {
        //   hnso1 = 1;
        // }
      });
    } catch (e) {}
  }

  String hn,
      ptname,
      cid,
      age,
      date,
      department,
      doctorname,
      reson,
      staus,
      inputHN,
      preparing;

  Future<Null> readData() async {
    await Firebase.initializeApp().then((value) {
      print('init');
    });
  }

// createProfileTopView()
//   {
//     bool userCurrent = currentUserID != widget.userProfileID;
//     return FutureBuilder(
//       future: usersFirestore.doc(widget.userProfileID).get(),
//       builder: (context, dataSnapshot){
//         if(!dataSnapshot.hasData)
//         {
//           return circularProgress();
//         }

//         UserModel userModels = UserModel.fromDocument(dataSnapshot.data);
//         return Container(
//           padding: EdgeInsets.all(15.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[]));


//             widget[//profile
//               Container(
//                 height: 180.0,
//                 width: MediaQuery.of(context).size.width * 0.8,
//                 child: Center(
//                   child: AspectRatio(
//                     aspectRatio: 1/1,
//                     child: Container(
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: Colors.white,
//                             width: 3.0,
//                           ),
//                           shape: BoxShape.circle,
//                           image: DecorationImage(image: CachedNetworkImageProvider(userModels.profileUrl ),fit: BoxFit.cover),
//                         )
//                     ),
//                   ),
//                 ),
//               ),]


  @override
  Widget build(BuildContext context) {
    hn = "${widget.hn}";
    inputHn = "${widget.inputHn}";
    var now = DateTime.now();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        // here the desired height
        child: AppBar(
          backgroundColor: Color(
            0xff089EAD,
          ),
          title: Text(
            inputHn,
            style: GoogleFonts.kanit(fontSize: 24.0, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            Container(
              width: 150.0,
              child: Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  'images/person.png',
                  color: Colors.white,
                  width: 50.0,
                ),
              ),
            )
          ],
        ),
      ),
      drawer: MainDrawer(),
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
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    child: Text(
                      "นัดหมาย",
                      style: GoogleFonts.kanit(
                        fontSize: 24.0,
                        color: Color(
                          0xff089EAD,
                        ),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    width: 450,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    child: Text(
                      "ข้อมูล ณ วันที่ ${now.day} ${now.month}  ${now.year}เวลา ${now.hour}.${now.month} น.",
                      style: GoogleFonts.kanit(
                        fontSize: 16.0,
                        color: Color(
                          0xff828282,
                        ),
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    width: 450,
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  // Divider(
                  //   height: 15,
                  //   thickness: 1.0,
                  //   color: Color(
                  //     0xfff828282,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 20.0,
                  // ),

                  Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: ListView.builder(
                      itemCount: getappointments.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) =>
                          Container(
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
                                        padding: EdgeInsets.only(top: 45.0)),
                                    SizedBox(
                                      child: Text(
                                        getappointments[index]
                                                    .data[index]
                                                    .appointDate ==
                                                null
                                            ? ""
                                            : getappointments[index]
                                                .data[index]
                                                .appointDate,
                                        // "$departmentName",
                                        style: TextStyle(
                                          color: Color(
                                            0xff116EA8,
                                          ),
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Kanit",
                                        ),

                                        textAlign: TextAlign.center,
                                      ),
                                      width: 300,
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

                                // Icon(Icons.date_range_outlined),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
                                  child: Divider(
                                      height: 10,
                                      thickness: 1.25,
                                      color: Colors.grey[400]),
                                ),
                                Padding(padding: EdgeInsets.only(top: 7.0)),
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Image.asset(
                                              'images/person.png',
                                              // color: Colors.white,
                                              width: 77.0,
                                            ),
                                          ),
                                          width: 60.0,
                                        ),
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
                                    Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Row(
                                            children: [
                                              Text(
                                                " สถานที่ : ",
                                                style: TextStyle(
                                                  color: Color(
                                                    0xff666666,
                                                  ),
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "Kanit",
                                                ),
                                              ),
                                              Text(
                                                gethresults[index]
                                                            .data[index]
                                                            .medExamDate ==
                                                        null
                                                    ? " "
                                                    :  gethresults[index]
                                                            .data[index]
                                                            .medExamDate ,
                                                style: TextStyle(
                                                  color: Color(
                                                    0xff666666,
                                                  ),
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "Kanit",
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Row(
                                            children: [
                                              Text(
                                                " ชื่อแพทย์ : ",
                                                style: TextStyle(
                                                  color: Color(
                                                    0xff666666,
                                                  ),
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "Kanit",
                                                ),
                                              ),
                                              Text(
                                                getappointments[index]
                                                            .data[index]
                                                            .doctorName ==
                                                        null
                                                    ? ''
                                                    : getappointments[index]
                                                        .data[index]
                                                        .doctorName,
                                                style: TextStyle(
                                                  color: Color(
                                                    0xff666666,
                                                  ),
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "Kanit",
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Row(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    " สาเหตุที่นัด : ",
                                                    style: TextStyle(
                                                      color: Color(
                                                        0xff666666,
                                                      ),
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: "Kanit",
                                                    ),
                                                  ),
                                                  Text(
                                                    getappointments[index]
                                                                .data[index]
                                                                .appointReason ==
                                                            null
                                                        ? ''
                                                        : getappointments[index]
                                                            .data[index]
                                                            .appointReason,
                                                    style: TextStyle(
                                                      color: Color(
                                                        0xff666666,
                                                      ),
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: "Kanit",
                                                    ),
                                                  ),
                                                  //test get appoint right code
                                                  // Text(
                                                  //   getappointments[index]
                                                  //       .data[index]
                                                  //       .appointRightCode,
                                                  //   style: TextStyle(
                                                  //     color: Color(
                                                  //       0xff666666,
                                                  //     ),
                                                  //     fontSize: 24,
                                                  //     fontWeight: FontWeight.w400,
                                                  //     fontFamily: "Prompt",
                                                  //   ),
                                                  // ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(top: 20.0)),
                                        InkWell(
                                          onTap: () {
                                            //  print(index.toString());
                                            print(getappointments[0]
                                                .data[index]
                                                .appointDate);
                                            MaterialPageRoute route =
                                                MaterialPageRoute(
                                                    builder: (value) =>
                                                        Appointdetail(
                                                          ptname: ptname,
                                                          cid: cid,
                                                          hn: hn,
                                                          age: age,
                                                          appointMent:
                                                              getappointments[
                                                                  0],
                                                          inputHn: inputHN,
                                                          getAppointment:
                                                              getappointments[
                                                                  0],
                                                          index: index,
                                                        ));
                                            Navigator.push(context, route);
                                          },
                                          child: SizedBox(
                                            child: Text(
                                              'ดูรายละเอียด',
                                              // "$departmentName",
                                              style: TextStyle(
                                                color: Color(
                                                  0xff219653,
                                                ),
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: "Kanit",
                                              ),

                                              textAlign: TextAlign.right,
                                            ),
                                            width: 240,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                // Padding(padding: EdgeInsets.only(top: 7.0)),
                                SizedBox(
                                  height: 20.0,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    height: 180.0,
                  ),

                  floatingActionButton = Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    height: 53.0,
                    child: FloatingActionButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      clipBehavior: Clip.antiAlias,
                      onPressed: () {
                        // MaterialPageRoute route =
                        //     MaterialPageRoute(builder: (value) => Department());
                        // Navigator.push(context, route);
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
                            'จองคิวการตรวจอื่น',
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
      bottomNavigationBar: BottomBar(),
    );
  }
}
