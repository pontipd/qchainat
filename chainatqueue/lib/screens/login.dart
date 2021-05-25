import 'dart:convert';

import 'package:async/async.dart';
import 'package:chainatqueue/main.dart';
import 'package:chainatqueue/models/getappoint.dart';
import 'package:chainatqueue/models/user.dart';
import 'package:chainatqueue/models/user_model.dart';
import 'package:chainatqueue/provider/user.dart';
import 'package:chainatqueue/screens/appointment.dart';
import 'package:chainatqueue/screens/chacklogin.dart';
import 'package:chainatqueue/screens/check.dart';
import 'package:chainatqueue/screens/checklogin.dart';
import 'package:chainatqueue/screens/haveappointment.dart';
import 'package:chainatqueue/utility/dialog.dart';
import 'package:chainatqueue/utility/my_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ok.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  double screen;
  String displayname, hns;
  String user, password;
   bool statusRedEye = true;
  List<Getappointmen> getappointments = List();
  

  @override
  Widget build(BuildContext context) {
    
    screen = MediaQuery.of(context).size.width;
    print('screen =$screen');
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(
                0xffF2F2F2,
              ),
              Colors.white,
            ],
            stops: [
              0.8,
              1,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 80.0)),

              nameSystem(),
              showLogo(),
              Padding(padding: EdgeInsets.only(top: 40.0)),
              login(),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              usernameForm(),
              Padding(padding: EdgeInsets.only(top: 15.0)),
              passwordForm(),
              Padding(padding: EdgeInsets.only(top: 15.0)),
              checkprofile(),
              // Rember(),
              Padding(padding: EdgeInsets.only(top: 5.0)),
              loginButton(),
              Padding(padding: EdgeInsets.only(top: 15.0)),
              or(),
              SizedBox(
                height: 10.0,
              ),
              regitsterButton(),
              SizedBox(
                height: 25.0,
              ),
              Ok(),
            ],
          ),
        ),
      ),
    );
  }

  Widget regitsterButton() {
    return Container(
        margin: new EdgeInsets.symmetric(horizontal: 30.0),
        width: MediaQuery.of(context).size.width * 0.85,
        height: 50.0,
        child: RaisedButton(
          onPressed: () {
            MaterialPageRoute route =
                MaterialPageRoute(builder: (value) => HosScreen());
            Navigator.push(context, route);
          },
          child: Text(
            'ลงทะเบียน',
            style: GoogleFonts.kanit(
              fontSize: 24.0,
              height: 1.5,
              color: Color(
                0xff089EAD,
              ),
            ),
            textAlign: TextAlign.center,
          ),
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(7.0),
          ),
        ));
  }

  or() => Container(
      margin: new EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(children: <Widget>[
        Expanded(
            child: Divider(
          thickness: 1.0,
          color: Color(
            0xff727876,
          ),
        )),
        Text(
          "   หรือ  ",
          style: GoogleFonts.kanit(fontSize: 16.0, color: Colors.grey[600]),
        ),
        Expanded(child: Divider(thickness: 1.0, color: Colors.grey[600])),
      ]));

  checkprofile() => Container(
          child: Align(
        alignment: Alignment(0.7, -0.7),
        child: InkWell(
          onTap: () {
            MaterialPageRoute route =
                MaterialPageRoute(builder: (value) => Checkprofile());
            Navigator.push(context, route);
          },
          child: Text(
            "ลืมรหัสผ่าน",
            // style: TextStyle(
            //   color: Colors.grey[600]),
            style: GoogleFonts.kanit(fontSize: 16.0, color: Colors.grey[600]),
          ),
        ),
      ));
  // ignore: non_constant_identifier_names
  //  Rember() => Container(
  //           child: Align(
  //         alignment: Alignment(0.7, -0.7),
  //         child: InkWell(
  //           onTap: () {
  //             MaterialPageRoute route =
  //                 MaterialPageRoute(builder: (value) => ForgotPassword());
  //             Navigator.push(context, route);
  //           },
  //           child: Text(
  //             "จดจำรหัสผ่าน",
  //             // style: TextStyle(
  //             //   color: Colors.grey[600]),
  //             style: GoogleFonts.kanit(fontSize: 16.0, color: Colors.grey[600]),
  //           ),
  //         ),
  //       ));

  Widget loginButton() {
    return Container(
        margin: new EdgeInsets.symmetric(horizontal: 30.0),
        width: MediaQuery.of(context).size.width * 0.85,
        height: 50.0,
        child: RaisedButton(
          onPressed: () {
            if ((user?.isEmpty ?? true) || (password?.isEmpty ?? true)) {
              normalDialog(context, 'โปรดกรอกข้อมูลให้ครบถ้วน');
            } else {
              checkLogIn();
            }
            // MaterialPageRoute route =
            //     MaterialPageRoute(builder: (value) => MyApp());
            // Navigator.push(context, route);
          },
          child: Text(
            'เข้าสู่ระบบ',
            style: GoogleFonts.kanit(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
          color: Color(
            0xff089EAD,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(7.0),
          ),
        ));
  }

  passwordForm() => Container(
        margin: new EdgeInsets.symmetric(horizontal: 30.0),
        width: MediaQuery.of(context).size.width,
        height: 50.0,
       child: TextField(
        onChanged: (value) => password = value.trim(),
        obscureText: statusRedEye,
        style: TextStyle(color: MyStyle().bColor),
        decoration: InputDecoration(
          suffixIcon: IconButton(
              icon: statusRedEye

              
                  ? Icon(Icons.remove_red_eye)
                  : Icon(Icons.remove_red_eye_outlined),
              onPressed: () {
                setState(() {
                  statusRedEye = !statusRedEye;
                });
                print('statusRedEye = $statusRedEye');
              }),
        labelStyle: GoogleFonts.kanit(
              color: Colors.grey[600],
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          labelText: 'รหัสผ่าน:',
          prefixIcon: Icon(
            Icons.lock_outline,
            color: MyStyle().bColor,
          ),
          enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.grey[300])),
                
          
           focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(7.0)),
                borderSide: BorderSide(color: Colors.grey[300])),
           ),
          ),
        
      
        color: Colors.grey[100],
      );









  usernameForm() => Container(
        margin: new EdgeInsets.symmetric(horizontal: 30.0),
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) => user = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.account_circle_outlined,
              color: MyStyle().grColor,
            ),
            labelStyle: GoogleFonts.kanit(
              color: Colors.grey[600],
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
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

  login() => SizedBox(
        child: Align(
          alignment: Alignment(-0.85, 0.7),
          child: Text(
            "เข้าสู่ระบบ",
            style: GoogleFonts.kanit(
              color: Color(
                0xff089ead,
              ),
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        width: 345,
      );

  nameSystem() => SizedBox(
        child: Text(
          "โรงพยาบาลชัยนาทนเรนทร",
          style: GoogleFonts.kanit(
            color: Color(
              0xff089ead,
            ),
            fontSize: 24.0,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
        width: 375,
      );
  showLogo() => Container(
        width: screen * 0.7,
        child: MyStyle().showLogo(),
      );

  showok() => Container(
        width: screen * 0.7,
        child: Ok().showok(),
      );

  // ignore: non_constant_identifier_names
  Authen() {}

  Future<Null> checkLogIn() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: user, password: password)
          .then((value) => checkAppointment);
      // .then((value) => Navigator.pushNamedAndRemoveUntil(
      //     context, '/appointment', (route) => false))
      // .catchError((value) => normalDialog(context, value.message));
    });
  }

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
        print(event);
        print('## = $displayname');
        FirebaseFirestore.instance
            .collection('user')
            .doc(event.uid)
            .get()
            .then((DocumentSnapshot documentSnapshot) {
          if (documentSnapshot.exists) {
            print(
                '-----------------------------Document data: ${documentSnapshot.data()} ');
          } else {
            print('Document does not exist on the database');
          }
        });
      });
    });
  }

  Future<Null> routeTuService(Widget myWidget, UserModel userModel) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('hn', displayname);
    preferences.setString('name', userModel.name);
    preferences.setString('sername', userModel.surname);

    MaterialPageRoute route = MaterialPageRoute(
      builder: (context) => myWidget,
    );
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }

// Future readData (FirebaseAuth  firebaseAuth) async{
//   FirebaseFirestore.instance.collection("user").doc(firebaseAuth.uid).get().then((value) => null)
// }

//  Future<Null> getData() async{
//     String userId = (await FirebaseAuth.instance.currentUser()).uid;
//     return Firestore.instance.collection('users').document(userId);
//   }

  // Future<Null> routeTuService(Widget myWidget, UserModel userModel) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   preferences.setString('cids', userModel.cids);
  //   preferences.setString('hn', userModel.hns);

  //   MaterialPageRoute route = MaterialPageRoute(
  //     builder: (context) => myWidget,
  //   );
  //   Navigator.pushAndRemoveUntil(context, route, (route) => false);
  // }
  //
  Future<Null> get checkAppointment async {
    try {
      var header = {'Content-Type': 'application/json'};
      var url = Uri.parse(
          'http://chainathospital.org/coreapi/api/v2/get_appointment_list/$displayname');

      var response = await http.get(url, headers: header);
      print("res =$response");
      var result = json.decode(response.body);
      print('result = $result');
      print(result['status']);
      // Getappointmen getappointmen =
      //     Getappointmen.fromJson(result);
      // print('getappointmen = $getappointmen');

      if (result['status']) {
        MaterialPageRoute route = MaterialPageRoute(
            builder: (value) => Haveappoin(
                  hn: hns,
                  inputHn: displayname,
                  // getappointment: getappointments[0],
                ));
        Navigator.push(context, route);
      } else {
        MaterialPageRoute route = MaterialPageRoute(
            builder: (value) => Appointment(
                  hn: hns,
                  inputHn: displayname,
                ));
        Navigator.push(context, route);
      }
      // if (getappointmen.status == false) {
      //   MaterialPageRoute route =
      //       MaterialPageRoute(builder: (value) => Appointment());
      //   Navigator.push(context, route);
      // } else {
      //   MaterialPageRoute route = MaterialPageRoute(
      //       builder: (value) => Haveappoin(
      //             hn: hns,
      //             inputHn: displayname,
      //             getappointment: getappointments[0],
      //           ));
      //   Navigator.push(context, route);
      // }
    } catch (e) {}
  }

   void _Login(String email,String password,BuildContext context) async{
    ProviderState _providerState = Provider.of<ProviderState>(context,listen: false);
    try{
      if(await _providerState.LoginUser(email, password)){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Haveappoin()));
      }
    }catch(e)
    {
      print(e);
    }
  }
}
