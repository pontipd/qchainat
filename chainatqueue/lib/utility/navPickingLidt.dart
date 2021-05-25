// import 'dart:ffi';

// import 'package:chainatqueue/screens/homepage.dart';
// import 'package:chainatqueue/screens/menu.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';


// class NavPicking extends StatefulWidget {
//   NavPicking({Key key}) : super(key: key);

//   @override
//   _NavPickingState createState() => _NavPickingState();
// }

// class _NavPickingState extends State<NavPicking> {
//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       shape: CircularNotchedRectangle(),
//       notchMargin: 0.0,
//       color: Colors.transparent,
//       elevation: 9.0,
//       clipBehavior: Clip.antiAlias,
//       child: Container(
//         height: 70.0,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color(
//                 0xff0baabd,
//               ),
//               Color(
//                 0x132af4,
//               ),
//             ],
//             stops: [
//               1,
//               1,
//             ],
//           ),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             Container(
//               height: 50.0,
//               width: MediaQuery.of(context).size.width / 2 - 40.0,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   Column(
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           MaterialPageRoute route =
//                               MaterialPageRoute(builder: (value) => Menu());
//                             Navigator.push(context, route);
//                         },
//                         child: Icon(
//                           Icons.menu,
//                           color: Colors.white,
//                         ),
//                       ),
//                       Text(
//                         "เมนู",
//                         style: GoogleFonts.prompt(
//                             color: Colors.white, fontSize: 16.0),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//             Container(
//               height: 50.0,
//               width: MediaQuery.of(context).size.width / 2 - 40.0,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Column(
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           _deleteMadalBottonSheet(context);
//                           // MaterialPageRoute route = MaterialPageRoute(
//                           //     builder: (value) => TakePictureCar());
//                           // Navigator.push(context, route);
//                         },
//                         child: Icon(
//                           Icons.delete,
//                           color: Colors.white,
//                         ),
//                       ),
//                       Text(
//                         "ยกเลิก",
//                         style: GoogleFonts.prompt(
//                             color: Colors.white, fontSize: 16.0),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Void _deleteMadalBottonSheet(context) {
//     showModalBottomSheet(
//         context: context,
//         builder: (BuildContext bc) {
//           return Container(
//             height: MediaQuery.of(context).size.height * 0.47,
//             child: Column(
//               children: <Widget>[
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height * 0.12,
//                   color: Colors.red,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Text(
//                         'ยกเลิกการนำส่งเศษเหล็ก',
//                         style: GoogleFonts.prompt(
//                             fontSize: 28.0, color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                     width: MediaQuery.of(context).size.width,
//                     margin: new EdgeInsets.symmetric(horizontal: 20.0),
//                     child: Column(
//                       children: [
//                         Padding(
//                             padding: EdgeInsets.only(left: 20.0, top: 40.0)),
//                         Text(
//                           "สถานที่การจัดส่ง : [ชื่อโรงงาน] ",
//                           style: GoogleFonts.prompt(
//                             color: Color(
//                               0xff1324c3,
//                             ),
//                             fontSize: 22,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                         Container(
//                           child: Column(
//                             children: [
//                               Row(
//                                 children: [
//                                   Padding(
//                                       padding: EdgeInsets.only(
//                                           left: 50.0, top: 50.0)),
//                                   Text(
//                                     "วันที่ : [วันที่] ",
//                                     style: GoogleFonts.prompt(
//                                       color: Color(
//                                         0xff1324c3,
//                                       ),
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 14,
//                                   ),
//                                   Text(
//                                     "เวลา : [เวลา] ",
//                                     style: GoogleFonts.prompt(
//                                       color: Color(
//                                         0xff1324c3,
//                                       ),
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ),

//                                   /// stack requires empty non positioned widget to work properly. refer: https://github.com/flutter/flutter/issues/49631#issuecomment-582090992
//                                   Container(),
//                                 ],
//                               ),
//                               Padding(padding: EdgeInsets.only(top: 0.0)),
//                               Divider(
//                                 height: 15,
//                                 thickness: 1.5,
//                                 color: Color(
//                                   0xff1324c3,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     )),
//                 Padding(padding: EdgeInsets.only(top: 20.0)),
//                 Container(
//                     margin: new EdgeInsets.symmetric(horizontal: 30.0),
//                     child: Center(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           Container(
//                             height: 50.0,
//                             child: RaisedButton(
//                               onPressed: () {
//                                 Navigator.pop(context);
//                               },
//                               child: Row(
//                                 children: [
//                                   Icon(
//                                     Icons.navigate_before,
//                                     color: Colors.grey[600],
//                                   ),
//                                   Text(
//                                     'ย้อนกลับ  ',
//                                     style: GoogleFonts.prompt(
//                                       fontSize: 16.0,
//                                       color: Color(
//                                         0xff727876,
//                                       ),
//                                     ),
//                                     textAlign: TextAlign.center,
//                                   ),
//                                 ],
//                               ),
//                               color: Colors.white,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: new BorderRadius.circular(99.0),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             height: 50.0,
//                             child: RaisedButton(
//                               onPressed: () {
//                                 MaterialPageRoute route = MaterialPageRoute(
//                                     builder: (value) => HomePage());
//                                 Navigator.push(context, route);
//                               },
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     '   ยกเลิก',
//                                     style: GoogleFonts.prompt(
//                                         fontSize: 16.0, color: Colors.white),
//                                     textAlign: TextAlign.center,
//                                   ),
//                                   Icon(
//                                     Icons.navigate_next,
//                                     color: Colors.green[200],
//                                   ),
//                                 ],
//                               ),
//                               color: Color(
//                                 0xff1a73e9,
//                               ),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: new BorderRadius.circular(99.0),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     )),
//               ],
//             ),
//           );
//         });
//   }
// }
