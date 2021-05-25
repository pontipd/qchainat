import 'dart:convert';
import 'package:chainatqueue/models/department.dart';
import 'package:chainatqueue/models/getconfig.dart';
import 'package:chainatqueue/models/getrRx.dart';

import 'package:chainatqueue/models/getserviclistt.dart';
import 'package:chainatqueue/models/patineModel.dart';
import 'package:chainatqueue/models/pharmacy.dart';
import 'package:chainatqueue/models/rxdetail.dart';
import 'package:chainatqueue/screens/comrx.dart';

import 'package:chainatqueue/screens/de.dart';
import 'package:chainatqueue/screens/dentist.dart';
import 'package:chainatqueue/screens/internaldetail.dart';
import 'package:chainatqueue/screens/startouse.dart';
import 'package:http/http.dart' as http;
import 'package:chainatqueue/models/getDepartment.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;

import 'compharmacy.dart';

class Medicineroom extends StatefulWidget {
  final String hn,
      ptname,
      cid,
      cids,
      age,
      pt,
      inputHn,
      displayname,
      name,
      date,
      rxID;
  final String rxid, qfir, count;
  Medicineroom(
      {Key key,
      this.age,
      this.cid,
      this.cids,
      this.hn,
      this.ptname,
      this.pt,
      this.inputHn,
      this.displayname,
      this.name,
      this.count,
      this.qfir,
      this.rxid,
      this.date,
      this.rxID})
      : super(key: key);

  @override
  _MedicineroomState createState() => _MedicineroomState();
}

class _MedicineroomState extends State<Medicineroom> {
  set floatingActionButton(Container floatingActionButton) {}
  List<GetDepartment> getDepartments = List();
  List<Getrx> getrX = List();
  String hn,
      statustype = '2',
      statusDrug = '0',
      ptname,
      cid,
      age,
      pt,
      rxnum,
      oldStatus = '0',
      count,
      serviceGroupid,
      finance = '1',
      serviceid,
      status = '',
      dob = '',
      countStatus = '',
      serviceGroupList = '',
      departmentName = '',
      service = '',
      serviceid1 = '',
      serid = '',
      fname = '',
      lname = '',
      titlename = '',
      birth = '',
      title = '',
      subinscl = '',
      statusdesc = '',
      pt1 = '',
      maininscl = '',
      maininsclM = '',
      nation = '',
      request = '',
      personId = '',
      amphur = '',
      moo = '',
      sex = '',
      wsid = '',
      province = '',
      status1 = '',
      mooban = '',
      tumbon = '',
      wsidbatch = '',
      zipcode = '',
      source = '',
      doctorName,
      old = '0';
  // int age1;
  String date;
  String rxid, qfir;
  int id, countSselect, qstatus;
  var count11, serviceId;
  List<GetserviceList> getsevices = List();
  List<GetrxDetail> getrxDetails = [];
  var now = DateTime.now();
  List<Getrx> getRx = [];
  List<DataPharmacy> pharmacys = [];
  String pharmacyDrugId;

  @override
  void initState() {
    super.initState();
    age = "${widget.age}";
    ptname = "${widget.ptname}";
    print('==========777777777777$age');
        print('==========777777777777$ptname');

    Map<String, dynamic> _map = {"qn": 1283, "date": "2021-04-20"};
    var json = jsonEncode(_map);
    checkRx(json);
    if (40 >= 70) {
      setState(() {
        old = '1';
      });
      configRx();
    } else {
      configRx1();
    }
  }

  Future<Null> checkRx(json) async {
    var url = Uri.parse(
        'http://chainathospital.org/coreapi/api/v2/get_rx_list_by_qn');
    try {
      final response = await http.post(url,
          headers: {"Content-Type": "application/json"}, body: json);
      print('reee = ${response.body}');

      Getrx getRx = Getrx.fromJson(convert.jsonDecode(response.body));
      for (var i = 0; i < getRx.data[0].dataPharmacy.length; i++) {
        // print("aaaaaaaaaaa===rxOperatorId ${getRx.data[0].rxOperatorId}");
        // print("aaaaaaaaaaa==doctorName ${getRx.data[0].doctorName}");
        // print("aaaaaaaaaaa==date ${getRx.data[0].date}");
        // print("aaaaaaaaaaa===qfinace ${getRx.data[0].qfinace}");
        // print("aaaaaaaaaaa==countdrug${getRx.data[0].countdrug}");
        setState(() {
          getrX.add(getRx);
          rxid = getRx.data[0].rxOperatorId;
          date = getRx.data[0].date;
          doctorName = getRx.data[0].doctorName;
          count = getRx.data[0].countdrug;
          qfir = getRx.data[0].qfinace;
          hn = getRx.data[0].hn;
        });
        print(
            '************$date//$doctorName //$age//$count//$qfir//$rxid************');
      }
      // print(items);
      setState(() {
        pharmacys = getRx.data[0].dataPharmacy;
      });
      //rx_numberส่งมาจากหน้า barcode
      // Map<String, dynamic> _map = {"rx_number": 3264686};
      // var json1 = jsonEncode(_map);
      // rxDetail(json1);
    } catch (e) {
      print(e);
    }
  }

  Future configRx() async {
    var url =
        Uri.parse('http://q.chainathospital.org/node/api/get_drug_config');
    try {
      final response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
      );
      //  print('ress =${response.body}');
      var result = json.decode(response.body);
      print('ress =$result');
      for (var map in result) {
        Getconfig getconfig = Getconfig.fromJson(map);
        if (getconfig.drugElderly == "T") {
          setState(() {
            oldStatus = '1';
            print('oooooooo $oldStatus');
          });
        } else {
          setState(() {
            oldStatus = "0";
            print('oooooooo $oldStatus');
          });
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future configRx1() async {
    print('------------');
    var url =
        Uri.parse('http://q.chainathospital.org/node/api/get_drug_config');
    try {
      final response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
      );
      //  print('ress =${response.body}');
      var result = json.decode(response.body);
      print('ress =$result');
      for (var map in result) {
        Getconfig getconfig = Getconfig.fromJson(map);
        // print('llllllll ${getrxDetails.length}');
        if (getrxDetails.length <= getconfig.drugQty) {
          setState(() {
            //ยาด่วน
            statusDrug = '1';
            print('ddddd $statusDrug');
          });
        } else {
          setState(() {
            statusDrug = "0";
            print('dddd $statusDrug');
          });
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "เลือกรับยาใกล้บ้าน",
          style: GoogleFonts.prompt(
            fontSize: 24.0,
            color: Color(
              0xff116EA8,
            ),
          ),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.grey),
            onPressed: () {
              Navigator.pop(context);
            }
            //  onPressed: () =>
            //   Navigator.of(context).pop(),

            ),
      ),
      backgroundColor: Colors.white,

      body: Center(
        child: Container(
           width: MediaQuery.of(context).size.width * 0.85,
            child: Column(
          children: [
            Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: Text(
                    'สถานที่รับยา',
                    style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                            color: Color(
                            0xff116EA8,
                          ),
                          ),
                    textAlign: TextAlign.end,
                  ),
                )),
            Expanded(
                
                flex: 7,
                child: ListView.builder(
                  
                    itemCount: pharmacys.length,
                    shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (ctx, index) {
                      final pharmacy = pharmacys[index];

                      return Container(
                        height: 94,
                        child: Card(
                          
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          color: pharmacy.pharmacyDrugId == pharmacyDrugId
                              ? Colors.grey[400]
                              : Colors.blue[400],
                          child: ListTile(

                            
                            leading: pharmacy.pharmacyDrugId == pharmacyDrugId
                                ? Icon(Icons.check_circle)
                                : Icon(Icons.lens_outlined),
                            title: Text(pharmacy?.pharmacyDrugName ?? "-",   
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 24,
                              color: Colors.white,
                            )
                            ),

                            subtitle: Text(pharmacy?.pharmacyDrugAddress ?? "-",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.white,
                            ),),
                            
                            //trailing: Icon(Icons.navigate_next),
                            onTap: () {
                              print('click');
                              setState(() {
                                pharmacyDrugId = pharmacy.pharmacyDrugId;
                              });
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: Compharmacy(
                                    age: age,
                                    idpha: pharmacy.pharmacyDrugId,
                                    phaname: pharmacy.pharmacyDrugName,
                                    phaadd: pharmacy.pharmacyDrugAddress,
                                    date: date,
                                    doctorName: doctorName,
                                    hn: hn,
                                    ptname: ptname,
                                    count: count,
                                    qfir: qfir,
                                    rxid: '1111',
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    })),
          ],
        )),
      ),

      // body: Container(

      //     child: Center(
      //       child: Container(
      //         width: MediaQuery.of(context).size.width * 0.90,
      //         height: MediaQuery.of(context).size.height *0.9,

      //         child: SingleChildScrollView(
      //           child: Container(
      //             width: MediaQuery.of(context).size.width * 0.90,
      //             child: Column(
      //               children: <Widget>[
      //                 SizedBox(
      //                   height: 7,
      //                 ),
      //                 Container(
      //                   child: Column(
      //                     children: [
      //                       SizedBox(
      //                         child: Align(
      //                           alignment: Alignment.topRight,
      //                           child: Text(
      //                             "สถานที่รับยา",
      //                             style: GoogleFonts.kanit(
      //                               fontSize: 18.0,
      //                               color: Color(
      //                                 0xff116EA8,
      //                               ),
      //                               fontWeight: FontWeight.w400,
      //                             ),
      //                           ),
      //                         ),
      //                         width: MediaQuery.of(context).size.width,
      //                       ),
      //                         Divider(
      //                   height:5,
      //                   thickness: 1.0,
      //                   color: Color(
      //                     0xffBDBDBD,
      //                   ),
      //                 ),
      //                     ],
      //                   ),

      //                 ),
      //                 // SizedBox(
      //                 //   height: 7,
      //                 // ),

      //                 SingleChildScrollView(
      //                   physics: ScrollPhysics(),
      //                   child: Column(
      //                     children: <Widget>[
      //                       Container(
      //                         width: MediaQuery.of(context).size.width,
      //                         child: ListView.builder(
      //                           physics: NeverScrollableScrollPhysics(),
      //                           itemCount: getrX.length,
      //                           shrinkWrap: true,
      //                           itemBuilder: (BuildContext context, int index) =>
      //                               Container(
      //                             width: MediaQuery.of(context).size.width * 0.85,
      //                             padding: EdgeInsets.symmetric(
      //                                 horizontal: 10.0, vertical: 5.0),
      //                             child: Card(
      //                               color: Color(
      //                                 0xff2D9CDB,
      //                               ),
      //                               elevation: 2.0,
      //                               shape: RoundedRectangleBorder(
      //                                 borderRadius: BorderRadius.circular(12.0),
      //                               ),
      //                               child: InkWell(
      //                                 onTap: () async {
      //                                   if (getDepartments[index]
      //                                           .subserviceStatus ==
      //                                       1) {
      //                                     Navigator.push(
      //                                       context,
      //                                       PageTransition(
      //                                           type:
      //                                               PageTransitionType.leftToRight,
      //                                           child: Dentist(
      //                                             getDepartment:
      //                                                 getDepartments[index],
      //                                             ptname: ptname,
      //                                             cid: cid,
      //                                             hn: hn,
      //                                             age: age,
      //                                             groupId: getDepartments[index]
      //                                                 .servicegroupid
      //                                                 .toString(),
      //                                           )),
      //                                     );
      //                                   } else {
      //                                     await checkService(
      //                                         getDepartments[index].servicegroupid);
      //                                     Navigator.push(
      //                                       context,
      //                                       PageTransition(
      //                                         type: PageTransitionType.leftToRight,
      //                                         child: Internaldetail(
      //                                           ptname: ptname,
      //                                           dob: dob,
      //                                           age: age,
      //                                           hn: inputHn,
      //                                           inputHn: inputHn,
      //                                           cid: cid,
      //                                           service: service,
      //                                           serviceId: serviceId,
      //                                           grtserviceid: serviceId,
      //                                           servicegroupId:
      //                                               (getDepartments[index]
      //                                                       .servicegroupid)
      //                                                   .toString(),
      //                                           name: getDepartments[index]
      //                                               .servicegroupName,
      //                                         ),
      //                                       ),
      //                                     );
      //                                   }
      //                                 },
      //                                 //   MaterialPageRoute route = MaterialPageRoute(
      //                                 //       builder: (value) => Dentist(
      //                                 //             getDepartment: getDepartments[index],
      //                                 //             ptname: ptname,
      //                                 //             cid: cid,
      //                                 //             hn: hn,
      //                                 //             inputHn: inputHn,
      //                                 //             age: age,
      //                                 //           ));
      //                                 //   // MaterialPageRoute route = MaterialPageRoute(

      //                                 //   //     builder: (value) => Internaldetail(
      //                                 //   //           getDepartment: getDepartments[index],
      //                                 //   //           // ptname: ptname,
      //                                 //   //           // cid: cid,
      //                                 //   //           // hn: hn,
      //                                 //   //           // age: age,
      //                                 //   //         ));
      //                                 //   Navigator.push(context, route);
      //                                 // },
      //                                 child: Container(
      //                                   height: 76.0,
      //                                   width: MediaQuery.of(context).size.width,
      //                                   padding:
      //                                       EdgeInsets.symmetric(horizontal: 10.0),
      //                                   child: Row(
      //                                     children: [
      //                                       Text(
      //                                         getrX[0]
      //                                                     .data[0]
      //                                                     .dataPharmacy[index]
      //                                                     .pharmacyDrugName ==
      //                                                 null
      //                                             ? " "
      //                                             : getrX[0]
      //                                                 .data[0]
      //                                                 .dataPharmacy[index]
      //                                                 .pharmacyDrugName,
      //                                         style: GoogleFonts.kanit(
      //                                           fontSize: 28.0,
      //                                           color: Colors.white,
      //                                           fontWeight: FontWeight.w400,
      //                                         ),
      //                                         textAlign: TextAlign.center,
      //                                       ),
      //                                     ],
      //                                   ),
      //                                 ),
      //                               ),
      //                             ),
      //                           ),
      //                         ),
      //                       ),
      //                       SizedBox(
      //                         height: 40,
      //                       )
      //                       // Padding(padding: EdgeInsets.only(top: 3.0)),
      //                       // floatingActionButton = Container(
      //                       //   width: MediaQuery.of(context).size.width * 0.85,
      //                       //   height: 50.0,
      //                       //   child: FloatingActionButton(
      //                       //     shape: RoundedRectangleBorder(
      //                       //         borderRadius: BorderRadius.circular(7.5)),
      //                       //     clipBehavior: Clip.antiAlias,
      //                       //     onPressed: () {
      //                       //       MaterialPageRoute route = MaterialPageRoute(
      //                       //           builder: (value) => Comrx());
      //                       //       Navigator.push(context, route);
      //                       //     },
      //                       //     backgroundColor: Color(
      //                       //       0xff2D9CDB,
      //                       //     ),
      //                       //     child: Column(
      //                       //       mainAxisAlignment: MainAxisAlignment.center,
      //                       //       children: [
      //                       //         Container(
      //                       //           width:
      //                       //               MediaQuery.of(context).size.width * 0.85,
      //                       //         ),
      //                       //         Text(
      //                       //           'เลือกรับยาที่โรงพยาบาล',
      //                       //           style: GoogleFonts.kanit(fontSize: 18.0),
      //                       //         ),
      //                       //       ],
      //                       //     ),
      //                       //   ),
      //                       // ),
      //                     ],
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),

      // ),
    );
  }

  // Future<Null> findDepartmentList() async {
  //   var url = Uri.parse(
  //       "http://q.chainathospital.org/node/api/get_service_list/$servicegroupid");
  //   try {
  //     final http.Response response = await http.Client().get(
  //       url,
  //     );
  //     print('res = $response');
  //     var result = json.decode(response.body);
  //     print('result = $result');
  //     for (var map in result) {
  //       GetserviceList getserviceList = GetserviceList.fromJson(map);

  //       setState(() {
  //         getsevices.add(getserviceList);
  //       });
  //     }
  //   } catch (e) {}
  // }

  Future checkService(id) async {
    var url =
        Uri.parse("http://q.chainathospital.org/node/api/get_service_list/$id");
    try {
      final http.Response response = await http.get(
        url,
      );
      print('res = $response');
      var result = json.decode(response.body);
      print('result = $result');
      for (var map in result) {
        GetserviceList getserviceList = GetserviceList.fromJson(map);
        service = getserviceList.serviceName;
        serviceId = (getserviceList.serviceid);

        print("************checkService/////////////////////////////////////");
        print("************checkService$service");
        print("************checkService$serviceId");
      }
    } catch (e) {}
  }
}
