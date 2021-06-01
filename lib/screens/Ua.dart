import 'dart:convert';

import 'package:async/async.dart';
import 'package:chainatqueue/models/getDepartment.dart';
import 'package:chainatqueue/models/gethresult.dart';
import 'package:chainatqueue/models/getserviceList.dart';
import 'package:chainatqueue/models/hresulty.dart';
import 'package:chainatqueue/screens/CBC.dart';
import 'package:chainatqueue/screens/CH.dart';
import 'package:chainatqueue/screens/Ua.dart';
import 'package:chainatqueue/screens/bookQresHN.dart';
import 'package:chainatqueue/screens/concluderesu.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:kioskregis/model/department.dart';
// import 'package:kioskregis/model/getserviceList.dart';
// import 'package:kioskregis/mystyle.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';

class UA extends StatefulWidget {
  final GetDepartments getDepartment;
  final GetHresult result;
  final hresult;
  final Hresulty hresulty;

  int index = 0;

  UA(
      {Key key, this.getDepartment, this.result, this.hresult, this.hresulty})
      : super(key: key);

  @override
  _UAState createState() => _UAState();
}

class _UAState extends State<UA> {
  set floatingActionButton(Container floatingActionButton) {}
  String departmentName, servicename;
  GetDepartments getDepartment;
  Hresulty hresulty;

  var a;
  @override
  Widget build(BuildContext context) {
    var results = widget.hresulty;
    print('sssssss $results');
    Widget _cardColumn(String title, String subTitle, String desc,
        Function callback, bool showAction) {
      return Card(
        elevation: 4,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 60,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                alignment: Alignment.centerLeft,
                // color: Colors.amber,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      // "$departmentName",
                      style: TextStyle(
                        color: Color(
                          0xff116EA8,
                        ),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Kanit",
                      ),

                      // textAlign: TextAlign.left,
                    ),
                    Text(
                      subTitle,
                      // "$departmentName",
                      style: TextStyle(
                        color: Color(
                          0xff116EA8,
                        ),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Kanit",
                      ),

                      // textAlign: TextAlign.left,
                    )
                  ],
                ),
              ),
            ),
           
          ],
        ),
      );
    }

    var _txtStyle = TextStyle(
      color: Color(
        0xff116EA8,
      ),
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontFamily: "Kanit",
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "UA ตรวจปัสสาวะ ",
          style: GoogleFonts.prompt(
            fontSize: 24.0,
            color: Color(
              0xff116EA8,
            ),
          ),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.grey),
            onPressed: () {
              Navigator.pop(context);
            }
            //  onPressed: () =>
            //   Navigator.of(context).pop(),

            ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.90,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.90,
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  Column(
                    children: [
                      CardDescription('UA_Glucose', 'ตรวจปัสสาวะ',
                           widget.hresulty?.UA_Glucose ?? "-", null, false),
                      SizedBox(
                        height: 10,
                      ),
                      CardDescription('UA_Protein', 'ตรวจปัสสาวะ',
                          results?.UA_Protein ?? "-", null, false),
                      SizedBox(
                        height: 10,
                      ),
                      CardDescription('UA_pH', 'ตรวจปัสสาวะ',
                          results?.UA_pH ?? "-", null, false),
                      SizedBox(
                        height: 10,
                      ),
                      CardDescription('UA_SpGr', 'ตรวจปัสสาวะ',
                          results?.UA_SpGr ?? "-", null, false),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CardDescription extends StatelessWidget {
  String title;
  String subTitle;
  Function callback;
  String desc;
  bool showAction;

  CardDescription(
      this.title, this.subTitle, this.desc, this.callback, this.showAction);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 60,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              alignment: Alignment.centerLeft,
              // color: Colors.amber,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    // "$departmentName",
                    style: TextStyle(
                      color: Color(
                        0xff116EA8,
                      ),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Kanit",
                    ),

                    // textAlign: TextAlign.left,
                  ),
                  Text(
                    subTitle,
                    // "$departmentName",
                    style: TextStyle(
                      color: Color(
                        0xff116EA8,
                      ),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Kanit",
                    ),

                    // textAlign: TextAlign.left,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 40,
            child: Container(
              // margin: EdgeInsets.symmetric(horizontal: 8),
              alignment: Alignment.bottomRight,
              // color: Colors.blue,
              child: showAction
                  ? TextButton(
                      child: Text(
                        '    รายละเอียด',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.orange),
                      ),
                      onPressed: callback,
                    )
                  : Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Text(
                        desc,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.orange),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
