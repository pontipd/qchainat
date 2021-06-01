import 'package:chainatqueue/models/user.dart';
import 'package:chainatqueue/models/user_model.dart';
import 'package:chainatqueue/screens/appointment.dart';
import 'package:chainatqueue/screens/homepage.dart';
import 'package:chainatqueue/screens/login.dart';
import 'package:chainatqueue/screens/pin.dart';

import 'package:chainatqueue/utility/dialog.dart';
import 'package:chainatqueue/utility/my_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  final String genders,
      username,
      password,
      type,
      name,
      surname,
      phon,
      bh,
      cids,
      hns,
      inputController,
      inputHn;

  Register(
      {Key key,
      this.bh,
      this.cids,
      this.genders,
      this.name,
      this.password,
      this.phon,
      this.surname,
      this.type,
      this.hns,
      this.inputHn,
      this.inputController,
      this.username})
      : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String genders,
      username,
      password,
      type,
      name,
      surname,
      phon,
      bh,
      cids,
      hns,
      inputController,
      inputHn;
  bool isHasData;

  void _signUp(String email, String password, BuildContext context) async {
    ProviderState _providerState =
        Provider.of<ProviderState>(context, listen: false);
    try {
      if (await _providerState.signUpUser(email, password)) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login()));
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    bh = "${widget.bh}";
    // name = "${widget.name}";
    cids = "${widget.cids}";
    hns = "${widget.hns}";
    inputHn = "${widget.inputHn}";
    inputController = "${widget.inputController}";

    return Scaffold(
      // appBar: AppBar(title: Text(
      //                   'ลงทะเบียน',
      //                   style: GoogleFonts.kanit(
      //                     fontSize: 24.0,
      //                     color: Color(
      //                       0xff089EAD,
      //                     ),),) ,),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.90,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.80,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 30.0),
                  ),
                  Row(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.arrow_back),
                          iconSize: 24.0,
                          color: Color(
                            0xff979797,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      Text(
                        'ลงทะเบียน',
                        style: GoogleFonts.kanit(
                          fontSize: 28.0,
                          color: Color(
                            0xff089EAD,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    child: Text(
                      "ข้อมูลส่วนบุคคล ",
                      style: GoogleFonts.kanit(
                        fontSize: 18.0,
                        color: Color(
                          0xff089EAD,
                        ),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    width: 325,
                  ),
                  Divider(
                    height: 15,
                    thickness: 1.0,
                    color: Color(
                      0xffBDBDBD,
                    ),
                  ),
                  gender(),
                  nameForm(),
                  Padding(padding: EdgeInsets.only(top: 15.0)),
                  surnameForm(),
                  Padding(padding: EdgeInsets.only(top: 15.0)),
                  cid(),
                  Padding(padding: EdgeInsets.only(top: 15.0)),
                  firehn(),
                  Padding(padding: EdgeInsets.only(top: 15.0)),
                  bd(),
                  Padding(padding: EdgeInsets.only(top: 15.0)),
                  phone(),
                  Padding(padding: EdgeInsets.only(top: 15.0)),
                  // emailForm(),
                  Padding(padding: EdgeInsets.only(top: 15.0)),
                  usernameForm(),
                  Padding(padding: EdgeInsets.only(top: 15.0)),
                  passwordForm(),
                  Padding(padding: EdgeInsets.only(top: 15.0)),
                  button(),
                  Padding(padding: EdgeInsets.only(top: 15.0)),
                  empty(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  empty() => Container(
        width: 30.0,
      );

  Widget button() => Container(
      margin: new EdgeInsets.symmetric(horizontal: 20.0),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: 120.0,
              height: 53.0,
              child: RaisedButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      ' ย้อนกลับ',
                      style: GoogleFonts.kanit(
                        fontSize: 22.0,
                        color: Color(
                          0xff727876,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(8.0),
                ),
              ),
            ),
            buildregit(),
          ],
        ),
      ));

  Container buildregit() {
    return Container(
      width: 120.0,
      height: 53.0,
      child: RaisedButton(
        onPressed: () {
          if (name?.isEmpty ?? true) {
            // print('Have Space');
            normalDialog(context, 'กรุณากรอกข้อมูลให้ครบถ้วน');
          } else if (genders == null) {
            normalDialog(context, 'โปรดเลือกคำหน้านามให้ครบถ้วน');
          } else {
            createAccountAndInsertInformation();
          }
          //   showDialog(
          //     context: context,
          //     builder: (context) =>
          //     SimpleDialog(
          //       title: Container(
          //         width: 850.0,
          //         height: 240.0,
          //         child: SingleChildScrollView(
          //           child: Container(
          //             width: 330.0,
          //             height: 211.0,
          //             // width: MediaQuery.of(context).size.width * 0.85,

          //             child: Column(
          //               children: <Widget>[
          //                 Text(
          //                   "ตั้งค่า Pin Code เพื่อความสะดวก",
          //                   style: GoogleFonts.prompt(
          //                     color: Color(
          //                       0xff089EAD,
          //                     ),
          //                     fontSize: 18.0,
          //                     fontWeight: FontWeight.w400,
          //                   ),
          //                   textAlign: TextAlign.center,
          //                 ),
          //                 Divider(
          //                   height: 15,
          //                   thickness: 1.0,
          //                   color: Color(
          //                     0xffF6F6F6,
          //                   ),
          //                 ),
          //                 Text(
          //                   "กรุณาตั้งค่า Pin Code 6 หลัก \nเพื่อความสะดวกและปลอดภัยยิ่งขึ้นในการใช้งาน",
          //                   style: GoogleFonts.prompt(
          //                     color: Colors.grey[04],
          //                     fontSize: 18,
          //                     fontWeight: FontWeight.w400,
          //                   ),
          //                   textAlign: TextAlign.center,
          //                 ),
          //                 SizedBox(
          //                   height: 20.0,
          //                 ),
          //                 Container(
          //                   width: MediaQuery.of(context).size.width * 0.85,
          //                   height: 10.0,
          //                 ),
          //                 Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //                   children: <Widget>[
          //                     Container(
          //                       width: 250.0,
          //                       height: 53.0,
          //                       child: RaisedButton(
          //                         color: MyStyle().prinaryColor,
          //                         shape: RoundedRectangleBorder(
          //                             borderRadius: BorderRadius.circular(3.0)),
          //                         onPressed: () {
          //                           MaterialPageRoute route = MaterialPageRoute(
          //                               builder: (value) => Pincode2(
          //                                     name: name,
          //                                     cids: cids,
          //                                     bh: bh,
          //                                     hns: hns,
          //                                     // inputController:inputController,
          //                                     inputHn: inputHn,
          //                                   ));
          //                           Navigator.push(context, route);
          //                         },
          //                         child: Text(
          //                           'เริ่มตั้ง Pin Code',
          //                           style: GoogleFonts.kanit(
          //                             fontSize: 22.0,
          //                             color: Colors.white,
          //                           ),
          //                           textAlign: TextAlign.center,
          //                         ),
          //                       ),
          //                     )
          //                   ],
          //                 )
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //  );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '  ต่อไป  ',
              style: GoogleFonts.kanit(
                fontSize: 22.0,
                color: Color(
                  0xffF2F2F2,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            // Icon(
            //   Icons.navigate_next,
            //   color: Colors.green[200],
            // ),
          ],
        ),
        color: Color(
          0xff089EAD,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  Future<Null> createAccountAndInsertInformation() async {
    await Firebase.initializeApp().then((value) async {
      print(
          "###Firebaseinitialize Success user==>$username,password==>$password#####");
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: username, password: password)
          .then((value) async {
        print('Success');

        await value.user.updateProfile(displayName: hns).then((value2) async {
          String uid = value.user.uid;
          print('Update Profile=$uid');

          UserModel model = UserModel(
            prefix: genders,
            name: name,
            surname: surname,
            cids: cids,
            birthday: bh,
            phone: phon,
            hns: hns,
            email: username,
            password: password,
            uid: uid,
          );
          Map<String, dynamic> data = model.toMap();

          await FirebaseFirestore.instance
              .collection('user')
              .doc(uid)
              .set(data)
              .then(
                (value) =>
                    //           showDialog(
                    //     context: context,
                    //     builder: (context) =>
                    //     SimpleDialog(
                    //       title: Container(
                    //         width: 850.0,
                    //         height: 240.0,
                    //         child: SingleChildScrollView(
                    //           child: Container(
                    //             width: 330.0,
                    //             height: 211.0,
                    //             // width: MediaQuery.of(context).size.width * 0.85,

                    //             child: Column(
                    //               children: <Widget>[
                    //                 Text(
                    //                   "ตั้งค่า Pin Code เพื่อความสะดวก",
                    //                   style: GoogleFonts.prompt(
                    //                     color: Color(
                    //                       0xff089EAD,
                    //                     ),
                    //                     fontSize: 18.0,
                    //                     fontWeight: FontWeight.w400,
                    //                   ),
                    //                   textAlign: TextAlign.center,
                    //                 ),
                    //                 Divider(
                    //                   height: 15,
                    //                   thickness: 1.0,
                    //                   color: Color(
                    //                     0xffF6F6F6,
                    //                   ),
                    //                 ),
                    //                 Text(
                    //                   "กรุณาตั้งค่า Pin Code 6 หลัก \nเพื่อความสะดวกและปลอดภัยยิ่งขึ้นในการใช้งาน",
                    //                   style: GoogleFonts.prompt(
                    //                     color: Colors.grey[04],
                    //                     fontSize: 18,
                    //                     fontWeight: FontWeight.w400,
                    //                   ),
                    //                   textAlign: TextAlign.center,
                    //                 ),
                    //                 SizedBox(
                    //                   height: 20.0,
                    //                 ),
                    //                 Container(
                    //                   width: MediaQuery.of(context).size.width * 0.85,
                    //                   height: 10.0,
                    //                 ),
                    //                 Row(
                    //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //                   children: <Widget>[
                    //                     Container(
                    //                       width: 250.0,
                    //                       height: 53.0,
                    //                       child: RaisedButton(
                    //                         color: MyStyle().prinaryColor,
                    //                         shape: RoundedRectangleBorder(
                    //                             borderRadius: BorderRadius.circular(3.0)),
                    //                         onPressed: () {
                    //                           MaterialPageRoute route = MaterialPageRoute(
                    //                               builder: (value) => Pincode2(
                    //                                     name: name,
                    //                                     cids: cids,
                    //                                     bh: bh,
                    //                                     hns: hns,
                    //                                     // inputController:inputController,
                    //                                     inputHn: inputHn,
                    //                                   ));
                    //                           Navigator.push(context, route);
                    //                         },
                    //                         child: Text(
                    //                           'เริ่มตั้ง Pin Code',
                    //                           style: GoogleFonts.kanit(
                    //                             fontSize: 22.0,
                    //                             color: Colors.white,
                    //                           ),
                    //                           textAlign: TextAlign.center,
                    //                         ),
                    //                       ),
                    //                     )
                    //                   ],
                    //                 )
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //  ),
                    // print('insert')

                    showDialog(
                        context: context,
                        builder: (context) {
                          // _timer = Timer(Duration(seconds: 3), () {
                          //   Navigator.of(context).pop();
                          // });
                          return AlertDialog(
                            content: Container(
                              width: MediaQuery.of(context).size.width * 0.95,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.95,
                                      //  height: 150.0,
                                      child: Column(
                                        children: [
                                          Text(
                                            'ตั้งค่า Pin Code',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 20.0,
                                              color: Color(
                                                0xff089EAD,
                                              ),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Divider(
                                            height: 2,
                                            thickness: 1.0,
                                            color: Colors.grey[200],
                                          ),
                                          Text(
                                            'กรุณาตั้งค่า Pin Code 6 หลัก\nเพื่อความสะดวกและปลอดภัยยิ่งขึ้นในการใช้งาน',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16.0),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Container(
                                          width: 200.0,
                                          height: 53.0,
                                          child: RaisedButton(
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        5.0),
                                                side: BorderSide(
                                                  color: Color(
                                                    0xff089EAD,
                                                  ),
                                                )),
                                            onPressed: () {
                                              MaterialPageRoute route =
                                                  MaterialPageRoute(
                                                      builder: (value) =>
                                                          Pincode2());
                                              Navigator.push(context, route);
                                            },
                                            child: Text(
                                              'เริ่มตั้ง Pin Code',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 18.0,
                                                color: Color(
                                                  0xff089EAD,
                                                ),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
              );
        });
      }).catchError((onError) => normalDialog(context, onError.code));
    });
  }

  passwordForm() => Container(
        margin: new EdgeInsets.symmetric(horizontal: 10.0),
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        child: TextField(
          onChanged: (value) => password = value.trim(),
          decoration: InputDecoration(
            // prefixIcon: Icon(
            //   Icons.account_box,
            //   color: MyStyle().darkColor,
            // ),
            labelStyle:
                GoogleFonts.kanit(fontSize: 16.0, color: Colors.grey[600]),
            labelText: 'รหัสผ่าน',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.grey[300])),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[300])),
          ),
        ),
        color: Colors.grey[100],
      );

  usernameForm() => Container(
        margin: new EdgeInsets.symmetric(horizontal: 10.0),
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        child: TextField(
          onChanged: (value) => username = value.trim(),
          decoration: InputDecoration(
            // prefixIcon: Icon(
            //   Icons.account_box,
            //   color: MyStyle().darkColor,
            // ),
            labelStyle:
                GoogleFonts.kanit(fontSize: 16.0, color: Colors.grey[600]),
            labelText: 'ชื่อผู้ใช้งาน',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.grey[300])),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[300])),
          ),
        ),
        color: Colors.grey[100],
      );
  // emailForm() => Container(
  //       margin: new EdgeInsets.symmetric(horizontal: 10.0),
  //       width: MediaQuery.of(context).size.width,
  //       height: 50.0,
  //       child: TextField(
  //         // onChanged: (value) => user = value.trim(),
  //         decoration: InputDecoration(
  //           // prefixIcon: Icon(
  //           //   Icons.account_box,
  //           //   color: MyStyle().darkColor,
  //           // ),
  //           labelStyle:
  //               GoogleFonts.kanit(fontSize: 16.0, color: Colors.grey[600]),
  //           labelText: 'อีเมล์',
  //           enabledBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.all(Radius.circular(10.0)),
  //               borderSide: BorderSide(color: Colors.grey[300])),
  //           focusedBorder: OutlineInputBorder(
  //               borderSide: BorderSide(color: Colors.grey[300])),
  //         ),
  //       ),
  //       color: Colors.grey[100],
  //     );

  phone() => Container(
        margin: new EdgeInsets.symmetric(horizontal: 10.0),
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        child: TextField(
          keyboardType: TextInputType.number,
          onChanged: (value) => phon = value.trim(),
          decoration: InputDecoration(
            // prefixIcon: Icon(
            //   Icons.account_box,
            //   color: MyStyle().darkColor,
            // ),
            labelStyle:
                GoogleFonts.kanit(fontSize: 16.0, color: Colors.grey[600]),
            labelText: 'โทรศัพท์',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.grey[300])),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[300])),
          ),
        ),
        color: Colors.grey[100],
      );

  bd() => Container(
        margin: new EdgeInsets.symmetric(horizontal: 10.0),
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        child: TextField(
          keyboardType: TextInputType.number,
          onChanged: (value) => bh = value.trim(),
          decoration: InputDecoration(
            // prefixIcon: Icon(
            //   Icons.account_box,
            //   color: MyStyle().darkColor,
            // ),
            labelStyle:
                GoogleFonts.kanit(fontSize: 16.0, color: Colors.grey[600]),
            labelText: bh,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.grey[300])),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[300])),
          ),
        ),
        color: Colors.grey[100],
      );
  cid() => Container(
        margin: new EdgeInsets.symmetric(horizontal: 10.0),
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        child: TextField(
          keyboardType: TextInputType.number,
          onChanged: (value) => cids = value.trim(),
          decoration: InputDecoration(
            // prefixIcon: Icon(
            //   Icons.account_box,
            //   color: MyStyle().darkColor,
            // ),
            labelStyle:
                GoogleFonts.kanit(fontSize: 16.0, color: Colors.grey[600]),
            labelText: cids,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.grey[300])),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[300])),
          ),
        ),
        color: Colors.grey[100],
      );

  firehn() => Container(
        margin: new EdgeInsets.symmetric(horizontal: 10.0),
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        child: TextField(
          keyboardType: TextInputType.number,
          onChanged: (value) => hns = value.trim(),
          decoration: InputDecoration(
            // prefixIcon: Icon(
            //   Icons.account_box,
            //   color: MyStyle().darkColor,
            // ),
            labelStyle:
                GoogleFonts.kanit(fontSize: 16.0, color: Colors.grey[600]),
            labelText: hns,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.grey[300])),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[300])),
          ),
        ),
        color: Colors.grey[100],
      );

  surnameForm() => Container(
        margin: new EdgeInsets.symmetric(horizontal: 10.0),
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        child: TextField(
          onChanged: (value) => surname = value.trim(),
          decoration: InputDecoration(
            // prefixIcon: Icon(
            //   Icons.account_box,
            //   color: MyStyle().darkColor,
            // ),
            labelStyle:
                GoogleFonts.kanit(fontSize: 16.0, color: Colors.grey[600]),
            labelText: 'นามสกุล',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.grey[300])),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[300])),
          ),
        ),
        color: Colors.grey[100],
      );

  nameForm() => Container(
        margin: new EdgeInsets.symmetric(horizontal: 10.0),
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        child: TextField(
          onChanged: (value) => name = value.trim(),
          // onChanged: (value) => user = value.trim(),
          decoration: InputDecoration(
            // prefixIcon: Icon(
            //   Icons.account_box,
            //   color: MyStyle().darkColor,
            // ),
            labelStyle:
                GoogleFonts.kanit(fontSize: 16.0, color: Colors.grey[600]),
            labelText: 'ชื่อ',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.grey[300])),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[300])),
          ),
        ),
        color: Colors.grey[100],
      );

  Widget gender() => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Radio(
            value: 'Mr.',
            groupValue: genders,
            onChanged: (value) {
              genders = value;
              setState(() {});
            },
          ),
          Text(
            'นาย',
            style: GoogleFonts.kanit(fontSize: 16.0, color: Colors.grey[600]),
          ),
          Radio(
            value: 'Ms.',
            groupValue: genders,
            onChanged: (value) {
              genders = value;
              setState(() {});
            },
          ),
          Text(
            'นางสาว',
            style: GoogleFonts.kanit(fontSize: 16.0, color: Colors.grey[600]),
          ),
          Radio(
            value: 'Mrs',
            groupValue: genders,
            onChanged: (value) {
              genders = value;
              setState(() {});
            },
          ),
          Text(
            'นาง',
            style: GoogleFonts.kanit(fontSize: 16.0, color: Colors.grey[600]),
          ),
        ],
      );

  void createAccountAndInserInformation() {}
}
