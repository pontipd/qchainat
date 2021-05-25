// import 'package:chainatqueue/screens/menu.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';


// class NavbarPick2 extends StatefulWidget {
//   NavbarPick2({Key key}) : super(key: key);

//   @override
//   _NavbarPick2State createState() => _NavbarPick2State();
// }

// class _NavbarPick2State extends State<NavbarPick2> {
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
//                   Row(
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           MaterialPageRoute route =
//                               MaterialPageRoute(builder: (value) => Menu());
//                              Navigator.push(context, route);
//                         },
//                         child: Icon(
//                           Icons.menu,
//                           color: Colors.white,
//                         ),
//                       ),
//                       SizedBox(
//                         width: 10.0,
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
//           ],
//         ),
//       ),
//     );
//   }
// }
