import 'package:chainatqueue/screens/haveappointment.dart';
import 'package:chainatqueue/screens/login.dart';
import 'package:chainatqueue/utility/buttom_bar.dart';
import 'package:chainatqueue/utility/main_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';
import '../provider/app_provider.dart';
import '../models/patient.dart';
import 'login.dart';
import 'haveappointment.dart';
import 'page2.dart';
import 'auth_pincode.dart';

FirebaseMessaging messaging = FirebaseMessaging.instance;

/// Create a [AndroidNotificationChannel] for heads up notifications
const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  'This channel is used for important notifications.', // description
  importance: Importance.high,
);

/// Initialize the [FlutterLocalNotificationsPlugin] package.
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  double screen;
  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      var appProvider = Provider.of<AppProvider>(context, listen: false);
      if (user == null) {
        appProvider.setLoginState(false);
      } else {
        appProvider.setCurrentUser(user);
        appProvider.setLoginState(true);
        FirebaseFirestore.instance
            .collection('user')
            .doc(user.uid)
            .get()
            .then((DocumentSnapshot documentSnapshot) {
          if (documentSnapshot.exists) {
            appProvider.setPatient(Patient.fromJson(documentSnapshot.data()));
          }
        });
      }
    });

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }

    RemoteMessage initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage?.data != null &&
        initialMessage?.data['type'] == 'appoint') {
      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return Page2();
      }));
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channel.description,

                //      one that already exists in example app.
                icon: 'launch_background',
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      if (message.data['type'] == 'appoint') {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return Page2();
        }));
      }
      print(message.data);
    });

    messaging.getToken().then(setToken);
  }

  void setToken(String token) {
    print('FCM Token: $token');
  }

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    return Consumer<AppProvider>(
      builder: (context, app, child) {
        if (app.isLoggedIn) {
          return SplashScreen(
            seconds: 3,
            navigateAfterSeconds: new AuthPinCode(),
            title: new Text(
              'โรงพยาบาลชัยนาทนเรนทร',
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            image: Image(image: AssetImage('images/applogo1.png')),
            backgroundColor: const Color(0xff089EAD),
            loaderColor: Colors.white,
            photoSize: 200,
          );
        }
        return Login();
      },
    );
    // return Scaffold(
    //   // appBar: AppBar(
    //   //   title: Text('Appointment'),
    //   // ),
    //   backgroundColor: Color(
    //     0xff089EAD,
    //   ),
    //   body: Center(
    //     child: SingleChildScrollView(
    //       child: Container(
    //         height: MediaQuery.of(context).size.height,
    //         child: Center(
    //           child: Column(
    //             children: <Widget>[
    //               SizedBox(
    //                 height: 185.0,
    //               ),
    //               InkWell(
    //                 onTap: () {
    //                   MaterialPageRoute route =
    //                       MaterialPageRoute(builder: (value) => Login());
    //                   Navigator.push(context, route);
    //                 },
    //                 child: Container(
    //                   width: 350,
    //                   height: 350,
    //                   decoration: BoxDecoration(
    //                       image: DecorationImage(
    //                           image: AssetImage('images/applogo1.png'))),
    //                 ),
    //               ),
    //               Padding(padding: EdgeInsets.only(top: 120.0)),
    //               Text(
    //                 'โรงพยาบาลชัยนาทนเรนทร',
    //                 style: GoogleFonts.prompt(
    //                   fontSize: 24.0,
    //                   fontWeight: FontWeight.w400,
    //                   color: Colors.white,
    //                 ),
    //               )
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
