// import 'package:chainatqueue/screens/appointment.dart';
// import 'package:chainatqueue/screens/haveappointment.dart';
// import 'package:chainatqueue/screens/queue.dart';
// import 'package:flutter/material.dart';

// import 'home.dart';
// import 'contact.dart';
// import 'profile.dart';
// import 'about.dart';

 
// /* Home(),
//         About(),
//         Profile(),
//         Contact(),
//         Settings(), */

// class Launcher extends StatefulWidget {
//     static const routeName = '/';
 
//     @override
//     State<StatefulWidget> createState() {
//         return _LauncherState();
//     }
// }
 
// class _LauncherState extends State<Launcher> {
//     int _currentIndex = 0;
//     List<Widget> _pageWidget = <Widget>[
//         Home(),
//         About(),
//         Profile(),
//         Contact(),
//         Appointment(),
//         HaveAppointment(),
//         Queue(),
//         // Settings(),
//     ];

//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pageWidget.elementAt(_currentIndex),
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         currentIndex: _currentIndex,
//         backgroundColor: Colors.green,
//         selectedItemColor: Colors.white,
//         unselectedItemColor: Colors.white.withOpacity(.6),
//         selectedFontSize: 14,
//         unselectedFontSize: 14,
//         onTap: (value) {
//           // Respond to item press.
//           setState(() => _currentIndex = value);
//         },
//         items: [
//           BottomNavigationBarItem(
//             title: Text('Home'),
//             icon: Icon(Icons.home),
//           ),
//           BottomNavigationBarItem(
//             title: Text('About'),
//                icon: Icon(Icons.home),
//           ),
//           BottomNavigationBarItem(
//             title: Text('Profile'),
//                icon: Icon(Icons.home),
//           ),
//           BottomNavigationBarItem(
//             title: Text('Contact'),
//                icon: Icon(Icons.home),
//           ),
//           BottomNavigationBarItem(
//             title: Text('Setting'),
//              icon: Icon(Icons.home),
//           ),
//         ],
//       ),
//     );
//   }
// }
