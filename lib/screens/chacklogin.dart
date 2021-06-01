// import 'package:chainatqueue/screens/create_account.dart';
// import 'package:chainatqueue/screens/regitster.dart';

// import 'package:chainatqueue/utility/my_style.dart';

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'login.dart';

// class CheckLogin extends StatefulWidget {
//   CheckLogin({Key key}) : super(key: key);

//   @override
//   _CheckLoginState createState() => _CheckLoginState();
// }

// class _CheckLoginState extends State<CheckLogin> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           width: MediaQuery.of(context).size.width * 0.85,
//           height: MediaQuery.of(context).size.height,
//           child: SingleChildScrollView(
//             child: Container(
//               width: MediaQuery.of(context).size.width * 0.85,
//               child: Column(
//                 children: <Widget>[
//                   Padding(padding: EdgeInsets.only(top: 30.0)),
//                   Row(
//                     children: <Widget>[
//                       IconButton(
//                           icon: Icon(Icons.navigate_before),
//                           iconSize: 36.0,
//                           color: Color(
//                             0xff828282,
//                           ),
//                           onPressed: () {
//                             Navigator.pop(context);
//                           }),
//                       Text(
//                         'ลงทะเบียน',
//                         style: GoogleFonts.prompt(
//                           fontSize: 24.0,
//                           color: Color(
//                             0xff089EAD,
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 25.0,
//                   ),
//                   SizedBox(
//                     child: Text(
//                       "  เลขที่บัตรประชาชน/เลขที่ HN ",
//                       style: GoogleFonts.kanit(
//                         fontSize: 18.0,
//                         color: Color(
//                           0xff089EAD,
//                         ),
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                     width: 500,
//                   ),
//                   SizedBox(
//                     height: 7,
//                   ),
//                   Divider(
//                     height: 15,
//                     thickness: 1.0,
//                     color: Color(
//                       0xff828282,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10.0,
//                   ),
//                   Padding(padding: EdgeInsets.only(top: 20.0)),
//                   mmailForm(),
//                   Padding(padding: EdgeInsets.only(top: 30.0)),
//                   button(),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget button() {
//     return Container(
//         margin: new EdgeInsets.symmetric(horizontal: 0.0),
//         width: MediaQuery.of(context).size.width,
//         child: Center(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Container(
//                 height: 50.0,
//                 child: RaisedButton(
//                   onPressed: () {
//                     showDialog(
//                       context: context,
//                       builder: (context) => SimpleDialog(
//                         title: Container(
//                           width: 440.0,
//                           height: 240.0,
//                           child: SingleChildScrollView(
//                             child: Container(
//                               // width: MediaQuery.of(context).size.width * 0.85,
//                               width: 440.0,
//                               child: Column(
//                                 children: <Widget>[
//                                   Text(
//                                     "นายพุทธิพงษ์ คาดสนิท",
//                                     style: GoogleFonts.prompt(
//                                       color: Color(
//                                         0xff089EAD,
//                                       ),
//                                       fontSize: 22,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                     textAlign: TextAlign.center,
//                                   ),
//                                   Divider(
//                                     height: 15,
//                                     thickness: 1.0,
//                                     color: Color(
//                                       0xffF6F6F6,
//                                     ),
//                                   ),
//                                   Text(
//                                     "\nHN 000000000\nเกิดวันที่ 31 ตุลาคม 2520",
//                                     style: GoogleFonts.prompt(
//                                       color: Colors.grey[04],
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                     textAlign: TextAlign.center,
//                                   ),
//                                   SizedBox(
//                                     height: 20.0,
//                                   ),
//                                   Container(
//                                     width: MediaQuery.of(context).size.width *
//                                         0.85,
//                                     height: 15.0,
//                                   ),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceAround,
//                                     children: <Widget>[
//                                       Container(
//                                         width: 115.0,
//                                         height: 53.0,
//                                         child: RaisedButton(
//                                           color: MyStyle().prinaryColor,
//                                           shape: RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(3.0)),
//                                           onPressed: () {},
//                                           child: Text(
//                                             'ย้อนกลับ',
//                                             style: GoogleFonts.kanit(
//                                               fontSize: 22.0,
//                                               color: Colors.white,
//                                             ),
//                                             textAlign: TextAlign.center,
//                                           ),
//                                         ),
//                                       ),
//                                       Container(
//                                         width: 115.0,
//                                         height: 53.0,
//                                         child: RaisedButton(
//                                           color: MyStyle().prinaryColor,
//                                           shape: RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(3.0)),
//                                           onPressed: () {
//                                             MaterialPageRoute route =
//                                                 MaterialPageRoute(
//                                                     builder: (value) =>
//                                                         Register());
//                                             Navigator.push(context, route);
//                                           },
//                                           child: Text(
//                                             'ต่อไป',
//                                             style: GoogleFonts.kanit(
//                                               fontSize: 22.0,
//                                               color: Colors.white,
//                                             ),
//                                             textAlign: TextAlign.center,
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * 0.76,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           'ตรวจสอบข้อมูล ',
//                           style: GoogleFonts.prompt(
//                             color: Colors.white,
//                             fontSize: 21.0,
//                             fontWeight: FontWeight.w400,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                         SizedBox(width: 30.0),
//                         // Icon(
//                         //   Icons.mail,
//                         //   color: Colors.white,
//                         // ),
//                       ],
//                     ),
//                   ),
//                   color: Color(
//                     0xff089EAD,
//                   ),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: new BorderRadius.circular(7.0),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }

//   mmailForm() => Container(
//         margin: new EdgeInsets.symmetric(horizontal: 0.0),
//         width: MediaQuery.of(context).size.width,
//         height: 50.0,
//         child: TextField(
//           // onChanged: (value) => user = value.trim(),
//           decoration: InputDecoration(
//             // prefixIcon: Icon(
//             //   Icons.account_box,
//             //   color: MyStyle().darkColor,
//             // ),
//             labelStyle:
//                 GoogleFonts.prompt(fontSize: 16.0, color: Colors.grey[600]),
//             labelText: '',
//             enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                 borderSide: BorderSide(color: Colors.grey[300])),
//             focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.grey[300])),
//           ),
//         ),
//         color: Colors.grey[100],
//       );
// }
