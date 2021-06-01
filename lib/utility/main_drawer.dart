// แทบบาร์ด้านข้าง

import 'dart:async';


import 'package:async/async.dart';
import 'package:chainatqueue/screens/forgotPassword.dart';
import 'package:chainatqueue/screens/login.dart';
import 'package:chainatqueue/screens/pin.dart';
import 'package:chainatqueue/screens/profile.dart';
import 'package:chainatqueue/screens/resetPassword.dart';
import 'package:chainatqueue/screens/startouse.dart';
import 'package:chainatqueue/utility/buttom_bar.dart';
import 'package:chainatqueue/utility/mystyledrawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'my_style.dart';

class MainDrawer extends StatefulWidget {
  MainDrawer({Key key}) : super(key: key);

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  var floatingActionButton;
  String displayname, hns;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> snapshots;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    finddisplay();
  }

  Future<Null> finddisplay() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance.authStateChanges().listen((event) {
        displayname = event.displayName;

        print('## = $displayname');
      });
    });
  }

  // Future<Null> findstor() async {
  //   await Firebase.initializeApp().then((value) async {
  //     await FirebaseFirestore.instance
  //         .collection('user')
  //         .snapshots()
  //         .listen((event) {
  //       print('snapshots =${event.docs}');
  //       for (var snapshots in event.docs) {
  //         Map<String, dynamic> map = snapshots.data();
  //         print('map = $map');
  //       }
  //     });
  //   });
  // }

  // Future<Null> findstor() async {
  //   CollectionReference collectionReference =
  //       firebaseFirestore.collection('user');
  //   subscription = await collectionReference.snapshots().listen((dataSnapshot) {
  //     snapshots = dataSnapshot.docs;
  //     for (var snapshot in snapshots) {
  //       String Hns;

  //       print('Hns==> $hns');
  //     }
  //   });
  // }
  // String login = '...';
  // @override
  // void initState() {
  //   super.initState();
  //   readdatabase(context);
  //   readfirestore();
  // }

  // FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  // FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  // Future readfirestore() async {
  //   CollectionReference collectionReference =
  //       firebaseFirestore.collection('post');
  //   subscription = await collectionReference.snapshots().listen((dataSna) {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'ตั้งค่า',
          style: GoogleFonts.prompt(
            fontSize: 24.0,
            color: Color(
              0xff089EAD,
            ),
          ),
          textAlign: TextAlign.right,
        ),

        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.grey),
            onPressed: () {
              Navigator.pop(context);
            }
            //  onPressed: () =>
            //   Navigator.of(context).pop(),

            ),

//  centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.90,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.90,
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Text(
                              '     ข้อมูลส่วนตัว ',
                              // "$departmentName",
                              style: TextStyle(
                                color: Color(
                                  0xff089EAD,
                                ),
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Kanit",
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                                icon: Icon(Icons.navigate_next,
                                    color: Colors.grey),
                                iconSize: 28.0,
                                color: Color(
                                  0xff828282,
                                ),
                                onPressed: () {
                                  MaterialPageRoute route = MaterialPageRoute(
                                      builder: (value) => Profile());
                                  Navigator.push(context, route);
                                }),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: Divider(
                          height: 15,
                          thickness: 1.25,
                          color: Color(
                            0xffBDBDBD,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Text(
                              '     เปลี่ยน Pin Code',
                              // "$departmentName",
                              style: TextStyle(
                                color: Color(
                                  0xff089EAD,
                                ),
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Kanit",
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                                icon: Icon(Icons.navigate_next,
                                    color: Colors.grey),
                                iconSize: 32.0,
                                color: Color(
                                  0xff828282,
                                ),
                                onPressed: () {
                                  MaterialPageRoute route = MaterialPageRoute(
                                      builder: (value) => Pincode2());
                                  Navigator.push(context, route);
                                }),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: Divider(
                          height: 15,
                          thickness: 1.25,
                          color: Color(
                            0xffBDBDBD,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Text(
                              '     เปลี่ยนรหัสผ่าน',
                              // "$departmentName",
                              style: TextStyle(
                                color: Color(
                                  0xff089EAD,
                                ),
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Kanit",
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                                icon: Icon(Icons.navigate_next,
                                    color: Colors.grey),
                                iconSize: 32.0,
                                color: Color(
                                  0xff828282,
                                ),
                                onPressed: () {
                                  MaterialPageRoute route = MaterialPageRoute(
                                      builder: (value) => ForgotPassword());
                                  Navigator.push(context, route);
                                }),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: Divider(
                          height: 15,
                          thickness: 1.25,
                          color: Color(
                            0xffBDBDBD,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Text(
                              '     เเจ้งเตือนนัดหมาย',
                              // "$departmentName",
                              style: TextStyle(
                                color: Color(
                                  0xff089EAD,
                                ),
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Kanit",
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                                icon: Icon(Icons.navigate_next,
                                    color: Colors.grey),
                                iconSize: 28.0,
                                color: Color(
                                  0xff828282,
                                ),
                                onPressed: () {
                                  //  MaterialPageRoute route = MaterialPageRoute(
                                  //           builder: (value) => Profile());
                                  //       Navigator.push(context, route);
                                }),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: Divider(
                          height: 15,
                          thickness: 1.25,
                          color: Color(
                            0xffBDBDBD,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Text(
                              '     เวอร์ชั่น',
                              // "$departmentName",
                              style: TextStyle(
                                color: Color(
                                  0xff089EAD,
                                ),
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Kanit",
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              '1.0',
                              // "$departmentName",
                              style: TextStyle(
                                color: Color(
                                  0xff089EAD,
                                ),
                                fontSize: 18,
                                height: 2.9,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Kanit",
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: Divider(
                            height: 15,
                            thickness: 1.25,
                            color: Colors.grey[400]),
                      ),
                      Padding(padding: EdgeInsets.only(top: 40.0)),
                      floatingActionButton = Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: 50.0,
                        child: FloatingActionButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          clipBehavior: Clip.antiAlias,
                          onPressed: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            await Firebase.initializeApp().then((value) async {
                              await FirebaseAuth.instance
                                  .signOut()
                                  .then((value) {
                                prefs.clear();
                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/login', (route) => false);
                              });
                            });
                          },
                          backgroundColor: Color(
                            0xff089EAD,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.85,
                              ),
                              Text(
                                'ออกจากระบบ',
                                style: GoogleFonts.prompt(fontSize: 22.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],

                    // Widget logOut() {
                    //   return Container(
                    //       margin: new EdgeInsets.symmetric(horizontal: 10.0),
                    //       width: MediaQuery.of(context).size.width,
                    //       height: 60.0,
                    //       child: RaisedButton(
                    //         onPressed: () {
                    //           MaterialPageRoute route =
                    //               MaterialPageRoute(builder: (value) => Login());
                    //           Navigator.push(context, route);
                    //         },
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             Text(
                    //               'ออกจกระบบ',
                    //               style:
                    //                   GoogleFonts.prompt(fontSize: 18.0, color: Colors.grey[600]),
                    //               textAlign: TextAlign.center,
                    //             ),
                    //             Icon(
                    //               Icons.exit_to_app,
                    //               color: Colors.grey[600],
                    //             )
                    //           ],
                    //         ),
                    //         color: Colors.white,
                    //         shape: RoundedRectangleBorder(
                    //           side: BorderSide(
                    //               color: Colors.blue[900], width: 1, style: BorderStyle.solid),
                    //           borderRadius: new BorderRadius.circular(10.0),
                    //         ),
                    //       ));
                    // }

                    // Widget notifications() {
                    //   return Container(
                    //       margin: new EdgeInsets.symmetric(horizontal: 10.0),
                    //       width: MediaQuery.of(context).size.width,
                    //       height: 60.0,
                    //       child: RaisedButton(
                    //         onPressed: () {
                    //           // MaterialPageRoute route =
                    //           //     MaterialPageRoute(builder: (value) => Login());
                    //           // Navigator.push(context, route);
                    //         },
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             Text(
                    //               ' การแจ้งเตือน',
                    //               style:
                    //                   GoogleFonts.prompt(fontSize: 18.0, color: Colors.grey[600]),
                    //               textAlign: TextAlign.center,
                    //             ),
                    //             Icon(
                    //               Icons.notifications,
                    //               color: Colors.grey[600],
                    //             )
                    //           ],
                    //         ),
                    //         color: Colors.white,
                    //         shape: RoundedRectangleBorder(
                    //           side: BorderSide(
                    //               color: Colors.blue[900], width: 1, style: BorderStyle.solid),
                    //           borderRadius: new BorderRadius.circular(10.0),
                    //         ),
                    //       ));
                    // }

                    // Widget pin() {
                    //   return Container(
                    //       margin: new EdgeInsets.symmetric(horizontal: 10.0),
                    //       width: MediaQuery.of(context).size.width,
                    //       height: 60.0,
                    //       child: RaisedButton(
                    //         onPressed: () {
                    //           // MaterialPageRoute route =
                    //           //     MaterialPageRoute(builder: (value) => Login());
                    //           // Navigator.push(context, route);
                    //         },
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             Text(
                    //               'เปลี่ยน PIN',
                    //               style:
                    //                   GoogleFonts.prompt(fontSize: 18.0, color: Colors.grey[600]),
                    //               textAlign: TextAlign.center,
                    //             ),
                    //             Icon(
                    //               Icons.screen_lock_portrait,
                    //               color: Colors.grey[600],
                    //             )
                    //           ],
                    //         ),
                    //         color: Colors.white,
                    //         shape: RoundedRectangleBorder(
                    //           side: BorderSide(
                    //               color: Colors.blue[900], width: 1, style: BorderStyle.solid),
                    //           borderRadius: new BorderRadius.circular(10.0),
                    //         ),
                    //       ));
                    // }

                    // Widget password() {
                    //   return Container(
                    //       margin: new EdgeInsets.symmetric(horizontal: 10.0),
                    //       width: MediaQuery.of(context).size.width,
                    //       height: 60.0,
                    //       child: RaisedButton(
                    //         onPressed: () {
                    //           MaterialPageRoute route =
                    //               MaterialPageRoute(builder: (value) => RePassword());
                    //           Navigator.push(context, route);
                    //         },
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             Text(
                    //               'เปลี่ยนรหัสผ่าน',
                    //               style:
                    //                   GoogleFonts.prompt(fontSize: 18.0, color: Colors.grey[600]),
                    //               textAlign: TextAlign.center,
                    //             ),
                    //             Icon(
                    //               Icons.lock,
                    //               color: Colors.grey[600],
                    //             )
                    //           ],
                    //         ),
                    //         color: Colors.white,
                    //         shape: RoundedRectangleBorder(
                    //           side: BorderSide(
                    //               color: Colors.blue[900], width: 1, style: BorderStyle.solid),
                    //           borderRadius: new BorderRadius.circular(10.0),
                    //         ),
                    //       ));
                    // }

                    // Widget profile() {
                    //   return Container(
                    //       margin: new EdgeInsets.symmetric(horizontal: 10.0),
                    //       width: MediaQuery.of(context).size.width,
                    //       height: 60.0,
                    //       child: RaisedButton(
                    //         onPressed: () {
                    //           MaterialPageRoute route =
                    //               MaterialPageRoute(builder: (value) => Profile());
                    //           Navigator.push(context, route);
                    //         },
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             Text(
                    //               'ข้อมูลส่วนตัว',
                    //               style:
                    //                   GoogleFonts.prompt(fontSize: 18.0, color: Colors.grey[600]),
                    //               textAlign: TextAlign.center,
                    //             ),
                    //             Icon(
                    //               Icons.person,
                    //               color: Colors.grey[600],
                    //             )
                    //           ],
                    //         ),
                    //         color: Colors.white,
                    //         shape: RoundedRectangleBorder(
                    //           side: BorderSide(
                    //               color: Colors.blue[900], width: 1, style: BorderStyle.solid),
                    //           borderRadius: new BorderRadius.circular(10.0),
                    //         ),
                    //       ));
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
