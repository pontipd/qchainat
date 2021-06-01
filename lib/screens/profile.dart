import 'dart:io';
import 'package:chainatqueue/models/user_model.dart';
import 'package:chainatqueue/screens/startouse.dart';
import 'package:chainatqueue/utility/dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File _image;
  final imagePicker = ImagePicker();

  String genders, type;
  User user;
  UserModel patient;
  String prefix;
  String name;
  String surname;
  String cids;
  String hns;
  String birthday;
  String phone;
  String email;
  String password;

  Future getImage() async {
    final image = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      _image = File(image.path);
    });
  }

  @override
  void initState() {
    super.initState();
    finddisplay();
    // loading = true;

    print(_auth.currentUser);
    user = _auth.currentUser;
    // getuser();

    readData();
    // var month = now.month.toString().padLeft(2, '0');
    //  var day = now.day.toString().padLeft(2, '0');
    //  date = "${now.year}" + "-" + "$month" + "-" + "$day";
    //  print(date);
    // futureAlbum = fetchAlbum();
  }

  Future<User> getuser() async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(user.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        //
        print(documentSnapshot.data());
        patient = UserModel(
          hns: documentSnapshot.data()['hns'],
          name: documentSnapshot.data()['name'],
          surname: documentSnapshot.data()['surname'],
          cids: documentSnapshot.data()['cids'],
          phone: documentSnapshot.data()['phone'],
          birthday: documentSnapshot.data()['birthday'],
          email: documentSnapshot.data()['email'],
          password: documentSnapshot.data()['password'],
        );
        setState(() {
          hns = patient.hns;
          name = patient.name;
          surname = patient.surname;
          cid = patient.cids;
          phone = patient.phone;
          birthday = patient.birthday;
          email = patient.email;
          password = patient.password;
          print('hns=====>$phone');
        });

        print('hns==>$hns');
        //  fetchAppoints();
        //  print(
        //   '-----------------------------Document data: ${documentSnapshot.data()} ');
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  Future<Null> finddisplay() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance.authStateChanges().listen((event) {
        //   displayname = event.displayName;
        //  inputHn = event.displayName;
        //   print('## = $displayname');
        // print('##12 = $inputHn');
        // getAppointment();
        getuser();
      });
    });
    await getuser();
  }

  Future<Null> readData() async {
    await Firebase.initializeApp().then((value) {
      print('init');
    });
  }

  Future _refreshData() async {
    await Future.delayed(Duration(seconds: 5));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print('=======$hns');
    return Scaffold(
      backgroundColor: Color(
        0xffFFFFFF,
      ),
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
          width: MediaQuery.of(context).size.width * 0.85,
          height: MediaQuery.of(context).size.height * 1.5,
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "ข้อมูลส่วนตัว",
                          style: GoogleFonts.prompt(
                            fontSize: 18.0,
                            color: Color(
                              0xff089EAD,
                            ),
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Column(
                          children: [
                            _image == null
                                ? Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image:
                                              AssetImage('images/person.png')),
                                    ),
                                  )
                                : Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: FileImage(_image)))),
                            Row(
                              children: [
                                InkWell(
                                  onTap: getImage,
                                  child: Text(
                                    'ถ่ายภาพ',
                                    style: GoogleFonts.prompt(
                                      fontSize: 16.0,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: getImage,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.grey[600],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    width: 300,
                  ),
                  gender(),
                  nameForm(),
                  Padding(padding: EdgeInsets.only(top: 15.0)),
                  surnameForm(),
                  Padding(padding: EdgeInsets.only(top: 15.0)),
                  idCard(),
                  Padding(padding: EdgeInsets.only(top: 15.0)),
                  driverlicense(),
                  Padding(padding: EdgeInsets.only(top: 15.0)),
                  phon(),
                  Padding(padding: EdgeInsets.only(top: 15.0)),
                  emailForm(),
                  Padding(padding: EdgeInsets.only(top: 40.0)),
                  button(),
                  Padding(padding: EdgeInsets.only(top: 30.0)),
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
            phone: phone,
            hns: hns,
            email: username,
            password: password,
          );
          Map<String, dynamic> data = model.toMap();

          await FirebaseFirestore.instance
              .collection('user')
              .doc(uid)
              .set(data)
              .then(
                (value) =>
                   

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
                                      width: MediaQuery.of(context).size.width * 0.95,
                                      height: 150.0,
                                      child: Column(
                                        children: [
                                          Text(
                                            'ตั้งค่า Pin Code เพื่อความสะดวก',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 18.0, color: Color(
                                                  0xff089EAD,
                                                ),),
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
                                                fontSize: 18.0),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Container(
                                          width: 220.0,
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
                                              // MaterialPageRoute route = MaterialPageRoute(
                                              //     builder: (value) => Pincode2(
                                              //           name: name,
                                              //           cids: cids,
                                              //           bh: bh,
                                              //           hns: hns,
                                              //           // inputController:inputController,
                                              //           inputHn: inputHn,
                                              //         ));
                                              // Navigator.push(context, route);
                                            },
                                            child: Text(
                                              'เริ่มตั้ง Pin Code',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 22.0,
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
  emailForm() => Container(
        margin: new EdgeInsets.symmetric(horizontal: 10.0),
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        child: TextFormField(
           onChanged: (value) => email = value.trim(),
          decoration: InputDecoration(
            // prefixIcon: Icon(
            //   Icons.account_box,
            //   color: MyStyle().darkColor,
            // ),
            labelStyle:
                GoogleFonts.prompt(fontSize: 16.0, color: Colors.grey[600]),
            labelText: email,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.grey[300])),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[300])),
          ),
        ),
        color: Colors.grey[100],
      );

  phon() => Container(
        margin: new EdgeInsets.symmetric(horizontal: 10.0),
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        child: TextFormField(
          keyboardType: TextInputType.number,
          onChanged: (value) => phone = value,
          initialValue: phone,
          decoration: InputDecoration(
            // prefixIcon: Icon(
            //   Icons.account_box,
            //   color: MyStyle().darkColor,
            // ),
            labelStyle:
                GoogleFonts.prompt(fontSize: 16.0, color: Colors.grey[600]),
            labelText: phone,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.grey[300])),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[300])),
          ),
        ),
        color: Colors.grey[100],
      );

  driverlicense() => Container(
        margin: new EdgeInsets.symmetric(horizontal: 10.0),
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        child: TextFormField(
           onChanged: (value) => birthday = value.trim(),
           initialValue: birthday,
          decoration: InputDecoration(
            // prefixIcon: Icon(
            //   Icons.account_box,
            //   color: MyStyle().darkColor,
            // ),
            labelStyle:
                GoogleFonts.prompt(fontSize: 16.0, color: Colors.grey[600]),
            labelText: birthday,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.grey[300])),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[300])),
          ),
        ),
        color: Colors.grey[100],
      );

  idCard() => Container(
        margin: new EdgeInsets.symmetric(horizontal: 10.0),
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        child: TextFormField(
          keyboardType: TextInputType.number,
           onChanged: (value) => cids = value.trim(),
          decoration: InputDecoration(
            // prefixIcon: Icon(
            //   Icons.account_box,
            //   color: MyStyle().darkColor,
            // ),
            labelStyle:
                GoogleFonts.prompt(fontSize: 16.0, color: Colors.grey[600]),
            labelText: cid ,
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
        child: TextFormField(
           onChanged: (value) => surname = value.trim(),
           initialValue: surname,
          decoration: InputDecoration(
            
            // prefixIcon: Icon(
            //   Icons.account_box,
            //   color: MyStyle().darkColor,
            // ),
            labelStyle:
                GoogleFonts.prompt(fontSize: 16.0, color: Colors.grey[600]),
            labelText: surname,
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
        child: TextFormField(
          onChanged: (value) => name = value.trim(),
          initialValue: name,
          decoration: InputDecoration(
            // prefixIcon: Icon(
            //   Icons.account_box,
            //   color: MyStyle().darkColor,
            // ),
            labelStyle:
                GoogleFonts.prompt(fontSize: 16.0, color: Colors.grey[600]),
            labelText: name,
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
            value: 'นาย',
            groupValue: genders,
            onChanged: (value) {
              genders = value;
              setState(() {});
            },
          ),
          Text(
            'นาย',
            style: GoogleFonts.prompt(fontSize: 16.0, color: Colors.grey[600]),
          ),
          Radio(
            value: 'นางสาว',
            groupValue: genders,
            onChanged: (value) {
              genders = value;
              setState(() {});
            },
          ),
          Text(
            'นางสาว',
            style: GoogleFonts.prompt(fontSize: 16.0, color: Colors.grey[600]),
          ),
          Radio(
            value: 'นาง',
            groupValue: genders,
            onChanged: (value) {
              genders = value;
              setState(() {});
            },
          ),
          Text(
            'นาง',
            style: GoogleFonts.prompt(fontSize: 16.0, color: Colors.grey[600]),
          ),
        ],
      );
}
