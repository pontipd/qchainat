import 'package:chainatqueue/models/patineModel.dart';
import 'package:chainatqueue/screens/regitster.dart';
import 'regitsterONHN.dart';
import 'package:chainatqueue/utility/my_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HosScreen extends StatefulWidget {
  final String hn, ptname, dob, cid, age, inputController;

  HosScreen({Key key, this.age, this.cid, this.dob, this.hn, this.ptname,this.inputController,})
      : super(key: key);

  @override
  _HosSState createState() => _HosSState();
}

class _HosSState extends State<HosScreen> {
  final inputController = TextEditingController();

  var ptname = '';
  var cid = '';
  var hn = '';
  var age = '';
  var dob = '';
  var inputHn = '';
  
  bool isHasData = false;

  

  @override
  void initState() {
    super.initState();
  }

  Future<void> onGetData() async {
    var header = {'Content-Type': 'application/json'};
    var url = Uri.parse(
        'http://chainathospital.org/coreapi/api/v2/get_patient_info/$inputHn?=&fbclid=IwAR0DRRJ6Cr1OY4Y9SZoz75UGyFyPF2tYakZj6TH67Fa6lSuPvMKb-iqHxUo');

    var response = await http.get(url, headers: header);

    try {
      PatientModel patientModel =
          PatientModel.fromJson(convert.jsonDecode(response.body));
      if (patientModel.status == false) {
        isHasData = false;
        setState(() {
          ptname = '';
          hn = '';
          age = '';
          dob = '';
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
        });

      }
    } catch (e) {}


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.0,
            ),
            Container(
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Color(
                        0xff828282,
                      ),
                    ),
                  ),
                  Text(
                    ' ลงทะเบียน',
                    style: GoogleFonts.kanit(
                      fontSize: 24.0,
                      color: Color(
                        0xff089EAD,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              '      เลขที่บัตรประชาชน/ เลขที่ HN',
              style: GoogleFonts.kanit(
                fontSize: 18.0,
                color: Color(
                  0xff089EAD,
                ),
              ),
            ),
            Divider(
              height: 15,
              thickness: 1.0,
              color: Colors.grey[100],
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: inputController,
              decoration: InputDecoration(
                fillColor: Colors.grey,
                contentPadding: EdgeInsets.all(10.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(color: boxColor, width: 1.0),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            SizedBox(
              height: 50.0,
              width: double.infinity,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                color: kColor,
                onPressed: () async {
                  inputHn = inputController.text;

                  print(inputHn);
                  await onGetData();
                  if (isHasData == true) {
                    hasDataDialog(context);
                  } else if (isHasData == false) {
                    noHasDataDialog(context);
                  }
                },
                child: Text(
                  'ตรวจสอบข้อมูล ',
                  style: GoogleFonts.kanit(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            // Text('name : $ptname', style: kLabelStyle),

            // Text('hn :$hn', style: kLabelStyle),
            // Text('cid :$cid', style: kLabelStyle),
            // Text('age : $age', style: kLabelStyle),
            // Text('dob : $dob', style: kLabelStyle),
          ],
        ),
      ),
      // appBar: AppBar(
      //   centerTitle: true,
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      //   title: Text(
      //     'ลงทะเบียน',
      //     style: TextStyle(
      //       color: kColor,
      //     ),
      //   ),
      // ),
    );
  }

  Future noHasDataDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: [
            Container(
              width: 440.0,
              height: 120.0,
              child: Column(
                children: [
                  Text(
                    'เข้ารับบริการผู้ป่วยใหม่',
                    style: GoogleFonts.kanit(
                      color: kColor,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Divider(
                    height: 15,
                    thickness: 1.0,
                    color: Colors.grey[100],
                  ),
                  Text(
                    'ไม่พบข้อมูลผู้ป่วย\nท่านเป็นผู้ป่วยใหม่',
                    style: GoogleFonts.kanit(
                      color: boxColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: 115.0,
                  height: 53.0,
                  child: RaisedButton(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.0)),
                    onPressed: () {
                      MaterialPageRoute route =
                          MaterialPageRoute(builder: (value) => HosScreen());
                      Navigator.push(context, route);
                    },
                    child: Text(
                      'ย้อนกลับ',
                      style: GoogleFonts.kanit(
                        fontSize: 22.0,
                        color: kColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  width: 115.0,
                  height: 53.0,
                  child: RaisedButton(
                    color: MyStyle().prinaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.0)),
                     onPressed: () {
                        MaterialPageRoute route =
                            MaterialPageRoute(builder: (value) => ON(

                                  name: ptname,
                                  cids: cid,
                                  bh: dob,
                                  hns:hn,
                                  inputHn:inputHn,
                            ));
                        Navigator.push(context, route);
                      },
                    child: Text(
                      'ต่อไป',
                      style: GoogleFonts.kanit(
                        fontSize: 22.0,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }

  Future hasDataDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            children: [
              Container(
                width: 440.0,
                height: 120.0,
                child: Column(
                  children: [
                    Text(
                      ptname,
                      style: GoogleFonts.kanit(
                        color: kColor,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Divider(
                      height: 15,
                      thickness: 1.0,
                      color: Colors.grey[100],
                    ),
                    Text(
                      'HN :$hn',
                      style: GoogleFonts.kanit(
                        color: boxColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'วันเกิด $dob',
                      style: GoogleFonts.kanit(
                        color: boxColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    width: 115.0,
                    height: 53.0,
                    child: RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0)),
                      onPressed: () {
                        MaterialPageRoute route =
                            MaterialPageRoute(builder: (value) => HosScreen());
                        Navigator.push(context, route);
                      },
                      child: Text(
                        'ย้อนกลับ',
                        style: GoogleFonts.kanit(
                          fontSize: 22.0,
                          color: kColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    width: 115.0,
                    height: 53.0,
                    child: RaisedButton(
                      color: MyStyle().prinaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0)),
                      onPressed: () {
                        MaterialPageRoute route = MaterialPageRoute(
                            builder: (value) => Register(
                                  name: ptname,
                                  cids: cid,
                                  bh: dob,
                                  hns:hn,
  
                                  inputHn:inputHn,
                                
                                ));
                        Navigator.push(context, route,);
                      },
                      child: Text(
                        'ต่อไป',
                        style: GoogleFonts.kanit(
                          fontSize: 22.0,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            ],
          );
        });
  }
}

const kLabelStyle = TextStyle(fontSize: 22, color: Colors.green);
const kColor = Color(0xFF339EAD);
const boxColor = Color(0xFFBDBDBD);
