import 'dart:collection';

import 'package:chainatqueue/screens/appointment.dart';
import 'package:chainatqueue/screens/haveappointment.dart';
import 'package:chainatqueue/screens/picup.dart';
import 'package:chainatqueue/screens/queue.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: _buildShrineTheme(),
//       title: 'Flutter Demo',
//       home: Navbarmanu(),
//     );
//   }
// }

class Navbarmanu extends StatefulWidget {
  @override
  _NavbarmanuState createState() => _NavbarmanuState();
}

class _NavbarmanuState extends State<Navbarmanu> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Appointment(),
    Queue(),
    Getmedicine(),
    
  ];
  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(  
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: colorScheme.surface,
        selectedItemColor: Colors.teal[400],
        unselectedItemColor: Colors.grey[500],
        selectedLabelStyle: textTheme.caption,
        unselectedLabelStyle: textTheme.caption,
        onTap: onTappedBar,
        // onTap: (value) {
        //   // Respond to item press.
        //   setState(() => _currentIndex = value);
        // },
        items: [
          BottomNavigationBarItem(
           title: Text(
              'นัดหมาย',
              style: GoogleFonts.kanit(fontSize: 14.0, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            icon: Icon(Icons.date_range_outlined ,size: 34.0,),
          ),
          BottomNavigationBarItem(
            title: Text(
              'คิวตรวจ',
              style: GoogleFonts.kanit(fontSize: 14.0, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            icon: Icon(Icons.people,size: 34.0,),
          ),
          BottomNavigationBarItem(
           title: Text(
              'รับยาใกล้บ้าน',
              style: GoogleFonts.kanit(fontSize: 14.0, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            icon: Icon(Icons.roofing,size: 34.0,),
          ),
          BottomNavigationBarItem(
            title: Text(
              'ผลตรวจ',
              style: GoogleFonts.kanit(fontSize: 14.0, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            icon: Icon(Icons.pending_actions,size: 34.0,),
          ),
          BottomNavigationBarItem(
            title: Text(
              'ตรวจสิทธิ',
              style: GoogleFonts.kanit(fontSize: 14.0, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            icon: Icon(Icons.article_outlined,size: 34.0,),
          ),
        ],
      ),
    );
  }
}

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: _shrineColorScheme,
    textTheme: _buildShrineTextTheme(base.textTheme),
  );
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
        button: base.button.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
      )
      .apply(
        fontFamily: 'Kanit',
        displayColor: shrineBrown900,
        bodyColor: shrineBrown900,
      );
}

const ColorScheme _shrineColorScheme = ColorScheme(
  primary: shrinePink100,
  primaryVariant: shrineBrown900,
  secondary: shrinePink50,
  secondaryVariant: shrineBrown900,
  surface: shrineSurfaceWhite,
  background: shrineBackgroundWhite,
  error: shrineErrorRed,
  onPrimary: shrineBrown900,
  onSecondary: shrineBrown900,
  onSurface: shrineBrown900,
  onBackground: shrineBrown900,
  onError: shrineSurfaceWhite,
  brightness: Brightness.light,
);

const Color shrinePink50 =  Color(0xFF089EAD);
const Color shrinePink100 =  Color(0xFF089EAD);
const Color shrinePink300 = Color(0xFF089EAD);
const Color shrinePink400 = Color(0xFF089EAD);

const Color shrineBrown900 = Color(0xFF089EAD);
const Color shrineBrown600 = Color(0xFF089EAD);

const Color shrineErrorRed =  Color(0xFF089EAD);

const Color shrineSurfaceWhite = Color(0xFF089EAD);
const Color shrineBackgroundWhite =  Color(0xFF089EAD);

const defaultLetterSpacing = 0.03;
