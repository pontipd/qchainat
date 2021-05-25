// import 'dart:convert';
// import 'package:chainatqueue/screens/page1.dart';
// import 'package:chainatqueue/screens/page2.dart';
// import 'package:chainatqueue/screens/page3.dart';
// import 'package:chainatqueue/screens/picup.dart';
// import 'package:chainatqueue/screens/queue.dart';
// import 'package:chainatqueue/screens/startouse.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert' as convert;
// import 'package:chainatqueue/models/getrx.dart';
// import 'package:chainatqueue/screens/appointmentdetil.dart';
// import 'package:chainatqueue/screens/germedicinedetil.dart';
// import 'package:chainatqueue/utility/buttom_bar.dart';
// import 'package:chainatqueue/utility/main_drawer.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// int selectedPage = 0;
//   final _pageOptions = [Page1(), Queue(),Havemedicine(), Page3(),Page2()];
// class Havemedicine extends StatefulWidget {
//   final String hn, ptname, cid, age, pt, inputHn, rxID;

//   final getData;

//   Havemedicine({
//     Key key,
//     this.hn,
//     this.rxID,
//     this.age,
//     this.getData,
//     this.cid,
//     this.inputHn,
//     this.ptname,
//     this.pt,
//   }) : super(key: key);

//   @override
//   _HavemedicineState createState() => _HavemedicineState();
// }

// class _HavemedicineState extends State<Havemedicine> {
//   String hn, ptname, displayname, cid, age, pt, inputHn, rxID;
//   set floatingActionButton(Container floatingActionButton) {}
//   List<GetRx> getrX = List();

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     finddisplay();
//     findUser();
//     Map<String, dynamic> _map = {
//       "hn": "${widget.inputHn}",
//     "date_start":"2021-03-05",
//     "date_end":"2021-03-05"
//     };
//     var json = jsonEncode(_map);
//     medList(http.Client(), json);
//     var rxId = "${widget.rxID}";
//     print(rxId);
//   }

//   Future<Null> findUser() async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     setState(() {
//       hns = preferences.getString('hn');
//       surname = preferences.getString('sername');
//       username = preferences.getString('name');

//       print('##hhhhhhh33333 = $username');
//     });
//   }

//   Future<Null> finddisplay() async {
//     await Firebase.initializeApp().then((value) async {
//       await FirebaseAuth.instance.authStateChanges().listen((event) {
//         inputHn = event.displayName;

//         print('##33333 = $inputHn');
//       });
//     });
//   }

//   Future<Null> medList(http.Client client, var json) async {
//     var url =
//         Uri.parse('http://chainathospital.org/coreapi/api/v2/get_rx_list');
//     try {
//       final response = await client.post(url,
//           headers: {"Content-Type": "application/json"}, body: json);
//       var getRxx = jsonDecode(response.body);
//       GetRx getRx = GetRx.fromJson(convert.jsonDecode(response.body));
//       print(getRx.data[0].dataPharmacy[0].pharmacyDrugName);
//       for (var i = 0; i < getRx.data[0].dataPharmacy.length; i++) {
//         setState(() {
//           getrX.add(getRx);
//         });
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
//   // Future<Null> checkrxTye(http.Client client, var json) async {
//   //   var url =
//   //       Uri.parse('http://chainathospital.org/coreapi/api/v2/get_rx_list');
//   //   try {
//   //     final response = await client.post(url,
//   //         headers: {"Content-Type": "application/json"}, body: json);
//   //     var getData = jsonDecode(response.body);
//   //     // print(getData);
//   //     print(inputHn);
//   //     GetRx getRx = GetRx.fromJson(convert.jsonDecode(response.body));

//   //     // if (getData['status']) {
//   //     //   if (getRx.data[0].rxType == '2') {
//   //     //     MaterialPageRoute route =
//   //     //         MaterialPageRoute(builder: (value) => Havemedicine());
//   //     //     Navigator.push(context, route);
//   //     //   } else {
//   //     //     MaterialPageRoute route =
//   //     //         MaterialPageRoute(builder: (value) => Getmedicine());
//   //     //     Navigator.push(context, route);
//   //     //   }
//   //     // }
//   //   } catch (e) {}
//   // }

//   @override
//   Widget build(BuildContext context) {
//     // var getData = widget.getData;
//     // print('sssssss $getData');
//     var rxId = "${widget.rxID}";
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(60.0),
//         // here the desired height
//         child: AppBar(
//           backgroundColor: Color(
//             0xff089EAD,
//           ),
//            title: Text(
//             "โรงพยาบาลชัยนาทนเรนทร",
//             style: GoogleFonts.kanit(fontSize: 22.0, color: Colors.white),
//             textAlign: TextAlign.center,
//           ),
//           actions: <Widget>[
//             Container(
//               width: 60.0,
//               child: Align(
//                 alignment: Alignment.center,
//                 child: Image.asset(
//                   'images/person.png',
//                   color: Colors.white,
//                   width: 70.0,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//       drawer: MainDrawer(),
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Container(
//           width: MediaQuery.of(context).size.width * 0.90,
//           height: MediaQuery.of(context).size.height,
//           child: SingleChildScrollView(
//             child: Container(
//               width: MediaQuery.of(context).size.width * 0.90,
//               child: Column(
//                 children: <Widget>[
//                   Padding(padding: EdgeInsets.only(top: 10.0)),
//                   SizedBox(
//                     height: 10.0,
//                   ),
//                   SizedBox(
//                     child: Text(
//                       "รับยาใกล้บ้าน",
//                       style: GoogleFonts.kanit(
//                         fontSize: 24.0,
//                         color: Color(
//                           0xff089EAD,
//                         ),
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                     width: 450,
//                   ),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                   SizedBox(
//                     child: Text(
//                       "ข้อมูล ณ วันที่ 12 ก.พ. 2564 เวลา 12.00 น.",
//                       style: GoogleFonts.kanit(
//                         fontSize: 16.0,
//                         color: Color(
//                           0xff828282,
//                         ),
//                         fontWeight: FontWeight.w400,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     width: 450,
//                   ),
//                   SizedBox(
//                     height: 7,
//                   ),
//                   // Divider(
//                   //   height: 15,
//                   //   thickness: 1.0,
//                   //   color: Color(
//                   //     0xfff828282,
//                   //   ),
//                   // ),
//                   // SizedBox(
//                   //   height: 20.0,
//                   // ),

//                   Container(
//                     width: MediaQuery.of(context).size.width * 0.95,
//                     child: ListView.builder(
//                       itemCount: getrX.length,
//                       shrinkWrap: true,
//                       itemBuilder: (BuildContext context, i) => Container(
//                         width: MediaQuery.of(context).size.width * .95,
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 10.0, vertical: 1.0),
//                         child: Card(
//                           color: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(5.0),
//                           ),
//                           child: Container(
//                             width: MediaQuery.of(context).size.width,
//                             child: Column(
//                               children: [
//                                 Row(
//                                   children: [
//                                     Padding(
//                                         padding: EdgeInsets.only(top: 45.0)),
//                                     Align(
//                                       alignment: Alignment.topLeft,
//                                       child: Row(
//                                         children: [
//                                           Text(
//                                             " สถานที่รับยา : ",
//                                             style: TextStyle(
//                                               color: Color(
//                                                 0xff666666,
//                                               ),
//                                               fontSize: 16.0,
//                                               fontWeight: FontWeight.w400,
//                                               fontFamily: "Kanit",
//                                             ),
//                                           ),
//                                           Text(
//                                             getrX[0]
//                                                         .data[i]
//                                                         .dataPharmacy[i]
//                                                         .pharmacyDrugName ==
//                                                     null
//                                                 ? " "
//                                                 : getrX[0]
//                                                     .data[0]
//                                                     .dataPharmacy[i]
//                                                     .pharmacyDrugName,
//                                             style: TextStyle(
//                                               color: Color(
//                                                 0xff666666,
//                                               ),
//                                               fontSize: 16.0,
//                                               fontWeight: FontWeight.w400,
//                                               fontFamily: "Kanit",
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     // SizedBox(
//                                     //   child: Icon(
//                                     //     Icons.delete_outline,
//                                     //     size: 30,
//                                     //   ),
//                                     //   width:
//                                     //       MediaQuery.of(context).size.width - 392.0,
//                                     // ),
//                                   ],
//                                 ),

//                                 // Icon(Icons.date_range_outlined),
//                                 Container(
//                                   width:
//                                       MediaQuery.of(context).size.width * 0.85,
//                                   child: Divider(
//                                       height: 10,
//                                       thickness: 1.25,
//                                       color: Colors.grey[400]),
//                                 ),
//                                 Padding(padding: EdgeInsets.only(top: 7.0)),
//                                 Row(
//                                   children: [
//                                     Column(
//                                       children: [
//                                         Align(
//                                           alignment: Alignment.topLeft,
//                                           child: Row(
//                                             children: [
//                                               Text(
//                                                 " เลขที่ใบสั่งยา : ",
//                                                 style: TextStyle(
//                                                   color: Color(
//                                                     0xff666666,
//                                                   ),
//                                                   fontSize: 16.0,
//                                                   fontWeight: FontWeight.w400,
//                                                   fontFamily: "Kanit",
//                                                 ),
//                                               ),
//                                               Text(
//                                                 getrX[0].data[i].rxOperatorId ==
//                                                         null
//                                                     ? " "
//                                                     : getrX[0]
//                                                         .data[i]
//                                                         .rxOperatorId,
//                                                 style: TextStyle(
//                                                   color: Color(
//                                                     0xff666666,
//                                                   ),
//                                                   fontSize: 16.0,
//                                                   fontWeight: FontWeight.w400,
//                                                   fontFamily: "Kanit",
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         Align(
//                                           alignment: Alignment.topLeft,
//                                           child: Row(
//                                             children: [
//                                               Text(
//                                                 " วันที่ : ",
//                                                 style: TextStyle(
//                                                   color: Color(
//                                                     0xff666666,
//                                                   ),
//                                                   fontSize: 16.0,
//                                                   fontWeight: FontWeight.w400,
//                                                   fontFamily: "Kanit",
//                                                 ),
//                                               ),
//                                               Text(
//                                                 getrX[0]
//                                                             .data[i].date
//                                                              ==
//                                                         null
//                                                     ? " "
//                                                     :  getrX[0]
//                                                             .data[i].date,
//                                                 style: TextStyle(
//                                                   color: Color(
//                                                     0xff666666,
//                                                   ),
//                                                   fontSize: 16.0,
//                                                   fontWeight: FontWeight.w400,
//                                                   fontFamily: "Kanit",
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         Align(
//                                           alignment: Alignment.topLeft,
//                                           child: Row(
//                                             children: [
//                                               Text(
//                                                 " แพทย์สั่งยา : ",
//                                                 style: TextStyle(
//                                                   color: Color(
//                                                     0xff666666,
//                                                   ),
//                                                   fontSize: 16.0,
//                                                   fontWeight: FontWeight.w400,
//                                                   fontFamily: "Kanit",
//                                                 ),
//                                               ),
//                                               Text(
//                                                 getrX[0]
//                                                             .data[i]
//                                                             .doctorName ==
//                                                         null
//                                                     ? " "
//                                                     : getrX[0]
//                                                             .data[i]
//                                                             .doctorName,
//                                                 style: TextStyle(
//                                                   color: Color(
//                                                     0xff666666,
//                                                   ),
//                                                   fontSize: 16.0,
//                                                   fontWeight: FontWeight.w400,
//                                                   fontFamily: "Kanit",
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         Align(
//                                           alignment: Alignment.topLeft,
//                                           child: Row(
//                                             children: [
//                                               Text(
//                                                 " แผนกคลินิก : ",
//                                                 style: TextStyle(
//                                                   color: Color(
//                                                     0xff666666,
//                                                   ),
//                                                   fontSize: 16.0,
//                                                   fontWeight: FontWeight.w400,
//                                                   fontFamily: "Kanit",
//                                                 ),
//                                               ),
//                                               Text(
//                                                 getrX[0]
//                                                             .data[0]
//                                                             .dataPharmacy[i]
//                                                             .pharmacyDrugName ==
//                                                         null
//                                                     ? " "
//                                                     : getrX[0]
//                                                         .data[0]
//                                                         .dataPharmacy[i]
//                                                         .pharmacyDrugName,
//                                                 style: TextStyle(
//                                                   color: Color(
//                                                     0xff666666,
//                                                   ),
//                                                   fontSize: 16.0,
//                                                   fontWeight: FontWeight.w400,
//                                                   fontFamily: "Kanit",
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     // Column(children: [
//                                     //  SizedBox(
//                                     //         child: Divider(
//                                     //   height: 10,
//                                     //   thickness: 1.25,
//                                     //   color: Colors.grey[400]
//                                     //   ),
//                                     //  ),
//                                     // ],),
//                                   ],
//                                 ),
//                                 Row(
//                                   children: [
//                                     Padding(
//                                         padding: EdgeInsets.only(top: 45.0)),
//                                     InkWell(
//                                       onTap: () {
//                                         MaterialPageRoute route =
//                                             MaterialPageRoute(
//                                                 builder: (value) =>
//                                                     Havemedicinedetail());
//                                         Navigator.push(context, route);
//                                       },
//                                       child: SizedBox(
//                                         child: Text(
//                                           'ดูรายละเอียด',
//                                           // "$departmentName",
//                                           style: TextStyle(
//                                             color: Color(
//                                               0xff219653,
//                                             ),
//                                             fontSize: 16.0,
//                                             fontWeight: FontWeight.w400,
//                                             fontFamily: "Kanit",
//                                           ),

//                                           textAlign: TextAlign.right,
//                                         ),
//                                         width: 240,
//                                       ),
//                                     ),
//                                     // SizedBox(
//                                     //   child: Icon(
//                                     //     Icons.delete_outline,
//                                     //     size: 30,
//                                     //   ),
//                                     //   width:
//                                     //       MediaQuery.of(context).size.width - 392.0,
//                                     // ),
//                                   ],
//                                 ),
//                                 // Padding(padding: EdgeInsets.only(top: 7.0)),
//                                 SizedBox(
//                                   height: 20.0,
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 180.0,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomBar(),
//     );
//   }
// }
