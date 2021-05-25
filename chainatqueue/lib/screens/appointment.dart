import 'package:chainatqueue/models/checkhnso.dart';
import 'package:chainatqueue/models/getAppointment.dart';
import 'package:chainatqueue/models/getappoint.dart';
import 'package:chainatqueue/screens/haveappointment.dart';
import 'package:chainatqueue/screens/login.dart';
import 'package:chainatqueue/screens/startouse.dart';
import 'package:chainatqueue/utility/buttom_bar.dart';
import 'package:chainatqueue/utility/main_drawer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
class Appointment extends StatefulWidget {
   final String hn, ptname, cid, age, pt, inputHn;


   Appointment(
      {Key key,
      this.hn,
      this.age,
      this.cid,
      this.inputHn,
      this.ptname,
      this.pt,
     })
      : super(key: key);

  @override
  _AppointmentState createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
 @override
  void initState() {
    super.initState();
    hn = "${widget.hn}";
    inputHN = "${widget.inputHn}";
    getAppointment();
    readData();
  }

  var hnso, hnso1, nameD, hn1;
  ChackHnso chackHnso;
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
            "โรงพยาบาลชัยนาทนเรนทร",
            style: GoogleFonts.kanit(fontSize: 22.0, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            Container(
              width: 60.0,
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'images/person.png',
                  color: Colors.white,
                  width: 70.0,
                ),
              ),
            )
          ],
        ),
      ),
      drawer: MainDrawer(),
      // appBar: AppBar(
      //   title: Text('Appointment'),
      // ),
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
                  
                  "นัดหมาย",
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
                  'ข้อมูล ณ วันที่ 12 ก.พ. 2564 เวลา 12.00 น.',
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
                    MaterialPageRoute route =
                        MaterialPageRoute(builder: (value) => Appointment());
                    Navigator.push(context, route);
                  },
                  
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 200.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/go.png'))),
                  ),
                
                ),
                
                Padding(padding: EdgeInsets.only(top: 30.0)),
                Text(
                  'ท่านยังไม่มีนัดหมายในขณะนี้',
                  style: GoogleFonts.prompt(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[600],
                  ),
                )
              ],
            ),
          ),
        ),
       bottomNavigationBar: BottomBar(),

    );
  }
}
