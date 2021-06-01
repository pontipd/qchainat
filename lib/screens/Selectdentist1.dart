import 'dart:convert';
import 'package:chainatqueue/models/getdentist.dart';
import 'package:chainatqueue/screens/Internaldetail.dart';
import 'package:http/http.dart' as http;
import 'package:chainatqueue/models/getDepartment.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;

class Dentist extends StatefulWidget {
  final GetDepartments getDepartments;
  Dentist({Key key, this.getDepartments}) : super(key: key);

  @override
  _DentistState createState() => _DentistState();
}

class _DentistState extends State<Dentist> {
  var servicgroupid, servicename;
  GetDepartments getDepartment;
  List<GetDentists> getdentist = List();
  @override
  void initState() {
    super.initState();
    getDepartment = widget.getDepartments;
    servicgroupid = getDepartment.servicegroupid;
    dentist();
  }

  Future<Null> dentist() async {
    var header = {'Content-Type': 'application/json'};
    var url = Uri.parse(
        'http://q.chainathospital.org/node/api/get_servicegroup_list/$servicgroupid');

    var response = await http.get(url, headers: header);
    var result = json.decode(response.body);

    for (var map in result) {
      GetDentists getDentists = GetDentists.fromJson(map);
      setState(() {
        getdentist.add(getDentists);
      });
    }
    //   setState(() {

    //  getDepartments.add(getDepartment);
    //   });
  }

  // Future<Null> getdepartment() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   String servicegroupid = preferences.getString('id');
  //   print('servicegroupid ==> $servicegroupid');
  // }

  // ignore: deprecated_member_use

//  Future<Null> getdepartmen() async {
//     String url =Uri.parse("http://q.chainathospital.org/node/api/get_servicegroup_list");
//     try {

//       final http.Response response = await http.Client().get(url,);

//       print('res = $response');
//       var result = json.decode(response.body);
//       print('result = $result');
//       if (result.toString() != null) {
//         for (var map in result) {
//           GetDepartments getDepartmentp = GetDepartments.fromJson(map);

//           setState(() {
//             getDepartment.add(getDepartmentp);
//             // print(' map = $map');
//           });
//         }
//       } else {
//         Text('ไม่มีข้อมูล');
//       }
//     } catch (e) {}
//   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.90,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.90,
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 30.0)),
                  Row(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.arrow_back),
                          iconSize: 36.0,
                          color: Color(
                            0xff828282,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      Text(
                        'จองคิว',
                        style: GoogleFonts.prompt(
                          fontSize: 24.0,
                          color: Color(
                            0xff116EA8,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        " เลือกแผนก/คลินิก",
                        style: GoogleFonts.kanit(
                          fontSize: 18.0,
                          color: Color(
                            0xff116EA8,
                          ),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width,
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Divider(
                    height: 15,
                    thickness: 1.0,
                    color: Color(
                      0xffBDBDBD,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  // ListView.builder(
                  //     itemCount: getDepartment.length,
                  //     shrinkWrap: true,
                  //     itemBuilder: (BuildContext context, int index) =>
                  //         Container(
                  //           width: MediaQuery.of(context).size.width,
                  //           padding: EdgeInsets.symmetric(
                  //               horizontal: 10.0, vertical: 5.0),
                  //           child: Card(
                  //             elevation: 5.0,
                  //             shape: RoundedRectangleBorder(
                  //               borderRadius: BorderRadius.circular(0.0),
                  //             ),
                  //             child: Container(
                  //               width: MediaQuery.of(context).size.width,
                  //               padding: EdgeInsets.symmetric(horizontal: 10.0),
                  //               child: Row(
                  //                 mainAxisAlignment:
                  //                     MainAxisAlignment.spaceBetween,
                  //                 crossAxisAlignment: CrossAxisAlignment.center,
                  //                 children: <Widget>[
                  //                   Row(
                  //                     mainAxisAlignment:
                  //                         MainAxisAlignment.start,
                  //                     crossAxisAlignment:
                  //                         CrossAxisAlignment.start,
                  //                   ),
                  //                   SizedBox(width: 6.0),
                  //                   Column(
                  //                     crossAxisAlignment:
                  //                         CrossAxisAlignment.start,
                  //                     children: <Widget>[
                  //                       Row(
                  //                         children: [
                  //                           Text(
                  //                               getDepartment[index]
                  //                                   .servicegroupName,
                  //                               style: TextStyle(
                  //                                   color: Colors.black,
                  //                                   fontSize: 18.0,
                  //                                   fontWeight:
                  //                                       FontWeight.bold)),
                  //                           Text((' '),
                  //                               style: TextStyle(
                  //                                   color: Colors.black,
                  //                                   fontSize: 18.0,
                  //                                   fontWeight:
                  //                                       FontWeight.bold)),
                  //                         ],
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ],
                  //               ),
                  //               //  widget(child: Container(alignment: Alignment.center,))
                  //             ),
                  //           ),
                  //         )),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      itemCount: getdentist.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) =>
                          Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5.0),
                        child: Card(
                          color: Color(
                            0xff0baabd,
                          ),
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: InkWell(
                            onTap: () {
                              // MaterialPageRoute route = MaterialPageRoute(
                              //     builder: (value) => Internaldetail(
                                       
                              //           // cid: cid,
                              //           // hn: hn,
                              //           // age: age,
                              //         ));
                              // Navigator.push(context, route);
                            },
                            child: Container(
                              height: 65.0,
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                children: [
                                  Text(
                                    getdentist[index].serviceName,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
