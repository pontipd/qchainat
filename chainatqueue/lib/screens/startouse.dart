import 'package:chainatqueue/main.dart';
import 'package:chainatqueue/models/checkhnso.dart';
import 'package:chainatqueue/models/patineModel.dart';
import 'package:chainatqueue/models/getappoint.dart';
import 'package:chainatqueue/screens/appointment.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:chainatqueue/screens/chacklogin.dart';
import 'package:chainatqueue/screens/check.dart';
import 'package:chainatqueue/screens/haveappointment.dart';
import 'package:chainatqueue/screens/homepage.dart';
import 'package:chainatqueue/utility/my_style.dart';
import 'ok.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Startouse1 extends StatefulWidget {
  final String genders,
      username,
      password,
      type,
      name,
      surname,
      phon,
      bh,
      cids,
      inputHn,
      hns;
  bool isHasData = false;
  Startouse1(
      {Key key,
      this.bh,
      this.cids,
      this.genders,
      this.name,
      this.password,
      this.phon,
      this.surname,
      this.type,
      this.hns,
      this.inputHn,
      this.username})
      : super(key: key);

  @override
  _Startouse1State createState() => _Startouse1State();
}

String genders,
    username,
    password,
    type,
    name,
    surname,
    phon,
    bh,
    cids,
    hns,
    ptname,
    hn,
    age,
    dob,
    inputHn,
    cid;
bool isHasData =false;
List<Getappointmen> getappointments = List();

class _Startouse1State extends State<Startouse1> {
  double screen;
  @override
  void initState() {
    super.initState();

  }

  Future<Null> checkhn() async {
    var header = {'Content-Type': 'application/json'};
    var url = Uri.parse(
        'http://chainathospital.org/coreapi/api/v2/get_patient_info/$hns?=&fbclid=IwAR0DRRJ6Cr1OY4Y9SZoz75UGyFyPF2tYakZj6TH67Fa6lSuPvMKb-iqHxUo');

    var response = await http.get(url, headers: header);
    

     try {
      Getappointmen getappointmen =
          Getappointmen.fromJson(convert.jsonDecode(response.body));
      if (getappointmen.status == false) {
          isHasData = false;
        MaterialPageRoute route =
                MaterialPageRoute(builder: (value) =>Haveappoin(
                    
                    hn: hns,
                    inputHn:inputHn,
                ));
            Navigator.push(context, route);
      } else {
         isHasData = true;
         MaterialPageRoute route =
                MaterialPageRoute(builder: (value) =>Haveappoin(

                    hn: hns,
                    inputHn:inputHn,
                ));
            Navigator.push(context, route);
      }

    } catch (e) {}
  }














  @override
  Widget build(BuildContext context) {
    bh = "${widget.bh}";
    name = "${widget.name}";
    cids = "${widget.cids}";
    hns = "${widget.hns}";
    inputHn = "${widget.inputHn}";

    screen = MediaQuery.of(context).size.width;
    print('screen =$screen');
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(
                0xffF2F2F2,
              ),
              Colors.white,
            ],
            stops: [
              0.8,
              1,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 80.0)),

              nameSystem(),
              Padding(padding: EdgeInsets.only(top: 30.0)),
              showLogo(),
              Padding(padding: EdgeInsets.only(top: 30.0)),
              // login(),
              // Padding(padding: EdgeInsets.only(top: 10.0)),
              nameForm(),
              Padding(padding: EdgeInsets.only(top: 30.0)),
              text(),
              Padding(padding: EdgeInsets.only(top: 30.0)),
              // checkprofile(),
              // // Rember(),
              // Padding(padding: EdgeInsets.only(top: 5.0)),
              startButton(),
              Padding(padding: EdgeInsets.only(top: 15.0)),
            ],
          ),
        ),
      ),
    );
  }

  Widget startButton() {
    return Container(
        margin: new EdgeInsets.symmetric(horizontal: 30.0),
        width: MediaQuery.of(context).size.width * 0.85,
        height: 50.0,
        child: RaisedButton(
          // onPressed: () {

          //   MaterialPageRoute route =
          //       MaterialPageRoute(builder: (value) => Appointment());
          //   Navigator.push(context, route);
          // },
          onPressed: () async {
                  

                  print(inputHn);
                  await checkhn();
                  if (isHasData == true) {
                    checkAppointment;
                  } else if (isHasData == false) {
                    MaterialPageRoute route =
                MaterialPageRoute(builder: (value) => Appointment(
                  hn: hns,
              inputHn:inputHn,
             
                ));
            Navigator.push(context, route);
                   
                  }
                },
          // onPressed: () {
          //   checkAppointment;

          //           print(inputHn);

          //   //         if (inputHn ==null) {
          //   //           MaterialPageRoute route =
          //   //     MaterialPageRoute(builder: (value) => Appointment());
          //   // Navigator.push(context, route);
          //   // //
          //   //         } else  {
          //   //           MaterialPageRoute route =
          //   //     MaterialPageRoute(builder: (value) => Haveappoin());
          //   // Navigator.push(context, route);
          //   //         }
          // },
          // else if (hns != hns) {
          //  MaterialPageRoute route =
          //     MaterialPageRoute(builder: (value) => Appointment());
          // Navigator.push(context, route);
          // }

          child: Text(
            'เริ่มใช้งาน',
            style: GoogleFonts.kanit(
              fontSize: 24.0,
              height: 1.5,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          color: Color(
            0xff089EAD,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(7.0),
          ),
        ));
  }

  text() => Container(
      margin: new EdgeInsets.symmetric(horizontal: 30.0),
      width: screen * 0.75,
      child: Row(children: <Widget>[
        // Expanded(
        //     child: Divider(
        //   thickness: 1.0,
        //   color: Color(
        //     0xff727876,
        //   ),
        // )),
        //
        RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              style: TextStyle(
                height: 1.5,
                fontSize: 16.0,
                fontFamily: 'Kanit',
                fontWeight: FontWeight.w400,
                color: Color(
                  0xff4F4F4F,
                ),

                /* letterSpacing: 0.18, */
              ),
              children: [
                TextSpan(
                  text: '''เข้าสู่แอปพลิเคชั่น XXX  \n''',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontFamily: 'Kanit',
                    /* letterSpacing: null, */
                  ),
                ),
                TextSpan(
                  text: '''ท่านสามารถเริ่มใช้งานได้ทันที่''',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Color(
                      0xff4F4F4F,
                    ),

                    /* letterSpacing: null, */
                  ),
                )
              ],
            )),
      ]));

  nameForm() => SizedBox(
        child: Container(
          child: Text(
            'ยินดีต้อนรับ\n$inputHn',
            style: GoogleFonts.kanit(
              color: Color(
                0xff089ead,
              ),
              fontSize: 24.0,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        width: 375,
      );

  // login() => SizedBox(
  //       child: Align(
  //         alignment: Alignment(-0.85, 0.7),
  //         child: Text(
  //           "เข้าสู่ระบบ",
  //           style: GoogleFonts.kanit(
  //             color: Color(
  //               0xff089ead,
  //             ),
  //             fontSize: 18.0,
  //             fontWeight: FontWeight.w400,
  //           ),
  //         ),
  //       ),
  //       width: 345,
  //     );

  nameSystem() => SizedBox(
        child: Container(
          child: Text(
            "ขอแสดงความยินดี",
            style: GoogleFonts.kanit(
              color: Color(
                0xff089ead,
              ),
              fontSize: 34.0,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        width: 375,
      );
  showLogo() => Container(
        width: 299.0,
        height: 253.0,
        child: ClipRRect(
          borderRadius: BorderRadius.zero,
          child: Container(
            color: Color.fromARGB(255, 196, 196, 196),
          ),
        ),
      );



  Future<Null> get checkAppointment async {
    var header = {'Content-Type': 'application/json'};
    var url = Uri.parse(
        'http://chainathospital.org/coreapi/api/v2/get_appointment_list/$hns');

    var response = await http.get(url, headers: header);

    try {
      Getappointmen getappointmen =
          Getappointmen.fromJson(convert.jsonDecode(response.body));
      if (getappointmen.status == false) {
        MaterialPageRoute route =
            MaterialPageRoute(builder: (value) => Appointment(
               hn: hns,
              inputHn:inputHn,
              
              


            ));
        Navigator.push(context, route);
      } else {
        MaterialPageRoute route =
            MaterialPageRoute(builder: (value) => Haveappoin(

              hn: hns,
              inputHn:inputHn,
              getappointment: getappointments[0],
              


            ));
        Navigator.push(context, route);
      }

   

    } catch (e) {}
  }




//  Future<Null> checkhnso() async {
//     String url = 'http://chainathospital.org/coreapi/api/v2/check_state_nhso/';
//     try {
//       final http.Response response = await http.Client().get(
//         url,
//       );
//       ChackHnso chackHnso =
//           ChackHnso.fromJson(convert.jsonDecode(response.body));
//       setState(() {
//         for (var i = 0; i < chackHnso.nonCheckNhso.length; i++) {
//           checkHnso.add(chackHnso);
//         }
//         if (chackHnso.nonCheckNhso.contains(hnso) == true) {
//           MaterialPageRoute route = MaterialPageRoute(
//               builder: (value) => Appoint(
//                     ptname: ptname,
//                     cid: cid,
//                     hn: hn1,
//                     age: age,
//                     pt: pt,
//                     depart: depart,
//                     doctorname: doctorname,
//                     reson: reson,
//                   ));
//           Navigator.push(context, route);
//         } else {
//           MaterialPageRoute route = MaterialPageRoute(
//               builder: (value) => Medicalrecord(
//                     pt: pt,
//                     ptname: ptname,
//                     cid: cid,
//                     age: age,
//                     hn: hn1,
//                   ));
//           Navigator.push(context, route);
//         }
//       });
//     } catch (e) {}
//   }







}
