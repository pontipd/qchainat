// import 'dart:convert';
// import 'package:chainatqueue/models/department.dart';
// import 'package:chainatqueue/models/getrx.dart';
// import 'package:chainatqueue/models/getserviclistt.dart';
// import 'package:chainatqueue/models/patineModel.dart';

// import 'package:chainatqueue/screens/de.dart';
// import 'package:chainatqueue/screens/dentist.dart';
// import 'package:chainatqueue/screens/internaldetail.dart';
// import 'package:chainatqueue/screens/startouse.dart';
// import 'package:http/http.dart' as http;
// import 'package:chainatqueue/models/getDepartment.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:page_transition/page_transition.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert' as convert;

// class Medicineroom extends StatefulWidget {
//   final String hn, ptname, cid, cids, age, pt, inputHn, displayname, name ,date, rxID;
//   Medicineroom(
//       {Key key,
//       this.age,
//       this.cid,
//       this.cids,
//       this.hn,
//       this.ptname,
//       this.pt,
//       this.inputHn,
//       this.displayname,
//       this.name,
//       this.date,
//       this.rxID})
//       : super(key: key);

//   @override
//   _MedicineroomState createState() => _MedicineroomState();
// }

// class _MedicineroomState extends State<Medicineroom> {
//   List<GetDepartment> getDepartments = List();
//     List<GetRx> getrX = List();
//   String serviceGroup_id,
//       hn,
//       ptname,
//       cid,
//       cids,
//       age,
//       inputHn,
//       displayname,
//       servicegroupid,
//       service,
//       name, rxId;
//   var count11, serviceId;
//   List<GetserviceList> getsevices = List();

//   @override
//   void initState() {
//     super.initState();
//    Map<String, dynamic> _map = {
//       "qn": "1283",
//       "date": "2021-04-20",
//     };
//     var json = jsonEncode(_map);
//     medList(http.Client(), json);
//   }

  

//    Future<Null> medList(http.Client client, var json) async {
//     var url = Uri.parse(
//         'http://chainathospital.org/coreapi/api/v2/get_rx_list_by_qn');

//     print('ooooooooooooooooooooooooooo');
//     try {
//       final response = await client.post(url,
//           headers: {"Content-Type": "application/json"}, body: json);
//       var getRxx = jsonDecode(response.body);
//       GetRx getRx = GetRx.fromJson(convert.jsonDecode(response.body));
//       // rxtype = getRx.data[0].rxType;
//       print('ooooooooooooooooooooooooooo');
//       print(getRx.data[0].rxType);
//       // print('$rxtype');
//       print(getRx.data[0].dataPharmacy[0].pharmacyDrugName);
//       for (var i = 0; i < getRx.data[0].dataPharmacy.length; i++) {
//         setState(() {
//           getrX.add(getRx);
//           // rxtype = getRx.data[0].rxType;
//         });
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
    



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           width: MediaQuery.of(context).size.width * 0.90,
//           height: MediaQuery.of(context).size.height,
//           child: SingleChildScrollView(
//             child: Container(
//               width: MediaQuery.of(context).size.width * 0.90,
//               child: Column(
//                 children: <Widget>[
//                   Padding(padding: EdgeInsets.only(top: 30.0)),
//                   Row(
//                     children: <Widget>[
//                       IconButton(
//                           icon: Icon(Icons.arrow_back),
//                           iconSize: 36.0,
//                           color: Color(
//                             0xff828282,
//                           ),
//                           onPressed: () {
//                             Navigator.pop(context);
//                           }),
//                       Text(
//                         'จองคิว',
//                         style: GoogleFonts.prompt(
//                           fontSize: 24.0,
//                           color: Color(
//                             0xff116EA8,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 10.0,
//                   ),
//                   SizedBox(
//                     child: Align(
//                       alignment: Alignment.topRight,
//                       child: Text(
//                         " เลือกแผนก/คลินิก",
//                         style: GoogleFonts.kanit(
//                           fontSize: 18.0,
//                           color: Color(
//                             0xff116EA8,
//                           ),
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                     ),
//                     width: MediaQuery.of(context).size.width,
//                   ),
//                   SizedBox(
//                     height: 7,
//                   ),
//                   Divider(
//                     height: 15,
//                     thickness: 1.0,
//                     color: Color(
//                       0xffBDBDBD,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10.0,
//                   ),
//                   // ListView.builder(
//                   //     itemCount: getDepartment.length,
//                   //     shrinkWrap: true,
//                   //     itemBuilder: (BuildContext context, int index) =>
//                   //         Container(
//                   //           width: MediaQuery.of(context).size.width,
//                   //           padding: EdgeInsets.symmetric(
//                   //               horizontal: 10.0, vertical: 5.0),
//                   //           child: Card(
//                   //             elevation: 5.0,
//                   //             shape: RoundedRectangleBorder(
//                   //               borderRadius: BorderRadius.circular(0.0),
//                   //             ),
//                   //             child: Container(
//                   //               width: MediaQuery.of(context).size.width,
//                   //               padding: EdgeInsets.symmetric(horizontal: 10.0),
//                   //               child: Row(
//                   //                 mainAxisAlignment:
//                   //                     MainAxisAlignment.spaceBetween,
//                   //                 crossAxisAlignment: CrossAxisAlignment.center,
//                   //                 children: <Widget>[
//                   //                   Row(
//                   //                     mainAxisAlignment:
//                   //                         MainAxisAlignment.start,
//                   //                     crossAxisAlignment:
//                   //                         CrossAxisAlignment.start,
//                   //                   ),
//                   //                   SizedBox(width: 6.0),
//                   //                   Column(
//                   //                     crossAxisAlignment:
//                   //                         CrossAxisAlignment.start,
//                   //                     children: <Widget>[
//                   //                       Row(
//                   //                         children: [
//                   //                           Text(
//                   //                               getDepartment[index]
//                   //                                   .servicegroupName,
//                   //                               style: TextStyle(
//                   //                                   color: Colors.black,
//                   //                                   fontSize: 18.0,
//                   //                                   fontWeight:
//                   //                                       FontWeight.bold)),
//                   //                           Text((' '),
//                   //                               style: TextStyle(
//                   //                                   color: Colors.black,
//                   //                                   fontSize: 18.0,
//                   //                                   fontWeight:
//                   //                                       FontWeight.bold)),
//                   //                         ],
//                   //                       ),
//                   //                     ],
//                   //                   ),
//                   //                 ],
//                   //               ),
//                   //               //  widget(child: Container(alignment: Alignment.center,))
//                   //             ),
//                   //           ),
//                   //         )),
//                   Container(
//                     width: MediaQuery.of(context).size.width,
//                     child: ListView.builder(
//                       itemCount: getrX.length,
//                       shrinkWrap: true,
//                       itemBuilder: (BuildContext context, int index) =>
//                           Container(
//                         width: MediaQuery.of(context).size.width * 0.85,
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 10.0, vertical: 5.0),
//                         child: Card(
//                           color: Color(
//                             0xff2D9CDB,
//                           ),
//                           elevation: 2.0,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12.0),
//                           ),
//                           child: InkWell(
//                             onTap: () async{
//                               if (getDepartments[index].subserviceStatus == 1) {
//                              Navigator.push(
//                   context,
//                   PageTransition(
//                     type: PageTransitionType.leftToRight,
//                     child:  Dentist(
//                                           getDepartment: getDepartments[index],
//                                           ptname: ptname,
//                                           cid: cid,
//                                           hn: hn,
//                                           age: age,
//                                           groupId: getDepartments[index]
//                                               .servicegroupid
//                                               .toString(),
//                                         )
//                   ),
//                                         );
                               
//                               } else {
//                                 await checkService(
//                                     getDepartments[index].servicegroupid);
//                                 Navigator.push(
//                   context,
//                   PageTransition(
//                     type: PageTransitionType.leftToRight,
//                     child: Internaldetail(
//                                     ptname: ptname,
//                                     dob: dob,
//                                     age: age,
//                                     hn: inputHn,
//                                     inputHn: inputHn,
//                                     cid: cid,
//                                     service: service,
//                                     serviceId: serviceId,
//                                     grtserviceid: serviceId ,
//                                     servicegroupId:
//                                         (getDepartments[index].servicegroupid)
//                                             .toString(),
//                                     name:
//                                         getDepartments[index].servicegroupName,
//                                   ),
//                   ),
//                                 );

                               
//                               }
//                             },
//                             //   MaterialPageRoute route = MaterialPageRoute(
//                             //       builder: (value) => Dentist(
//                             //             getDepartment: getDepartments[index],
//                             //             ptname: ptname,
//                             //             cid: cid,
//                             //             hn: hn,
//                             //             inputHn: inputHn,
//                             //             age: age,
//                             //           ));
//                             //   // MaterialPageRoute route = MaterialPageRoute(

//                             //   //     builder: (value) => Internaldetail(
//                             //   //           getDepartment: getDepartments[index],
//                             //   //           // ptname: ptname,
//                             //   //           // cid: cid,
//                             //   //           // hn: hn,
//                             //   //           // age: age,
//                             //   //         ));
//                             //   Navigator.push(context, route);
//                             // },
//                             child: Container(
//                               height: 76.0,
//                               width: MediaQuery.of(context).size.width,
//                               padding: EdgeInsets.symmetric(horizontal: 10.0),
//                               child: Row(
//                                 children: [
//                                   Text(
//                                      getrX[0]
//                                                   .data[0]
//                                                   .dataPharmacy[index]
//                                                   .pharmacyDrugName,
//                                     style: GoogleFonts.kanit(
//                                       fontSize: 28.0,
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                     textAlign: TextAlign.center,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//     Future<Null> findDepartmentList() async {
//     var url = Uri.parse(
//         "http://q.chainathospital.org/node/api/get_service_list/$servicegroupid");
//     try {
//       final http.Response response = await http.Client().get(
//         url,
//       );
//       print('res = $response');
//       var result = json.decode(response.body);
//       print('result = $result');
//       for (var map in result) {
//         GetserviceList getserviceList = GetserviceList.fromJson(map);

//         setState(() {
//           getsevices.add(getserviceList);
//         });
//       }
//     } catch (e) {}
//   }

//   Future checkService(id) async {
//     var url =
//         Uri.parse("http://q.chainathospital.org/node/api/get_service_list/$id");
//     try {
//       final http.Response response = await http.get(
//         url,
//       );
//       print('res = $response');
//       var result = json.decode(response.body);
//       print('result = $result');
//       for (var map in result) {
//         GetserviceList getserviceList = GetserviceList.fromJson(map);
//         service = getserviceList.serviceName;
//         serviceId = (getserviceList.serviceid);

         
//           print("************checkService/////////////////////////////////////");
//         print("************checkService$service");
//         print("************checkService$serviceId");
//       }
//     } catch (e) {}
//   }
// }
