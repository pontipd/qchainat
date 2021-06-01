// import 'package:chainat/screens/app_drawer.dart';
// import 'package:chainat/screens/child_widget.dart';
// import 'package:chainat/screens/homeprofile.dart';
// import 'package:chainat/utility/my_style.dart';
// import 'package:flutter/material.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int currentIndex = 0;

//   Widget childWidget = ChildWidget(
//     number: AvailableNumber.First,
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: AppDrawer(),
//       appBar: AppBar(
//         backgroundColor: Color(
//           0xff089EAD,
//         ),
//         toolbarHeight: 86.0,
//         bottomOpacity: 0.0,
//         elevation: 0.0,
//         flexibleSpace: Container(
//           child: MyStyle().bar(),
//         ),
//         title: Text("AppName"),
        
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         selectedItemColor: Theme.of(context).primaryColor,
//         unselectedItemColor: Colors.grey[500],
//         currentIndex: currentIndex,
//         onTap: (value) {
//           currentIndex = value;

//           switch (value) {
//             case 0:
//               childWidget = ChildWidget(number: AvailableNumber.First);
//               break;
//             case 1:
//               childWidget = ChildWidget(number: AvailableNumber.Second);
//               break;
//             case 2:
//               childWidget = ChildWidget(number: AvailableNumber.Third);
//               break;
//             case 3:
//               childWidget = ChildWidget(number: AvailableNumber.Third);
//               break;
//           }

//           setState(() {});
//         },
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             title: Text("First"),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.trending_up),
//             title: Text("Second"),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.dashboard),
//             title: Text("Third"),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.dashboard),
//             title: Text("Third"),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: SafeArea(
//           child: childWidget,
//         ),
//       ),
//     );
//   }
// }
