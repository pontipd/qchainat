// import 'package:chainatqueue/widget/authen.dart';

import 'package:chainatqueue/screens/Medicineroom.dart';
import 'package:chainatqueue/screens/Selectdepartment.dart';
import 'package:chainatqueue/screens/appname.dart';
import 'package:chainatqueue/screens/appointment.dart';
import 'package:chainatqueue/screens/haveappointment.dart';
import 'package:chainatqueue/screens/home.dart';
import 'package:chainatqueue/screens/homepage.dart';
import 'package:chainatqueue/screens/launcher.dart';
import 'package:chainatqueue/screens/login.dart';
import 'package:chainatqueue/screens/pin.dart';
import 'package:chainatqueue/screens/regitster.dart';
import 'package:chainatqueue/screens/start.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  '/appname': (BuildContext context) => App(),
  // '/start': (BuildContext context) => Homee(),
  '/regitster': (BuildContext context) => Register(),
   '/Medicineroom':(BuildContext context)=>Medicineroom(),
  //  '/appointment':(BuildContext context)=>Appointment(),
  '/haveappointment': (BuildContext context) => Haveappoin(),
  // '/Selectdepartment':(BuildContext context)=>Department(),
  '/login': (BuildContext context) => Login(),
  '/pin': (BuildContext context) => Pincode2(),
  '/Selectdepartment': (BuildContext context) => Department(),
};
