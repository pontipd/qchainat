
// import 'package:chainatqueue/screens/chacklogin.dart';
// import 'package:chainatqueue/screens/check.dart';
// import 'package:chainatqueue/utility/my_style.dart';
// import 'ok.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';






// class Loginn extends StatefulWidget {
//   Loginn({Key key}) : super(key: key);
  

//   @override
//   _LoginnState createState() => _LoginnState();
  
// }

// class _LoginnState extends State<Loginn> {
//     double screen;
//   @override
//   Widget build(BuildContext context) {
//      screen = MediaQuery.of(context).size.width;
//     print('screen =$screen');
//     return Scaffold(
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color(
//                 0x21992e9,
//               ),
//               Colors.blue[200],
//             ],
//             stops: [
//               0.8,
//               1,
//             ],
//           ),
//         ),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               Padding(padding: EdgeInsets.only(top: 80.0)),
              
                           
//                             nameSystem(),
//                              showLogo(),
//                             Padding(padding: EdgeInsets.only(top: 40.0)),
//                             login(),
//                             Padding(padding: EdgeInsets.only(top: 10.0)),
//                             usernameForm(),
//                             Padding(padding: EdgeInsets.only(top: 15.0)),
//                             passwordForm(),
//                             Padding(padding: EdgeInsets.only(top: 15.0)),
//                             checkprofile(),
//                             // Rember(),
//                             Padding(padding: EdgeInsets.only(top: 5.0)),
//                             loginButton(),
//                             Padding(padding: EdgeInsets.only(top: 15.0)),
//                             or(),
//                             SizedBox(
//                               height: 10.0,
//                             ),
//                             regitsterButton(),
//                             SizedBox(
//                               height: 25.0,
//                             ),
//                            Ok(),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 }
              
   
              
//                 Widget regitsterButton() {
//                   return Container(
//                       margin: new EdgeInsets.symmetric(horizontal: 30.0),
//                       width: MediaQuery.of(context).size.width * 0.85,
//                       height: 50.0,
//                       child: RaisedButton(
//                         onPressed: () {
//                           MaterialPageRoute route =
//                               MaterialPageRoute(builder: (value) =>CheckLogin());
//                           Navigator.push(context, route);
//                         },
//                         child: Text(
//                           'ลงทะเบียน',
//                           style: GoogleFonts.kanit(fontSize: 24.0,  height: 1.5,color: Color(
//                                                   0xff089EAD,
//                                             ),),
//                           textAlign: TextAlign.center,
//                         ),
//                         color: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: new BorderRadius.circular(7.0),
//                         ),
//                       ));
//                 }
              
//                 or() => Container(
//                     margin: new EdgeInsets.symmetric(horizontal: 30.0),
//                     child: Row(children: <Widget>[
//                       Expanded(
//                           child: Divider(
//                         thickness: 1.0,
//                         color: Color(
//                           0xff727876,
//                         ),
//                       )),
//                       Text(
//                         "   หรือ  ",
//                         style: GoogleFonts.kanit(fontSize: 16.0, color: Colors.grey[600]),
//                       ),
//                       Expanded(child: Divider(thickness: 1.0, color: Colors.grey[600])),
//                     ]));
              
//                 checkprofile() => Container(
//                         child: Align(
//                       alignment: Alignment(0.7, -0.7),
//                       child: InkWell(
//                         onTap: () {
//                           MaterialPageRoute route =
//                               MaterialPageRoute(builder: (value) => Checkprofile());
//                           Navigator.push(context, route);
//                         },
//                         child: Text(
//                           "ลืมรหัสผ่าน",
//                           // style: TextStyle(
//                           //   color: Colors.grey[600]),
//                           style: GoogleFonts.kanit(fontSize: 16.0, color: Colors.grey[600]),
//                         ),
//                       ),
//                     ));
//               //  Rember() => Container(
//               //           child: Align(
//               //         alignment: Alignment(0.7, -0.7),
//               //         child: InkWell(
//               //           onTap: () {
//               //             MaterialPageRoute route =
//               //                 MaterialPageRoute(builder: (value) => ForgotPassword());
//               //             Navigator.push(context, route);
//               //           },
//               //           child: Text(
//               //             "จดจำรหัสผ่าน",
//               //             // style: TextStyle(
//               //             //   color: Colors.grey[600]),
//               //             style: GoogleFonts.kanit(fontSize: 16.0, color: Colors.grey[600]),
//               //           ),
//               //         ),
//               //       ));
              
//                 Widget loginButton() {
//                   return Container(
//                       margin: new EdgeInsets.symmetric(horizontal: 30.0),
//                       width: MediaQuery.of(context).size.width * 0.85,
//                       height: 50.0,
//                       child: RaisedButton(
//                         onPressed: () {
//                           MaterialPageRoute route =
//                               MaterialPageRoute(builder: (value) => CheckLogin ());
//                                           Navigator.push(context, route);
                                          
//                                         },
//                                         child: Text(
//                                           'เข้าสู่ระบบ',
//                                           style: GoogleFonts.kanit(
//                                             color: Colors.white,
//                                             fontSize: 24.0,
//                                             fontWeight: FontWeight.w400,
//                                           ),
//                                           textAlign: TextAlign.center,
//                                         ),
//                                         color: Color(
//                                                   0xff089EAD,
//                                             ),
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius: new BorderRadius.circular(7.0),
//                                         ),
//                                       ));
//                                 }
                              
//                                 passwordForm() => Container(
//                                       margin: new EdgeInsets.symmetric(horizontal: 30.0),
//                                       width: MediaQuery.of(context).size.width,
//                                       height: 50.0,
//                                       child: TextField(
//                                         // onChanged: (value) => user = value.trim(),
//                                         decoration: InputDecoration(
//                                           // prefixIcon: Icon(
//                                           //   Icons.account_box,
//                                           //   color: MyStyle().darkColor,
//                                           // ),
//                                           labelStyle: GoogleFonts.kanit(
//                                             color: Colors.grey[600],
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.w400,
//                                           ),
//                                           labelText: 'รหัสผ่าน',
//                                           enabledBorder: OutlineInputBorder(
//                                               borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                                               borderSide: BorderSide(color: Colors.grey[300])),
//                                           focusedBorder: OutlineInputBorder(
//                                               borderSide: BorderSide(color: Colors.grey[300])),
//                                         ),
//                                       ),
//                                       color: Colors.grey[100],
//                                     );
                              
//                                 usernameForm() => Container(
//                                       margin: new EdgeInsets.symmetric(horizontal: 30.0),
//                                       width: MediaQuery.of(context).size.width,
//                                       height: 50.0,
//                                       child: TextField(
//                                         // onChanged: (value) => user = value.trim(),
//                                         decoration: InputDecoration(
//                                           // prefixIcon: Icon(
//                                           //   Icons.account_box,
//                                           //   color: MyStyle().darkColor,
//                                           // ),
//                                           labelStyle: GoogleFonts.kanit(
//                                             color: Colors.grey[600],
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.w400,
//                                           ),
//                                           labelText: 'ชื่อผู้ใช้งาน',
//                                           enabledBorder: OutlineInputBorder(
//                                               borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                                               borderSide: BorderSide(color: Colors.grey[300])),
//                                           focusedBorder: OutlineInputBorder(
//                                               borderSide: BorderSide(color: Colors.grey[300])),
//                                         ),
//                                       ),
//                                       color: Colors.grey[100],
//                                     );
                              
//                                 login() => SizedBox(
//                                       child: Text(
//                                         "เข้าสู่ระบบ",
//                                         style: GoogleFonts.kanit(
//                                           color: Color(
//                                             0xff089ead,
//                                           ),
//                                           fontSize: 18.0,
//                                           fontWeight: FontWeight.w400,
//                                         ),
//                                       ),
//                                       width: 345,
//                                     );
                               
//                                     nameSystem() => SizedBox(
//                                       child: Text(
//                                         "โรงพยาบาลชัยนาทนเรนทร",
//                                         style: GoogleFonts.kanit(
//                                           color: Color(
//                                             0xff089ead,
//                                           ),
//                                           fontSize: 24.0,
//                                           fontWeight: FontWeight.w400,
//                                         ),
//                                         textAlign: TextAlign.center,
//                                       ),
//                                       width: 375,
//                                     );
//                                      showLogo() => Container(
//                                        width: screen * 0.7,
//                                        child: MyStyle().showLogo(),
//                                     );

//                                     showok() => Container(
//                                        width: screen * 0.7,
//                                        child: Ok().showok(),
//                                    );
                              
//                                 // ignore: non_constant_identifier_names
//                                 Authen() {}
              
              

               
              
              
              
// }


