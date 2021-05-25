
// import 'package:chainatqueue/screens/login.dart';
// import 'package:chainatqueue/screens/login1.dart';
// import 'package:chainatqueue/utility/my_style.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class Homee extends StatefulWidget {
//    Homee({Key key}) : super(key: key);
//   @override
//   _HomeeState createState() => _HomeeState();
// }

// class _HomeeState extends State<Homee> {
//    double screen;

//  Widget showLogo() => Container(
//         width: screen * 0.7,
//         child: MyStyle().showapp(),
//       );

// Widget confirmbutton() => Container(
//       margin: new EdgeInsets.symmetric(horizontal: 0.0),
//        width: MediaQuery.of(context).size.width * 0.85,
      
//       child: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
            
//             Container(
//                width: MediaQuery.of(context).size.width * 0.85,
//               height:137.0,
          
             
//               // ignore: deprecated_member_use
//               child: RaisedButton(
// //           onPressed: () {},
// //           child: Row(
//                 onPressed: () {
//                   MaterialPageRoute route =
//                       MaterialPageRoute(builder: (value) =>  Login());
//                   Navigator.push(context, route);
//                 },
//                  child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
// //               Text(
// //     '''1) ลงทะเบียนผู้ใช้งาน
// // login with user name+PW
// // กรณีไม่ตั้งค่า Pin Code''',
// //                 style: GoogleFonts.kanit(
// //                   color: Colors.white,
// //                   fontSize: 21.0,
// //                   height: 1.5,
// //                   fontWeight: FontWeight.w400,
// //                 ),
// //               //  textAlign: TextAlign.center,
// //               ),
//               SizedBox(
//                 width: 1.0,
//               ),
//               // Icon(S
//               //   Icons.mail,
//               //   color: Colors.white,
//               // ),
//             ],
//           ),
//           color: Color(
//                           0xff458DFC,
//                         ),
//           shape: RoundedRectangleBorder(
//             borderRadius: new BorderRadius.circular(2.0),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ));
    
  
// forgotPassword(){}

// Widget longinpin() => Container(
//       margin: new EdgeInsets.symmetric(horizontal: 0.0),
//        width: MediaQuery.of(context).size.width * 0.85,
      
//       child: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
            
//             Container(
//            width: MediaQuery.of(context).size.width * 0.85,
//               height:137.0,
//               // ignore: deprecated_member_use
//               child: RaisedButton(
//                 onPressed: () {
//                   MaterialPageRoute route =
//                       MaterialPageRoute(builder: (value) => Loginn());
//                   Navigator.push(context, route);
//                 },
//                  child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//             Text(
//             '''2) login with Pin Code
// กรณีตั้งค่า Pin Code แล้ว''',
//                 style: GoogleFonts.kanit(
//                   color: Colors.white,
//                   fontSize: 21.0,
//                   height: 1.5,
//                   fontWeight: FontWeight.w400,
//                 ),
//                 // textAlign: TextAlign.center,
//               ),
//            SizedBox(
//                 width: 1.0,
//               ),
//               // Icon(
//               //   Icons.mail,
//               //   color: Colors.white,
//               // ),
//             ],
//           ),
//           color: Color(
//                           0xff458DFC,
//                         ),
//           shape: RoundedRectangleBorder(
//             borderRadius: new BorderRadius.circular(2.0),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ));
  

//   // Widget longinsername() {
//   //   return Container(
//   //       margin: new EdgeInsets.symmetric(horizontal: 30.0),
//   //       width: MediaQuery.of(context).size.width * 0.95,
//   //       height: 137.0,
//   //       child: RaisedButton(
//   //         onPressed: () {
//   //           MaterialPageRoute route =
//   //               MaterialPageRoute(builder: (value) => Login());
//   //           Navigator.push(context, route);
//   //         },
//   //         child: Text(
//   //           '''1) ลงทะเบียนผู้ใช้งาน
//   // longin with user name + PW
//   // กรณีไม่ตั้งค่า Pin Code''',
//   //           style: TextStyle(
//   //             color: Colors.white,
//   //             fontFamily: 'Prompt',
//   //             fontSize: 20.0,
//   //             fontWeight: FontWeight.w400,
//   //           ),
//   //           textAlign: TextAlign.left,
//   //         ),
          
//   //         color: Colors.blue[400],
//   //         shape: RoundedRectangleBorder(
//   //           borderRadius: new BorderRadius.circular(2.0),
//   //         ),
//   //       ));
//   // }

  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//         //      width: MediaQuery.of(context).size.width,
//         // height: MediaQuery.of(context).size.height,
//             children: <Widget>[
//                  showLogo(),
//               confirmbutton(), 
//               SizedBox(
//                 height: 30.0,
//                 ),

//               longinpin(),
              
//               // showAppName(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
