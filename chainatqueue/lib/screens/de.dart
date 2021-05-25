import 'dart:convert';
import 'package:chainatqueue/models/getgueue.dart';
import 'package:chainatqueue/models/getserviclistt.dart';
import 'package:chainatqueue/screens/mystyle.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:http/http.dart' as http;

import 'dart:convert' as convert;


class Detail1 extends StatefulWidget {
  final String name, hn, ptname, cid, age, pt, servicegroupId, dob, service;
  final int grtserviceid;

  Detail1(
      {Key key,
      this.name,
      this.grtserviceid,
      this.age,
      this.cid,
      this.hn,
      this.ptname,
      this.pt,
      this.servicegroupId,
      this.service,
      this.dob})
      : super(key: key);

  @override
  _Detail1State createState() => _Detail1State();
}

class _Detail1State extends State<Detail1> {
  int id;
  String departmentName,
      service,
      hn,
      ptname,
      cid,
      age,
      pt,
      serviceGroupid,
      serviceid1,
      dob,
      q,
      serid,
      fname,
      lname,
      titlename,
      birth,
      title,
      subinscl,
      statusdesc,
      pt1,
      maininscl,
      maininsclM,
      nation,
      request,
      personId,
      amphur,
      moo,
      sex,
      wsid,
      province,
      status,
      mooban,
      tumbon,
      wsidbatch,
      zipcode,
      source;
  int countSselect;
  GetserviceList getserviceList;
  var now = DateTime.now();
  var formatter = DateFormat.yMMMMEEEEd();
  var date;
  @override
  void initState() {
    super.initState();
    serviceGroupid = "${widget.servicegroupId}";
    serid = "${widget.grtserviceid}";
    service = "${widget.service}";
    date = "${formatter.format(now)}";
    cid = "${widget.cid}";
   
    print(serviceGroupid);
    print(serid);
  }

 

  @override
  Widget build(BuildContext context) {
    departmentName = "${widget.name}";
    ptname = "${widget.ptname}";
    hn = "${widget.hn}";
    cid = "${widget.cid}";
    age = "${widget.age}";
    pt = "${widget.pt}";
    serviceGroupid = "${widget.servicegroupId}";
    serviceid1 = "${widget.grtserviceid}";
    dob = "${widget.dob}";

    return Scaffold(
      backgroundColor: Color(
        0xff0baabd,
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 30.0)),
                Card(
                    color: Color(
                      0xffeff7f9,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Mystyle().head(),
                    )),
                Padding(padding: EdgeInsets.only(top: 20.0)),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Text(
                    "ยืนยันการรับบริการ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Prompt",
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Container(
                    margin: new EdgeInsets.symmetric(horizontal: 30.0),
                    width: MediaQuery.of(context).size.width * 0.85,
                    // height: MediaQuery.of(context).size.height,
                    // height: 400,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              " ข้อมูลผู้รับบริการ",
                              style: TextStyle(
                                color: Color(
                                  0xff4f4f4f,
                                ),
                                fontSize: 30,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Prompt",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.orange, width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20.0,
                              ),
                              SizedBox(
                                  child: Align(
                                alignment: Alignment.center,
                                child: Text(ptname,
                                    style: TextStyle(
                                      color: Color(
                                        0xff7b8794,
                                      ),
                                      fontFamily: "Prompt",
                                      fontSize: 36,
                                    )),
                              )),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        "HN",
                                        style: TextStyle(
                                          color: Color(
                                            0xff666666,
                                          ),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Prompt",
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        hn,
                                        style: TextStyle(
                                          color: Color(
                                            0xff666666,
                                          ),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Prompt",
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 15.0,
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        "เลขที่บัตรประจำตัวประชาชน",
                                        style: TextStyle(
                                          color: Color(
                                            0xff666666,
                                          ),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Prompt",
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        cid,
                                        style: TextStyle(
                                          color: Color(
                                            0xff666666,
                                          ),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Prompt",
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 15.0,
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        "อายุ",
                                        style: TextStyle(
                                          color: Color(
                                            0xff666666,
                                          ),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Prompt",
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        age,
                                        style: TextStyle(
                                          color: Color(
                                            0xff666666,
                                          ),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Prompt",
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 15.0,
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        "สิทธิการรักษา",
                                        style: TextStyle(
                                          color: Color(
                                            0xff666666,
                                          ),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Prompt",
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        pt,
                                        style: TextStyle(
                                          color: Color(
                                            0xff666666,
                                          ),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Prompt",
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 20.0,
                        ),
                        // button(),
                        // SizedBox(
                        //   height: 10.0,
                        // ),

                        // Container(
                        //   width: MediaQuery.of(context).size.width * 0.9,
                        //   decoration: BoxDecoration(
                        //       border:
                        //           Border.all(color: Colors.grey[300], width: 2),
                        //       borderRadius:
                        //           BorderRadius.all(Radius.circular(12))),
                        // ),
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
                                      "  แผนก/คลินิก : $departmentName",
                                      style: TextStyle(
                                        color: Color(
                                          0xff666666,
                                        ),
                                        fontSize: 36,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Prompt",
                                      ),
                                    ),
                                    width: MediaQuery.of(context).size.width *
                                        0.85),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
                                  child: Divider(
                                      height: 15,
                                      thickness: 1.25,
                                      color: Colors.grey),
                                ),
                                Padding(padding: EdgeInsets.only(top: 7.0)),
                                SizedBox(
                                  child: Text(
                                    "  บริการ : $service",
                                    style: TextStyle(
                                      color: Color(
                                        0xff666666,
                                      ),
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Prompt",
                                    ),
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
                                ),
                                Padding(padding: EdgeInsets.only(top: 7.0)),
                                SizedBox(
                                  child: Text(
                                    "  ผู้ป่วย Walk in",
                                    style: TextStyle(
                                      color: Color(
                                        0xff666666,
                                      ),
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Prompt",
                                    ),
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
                                ),
                                Padding(padding: EdgeInsets.only(top: 7.0)),
                                SizedBox(
                                  child: Text(
                                    "  ชื่อแพทย์ : ไม่ระบุแพทย์ ",
                                    style: TextStyle(
                                      color: Color(
                                        0xff666666,
                                      ),
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Prompt",
                                    ),
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
                                ),
                                Padding(padding: EdgeInsets.only(top: 7.0)),
                                SizedBox(
                                  child: Text(
                                    " ${formatter.format(now)}  เวลา 9.00 - 12.00 น.",
                                    style: TextStyle(
                                      color: Color(
                                        0xff666666,
                                      ),
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Prompt",
                                    ),
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
                                ),
                                SizedBox(
                                  height: 40.0,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 555.0,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Container(
                              child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  height: 50.0,
                                  child: RaisedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.reply_all,
                                          color: Colors.grey[600],
                                        ),
                                        Text(
                                          'ย้อนกลับ ',
                                          style: TextStyle(
                                            fontSize: 24.0,
                                            color: Color(
                                              0xff727876,
                                            ),
                                            fontFamily: "Prompt",
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Colors.orange,
                                          width: 1,
                                          style: BorderStyle.solid),
                                      borderRadius:
                                          new BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 50.0,
                                  child: RaisedButton(
                                    onPressed: () {
                                      Map<String, dynamic> _map = {
                                        "patient_info": {
                                          "pt_name": ptname,
                                          "hn": hn,
                                          "cid": cid,
                                          "dob": dob,
                                          "age": age,
                                          "data_visit": null,
                                          "vn": null,
                                          "main_dep": null,
                                          "department": null
                                        },
                                        "right": {
                                          "birthdate": birth,
                                          "count_select": countSselect,
                                          "fname": fname,
                                          "lname": lname,
                                          "maininscl": maininscl,
                                          "maininscl_main": maininsclM,
                                          "maininscl_name": pt,
                                          "nation": nation,
                                          "person_id": personId,
                                          "primary_amphur_name": amphur,
                                          "primary_moo": moo,
                                          "primary_mooban_name": mooban,
                                          "primary_province_name": province,
                                          "primary_tumbon_name": tumbon,
                                          "primaryprovince": zipcode,
                                          "sex": sex,
                                          "subinscl": subinscl,
                                          "subinscl_name": pt1,
                                          "title": title,
                                          "title_name": titlename,
                                          "ws_data_source": source,
                                          "ws_date_request": request,
                                          "ws_status": status,
                                          "ws_status_desc": statusdesc,
                                          "wsid": wsid,
                                          "wsid_batch": wsidbatch
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
                                        "servicegroupid": serviceGroupid,
                                        "serviceid": serid,
                                        "created_from": 1,
                                        "quickly": 0
                                      };
                                      var json = jsonEncode(_map);
                                      getQueues(json);
                                      // MaterialPageRoute route =
                                      //     MaterialPageRoute(
                                      //         builder: (value) => Pdfview());
                                      // Navigator.push(context, route);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '    ยืนยันเพื่อรับบัตรคิว    ',
                                          style: TextStyle(
                                              fontSize: 22.0,
                                              fontFamily: "Prompt",
                                              color: Colors.white),
                                          textAlign: TextAlign.center,
                                        ),
                                        Icon(
                                          Icons.next_plan_rounded,
                                          color: Colors.grey[200],
                                        ),
                                      ],
                                    ),
                                    color: Color(0xff0baabd),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 80.0,
                ),
                Padding(padding: EdgeInsets.only(top: 100.0)),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Mystyle().bottomBar(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<Null> getQueues(json) async {
    var url = Uri.parse(  'http://q.chainathospital.org/app/kiosk/create-queue');

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json,
      );
      var getData = jsonDecode(response.body);
      var getQ = Getqueue.fromJson(getData);
      // ก้อนแรก
      print(getQ.modelQueue);
      // d้อนที่ 2
      print(getQ.modelQtrans);
      setState(() {
        q = getQ.modelQueue.qNum;
        id = getQ.modelQueue.qIds;
      });
      print('qqqq $q');
      showDialog(
        context: context,
        builder: (context) => SimpleDialog(
          title: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "รับบัตรคิว",
                    style: TextStyle(
                      color: Color(
                        0xff7b8794,
                      ),
                      fontSize: 36,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Prompt",
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Divider(
                  height: 15,
                  thickness: 1.0,
                  color: Color(
                    0xff727876,
                  ),
                ),
                Text(
                  "รับหมายเลขคิว\n$q",
                  style: TextStyle(
                    color: Color(
                      0xff0baabd,
                    ),
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Prompt",
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30.0,
                ),
                button1(),
                SizedBox(
                  height: 20.0,
                )
              ],
            ),
          ),
        ),
      );
     
    } catch (e) {
      print(e);
    }
  }

  
  Widget button1() => Container(
      width: MediaQuery.of(context).size.width * 0.9,
      alignment: Alignment.bottomCenter,
      margin: new EdgeInsets.symmetric(horizontal: 30.0),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.2,
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {
                    // Navigator.pop(context);
                    // MaterialPageRoute route =
                    //     MaterialPageRoute(builder: (value) => MainPage());
                    // Navigator.push(context, route);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ปิดน้าต่าง',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontFamily: "Prompt",
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  color: Color(0xff0baabd),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ));
}
