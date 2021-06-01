import 'package:chainatqueue/screens/login.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
//  Widget longinPin() {
//     return Container(
//         margin: new EdgeInsets.symmetric(horizontal: 15.0),
//         width: 342.0,
//         height: 150.0,
//         child: RaisedButton(
//           onPressed: () {},
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 '''2) login with Pin Code
//      กรณีตั้งค่า Pin Code แล้ว''' ,
//       textAlign: TextAlign.left,
//                 style: TextStyle(fontSize: 20.0, color: Colors.white,fontFamily: 'Prompt', height: 1.5,fontWeight: FontWeight.w400,

//           ),
//               ),
//               SizedBox(
//                 width: 1.0,
//               ),

//             ],
//           ),
//           color: Color(
//             0xFF448AFF,
//           ),
//           shape: RoundedRectangleBorder(
//             borderRadius: new BorderRadius.circular(2.0),
//           ),
//         ));
//   }

  Widget longinsername() {
    return Container(
        margin: new EdgeInsets.symmetric(horizontal: 30.0),
        width: MediaQuery.of(context).size.width * 0.95,
        height: 137.0,
        child: RaisedButton(
          onPressed: () {
            MaterialPageRoute route =
                MaterialPageRoute(builder: (value) => Login());
            Navigator.push(context, route);
          },
          child: Text(
            '''1) ลงทะเบียนผู้ใช้งาน
  longin with user name + PW
  กรณีไม่ตั้งค่า Pin Code''',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Prompt',
              fontSize: 20.0,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.left,
          ),
          
          color: Colors.blue[400],
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(2.0),
          ),
        ));
  }

  Widget longinpin() {
    return Container(
        margin: new EdgeInsets.symmetric(horizontal: 30.0),
        width: MediaQuery.of(context).size.width * 0.85,
        height: 137.0,
        child: RaisedButton(
          onPressed: () {
            MaterialPageRoute route =
                MaterialPageRoute(builder: (value) => Login());
            Navigator.push(context, route);
          },
          child: Text(
            '''2) login with Pin Code
    กรณีตั้งค่า Pin Code แล้ว''',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Prompt',
              fontSize: 20.0,
              fontWeight: FontWeight.w400,
        
            ),
            textAlign: TextAlign.left,
          ),
          color: Colors.blue[400],
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(2.0),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
        //      width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
            children: <Widget>[
              longinsername(), 
              SizedBox(
                height: 30.0,
                ),

              longinpin(),
              // showAppName(),
            ],
          ),
        ),
      ),
    );
  }
}
