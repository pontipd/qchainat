// import 'dart:ffi';

// import 'package:chainatqueue/screens/login.dart';
// import 'package:chainatqueue/screens/profile.dart';
// import 'package:chainatqueue/screens/resetPassword.dart';
// import 'package:chainatqueue/utility/my_style.dart';
// import 'package:chainatqueue/utility/navbar.dart';
// import 'package:chainatqueue/utility/navbarmanu.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class HomePage extends StatefulWidget {
//   HomePage({Key key}) : super(key: key);
  

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//        width: MediaQuery.of(context).size.width * 0.95,
//       height: MediaQuery.of(context).size.height,
//       child: Scaffold(
//          key: _scaffoldKey,
//         // appBar: AppBar(
//           //  backgroundColor: Color(
//           //   0xff089EAD,
            
//           // ),
//         // 
//            appBar: PreferredSize(
//           preferredSize: Size.fromHeight(60.0), 
//           // here the desired height
//           child: AppBar(
            
//               backgroundColor: Color(
//             0xff089EAD,
          
//           ),
        
//           title: Text(
//                 'App Name',
//                 style: GoogleFonts.kanit(fontSize: 24.0, color: Colors.white),
//                 textAlign: TextAlign.center,

//               ),
//           actions: <Widget>[
//             Container(
//                                     width: 150.0,
//                                     child: Align(
//                                       alignment: Alignment.topRight,
//                                       child: Image.asset(
//                                         'images/person.png',
//                                         color: Colors.white,
//                                         width: 70.0,
//                                       ),
//                                     ),
//                                   )
//           ],
//         ),
//            ),
        
        
//         drawer: Container(
//          width: MediaQuery.of(context).size.width * 0.95,
//         height: MediaQuery.of(context).size.height,
//           child: Drawer(

//             // child: Column(mainAxisAlignment: MainAxisAlignment.end,
//             //   children: [
//             //     ListTile(tileColor: MyStyle().wrColor,
//             //       leading: Icon(
//             //         Icons.exit_to_app,
//             //         color: Colors.grey[600],
//             //         size: 24.0,
//             //       ),
//             //       title:MyStyle().titleH4('ออกจากระะบบ'),
//             //     ),
//             //   ],
//             // ),
//             //  child: SingleChildScrollView(
//               child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.max,
                
//                 children: <Widget>[
//                   MyStyle().bar(),
//                   Container(
//                     width: MediaQuery.of(context).size.width * 0.9,
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             IconButton(
//                                 icon: Icon(Icons.arrow_back),
//                                 onPressed: () {
//                                   Navigator.pop(context);
//                                 }),
//                             SizedBox(
//                               width: 15.0,
//                             ),
//                             Text(
//                               'ตั้งค่าการทำงาน',
//                               style: GoogleFonts.prompt(
//                                 fontSize: 20.0,
//                                 color: Colors.grey[600],
//                               ),
//                             ),
//                           ],
//                         ),
//                         Padding(padding: EdgeInsets.only(top: 20.0)),
//                         profile(),
//                         Padding(padding: EdgeInsets.only(top: 10.0)),
//                         password(),
//                         Padding(padding: EdgeInsets.only(top: 10.0)),
//                         pin(),
//                         Padding(padding: EdgeInsets.only(top: 10.0)),
//                         notifications(),
//                         Padding(padding: EdgeInsets.only(top: 10.0)),
//                         logOut(),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//         ),
//         //  bottomNavigationBar: Navbarmanu(),
//       ),
      
//     );
//   }
//   Widget logOut() {
//     return Container(
//         margin: new EdgeInsets.symmetric(horizontal: 10.0),
//         width: MediaQuery.of(context).size.width,
//         height: 60.0,
//         child: RaisedButton(
//           onPressed: () async {
//             await Firebase.initializeApp().then((value) async {
//               await FirebaseAuth.instance.signOut().then((value) =>
//                   Navigator.pushNamedAndRemoveUntil(
//                       context, '/login', (route) => false));
//             });
//           },
          
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'ออกจกระบบ',
//                 style:
//                     GoogleFonts.prompt(fontSize: 18.0, color: Colors.grey[600]),
//                 textAlign: TextAlign.center,
//               ),
//               Icon(
//                 Icons.exit_to_app,
//                 color: Colors.grey[600],
//               )
//             ],
//           ),
//           color: Colors.white,
//           shape: RoundedRectangleBorder(
//             side: BorderSide(
//                 color: Colors.blue[900], width: 1, style: BorderStyle.solid),
//             borderRadius: new BorderRadius.circular(10.0),
//           ),
//         ));
//   }

//   Widget notifications() {
//     return Container(
//         margin: new EdgeInsets.symmetric(horizontal: 10.0),
//         width: MediaQuery.of(context).size.width,
//         height: 60.0,
//         child: RaisedButton(
//           onPressed: () {
//             // MaterialPageRoute route =
//             //     MaterialPageRoute(builder: (value) => Login());
//             // Navigator.push(context, route);
//           },
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 ' การแจ้งเตือน',
//                 style:
//                     GoogleFonts.prompt(fontSize: 18.0, color: Colors.grey[600]),
//                 textAlign: TextAlign.center,
//               ),
//               Icon(
//                 Icons.notifications,
//                 color: Colors.grey[600],
//               )
//             ],
//           ),
//           color: Colors.white,
//           shape: RoundedRectangleBorder(
//             side: BorderSide(
//                 color: Colors.blue[900], width: 1, style: BorderStyle.solid),
//             borderRadius: new BorderRadius.circular(10.0),
//           ),
//         ));
//   }

//   Widget pin() {
//     return Container(
//         margin: new EdgeInsets.symmetric(horizontal: 10.0),
//         width: MediaQuery.of(context).size.width,
//         height: 60.0,
//         child: RaisedButton(
//           onPressed: () {
//             // MaterialPageRoute route =
//             //     MaterialPageRoute(builder: (value) => Login());
//             // Navigator.push(context, route);
//           },
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'เปลี่ยน PIN',
//                 style:
//                     GoogleFonts.prompt(fontSize: 18.0, color: Colors.grey[600]),
//                 textAlign: TextAlign.center,
//               ),
//               Icon(
//                 Icons.screen_lock_portrait,
//                 color: Colors.grey[600],
//               )
//             ],
//           ),
//           color: Colors.white,
//           shape: RoundedRectangleBorder(
//             side: BorderSide(
//                 color: Colors.blue[900], width: 1, style: BorderStyle.solid),
//             borderRadius: new BorderRadius.circular(10.0),
//           ),
//         ));
//   }

//   Widget password() {
//     return Container(
//         margin: new EdgeInsets.symmetric(horizontal: 10.0),
//         width: MediaQuery.of(context).size.width,
//         height: 60.0,
//         child: RaisedButton(
//           onPressed: () {
//             MaterialPageRoute route =
//                 MaterialPageRoute(builder: (value) => RePassword());
//             Navigator.push(context, route);
//           },
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'เปลี่ยนรหัสผ่าน',
//                 style:
//                     GoogleFonts.prompt(fontSize: 18.0, color: Colors.grey[600]),
//                 textAlign: TextAlign.center,
//               ),
//               Icon(
//                 Icons.lock,
//                 color: Colors.grey[600],
//               )
//             ],
//           ),
//           color: Colors.white,
//           shape: RoundedRectangleBorder(
//             side: BorderSide(
//                 color: Colors.blue[900], width: 1, style: BorderStyle.solid),
//             borderRadius: new BorderRadius.circular(10.0),
//           ),
//         ));
//   }

//   Widget profile() {
//     return Container(
//         margin: new EdgeInsets.symmetric(horizontal: 10.0),
//         width: MediaQuery.of(context).size.width,
//         height: 60.0,
//         child: RaisedButton(
//           onPressed: () {
//             MaterialPageRoute route =
//                 MaterialPageRoute(builder: (value) => Profile());
//             Navigator.push(context, route);
//           },
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'ข้อมูลส่วนตัว',
//                 style:
//                     GoogleFonts.prompt(fontSize: 18.0, color: Colors.grey[600]),
//                 textAlign: TextAlign.center,
//               ),
//               Icon(
//                 Icons.person,
//                 color: Colors.grey[600],
//               )
//             ],
//           ),
//           color: Colors.white,
//           shape: RoundedRectangleBorder(
//             side: BorderSide(
//                 color: Colors.blue[900], width: 1, style: BorderStyle.solid),
//             borderRadius: new BorderRadius.circular(10.0),
//           ),
//         ),
//         );
//   }

  
// }
