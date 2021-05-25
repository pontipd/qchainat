// import 'dart:convert';

// import 'package:chainatqueue/models/getDepartment.dart';
// import 'package:chainatqueue/screens/Selectdentist.dart';
// import 'package:chainatqueue/screens/internaldetail.dart';
// import 'package:flutter/material.dart';

// import 'package:http/http.dart' as http;

// class Departments extends StatefulWidget {
//   final String hn, ptname, dob, cid, age;
//   Departments({Key key, this.age, this.cid, this.dob, this.hn, this.ptname})
//       : super(key: key);

//   @override
//   _DepartmentState createState() => _DepartmentState();
// }

// class _DepartmentState extends State<Departments> {
//   List<GetDepartments> getDepartments = List();
//   String serviceGroup_id, hn, ptname, cid, age;

//   @override
//   void initState() {
//     super.initState();
//     department();
  
//   }

//    Future<Null> department() async {
//     var header = {'Content-Type': 'application/json'};
//     var url = Uri.parse(
//         'http://q.chainathospital.org/node/api/get_servicegroup_list');

//     var response = await http.get(url, headers: header);
//     var result = json.decode(response.body);

//     for (var map in result) {
//       GetDepartments getDepartment = GetDepartments.fromJson(map);
//       setState(() {
//         getDepartments.add(getDepartment);
//       });
//     }
//     //   setState(() {

//     //  getDepartments.add(getDepartment);
//     //   });
//   }
//   Widget build(BuildContext context) {
//     ptname = "${widget.ptname}";
//     hn = "${widget.hn}";
//     cid = "${widget.cid}";
//     age = "${widget.age}";
//     return Scaffold(
//       backgroundColor: Color(
//         0xff0baabd,
//       ),
//       body: Center(
//         child: Container(
//           height: MediaQuery.of(context).size.height,
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Padding(padding: EdgeInsets.only(top: 30.0)),
//                 Card(
//                     color: Color(
//                       0xffeff7f9,
//                     ),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12.0),
//                     ),
//                     child: Container(
//                       width: MediaQuery.of(context).size.width * 0.9,
//                       // child: Mystyle().head(),
//                     )),
//                 Padding(padding: EdgeInsets.only(top: 20.0)),
//                 Container(
//                   width: MediaQuery.of(context).size.width * 0.9,
//                   child: Text(
//                     "เลือกแผนก/คลินิก",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 35,
//                       fontWeight: FontWeight.w400,
//                       fontFamily: "Roboto",
//                     ),
//                     textAlign: TextAlign.left,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 Card(
//                   color: Colors.white,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12.0),
//                   ),
//                   child: Container(
//                     margin: new EdgeInsets.symmetric(horizontal: 30.0),
//                     width: MediaQuery.of(context).size.width * .9,
//                     // height: MediaQuery.of(context).size.height,
//                     // height: 400,
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           child: Align(
//                             alignment: Alignment.topLeft,
//                             child: Text(
//                               "ข้อมูลผู้รับบริการ",
//                               style: TextStyle(
//                                 color: Color(
//                                   0xff4f4f4f,
//                                 ),
//                                 fontSize: 28,
//                                 fontWeight: FontWeight.w400,
//                                 fontFamily: "Roboto",
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10.0,
//                         ),
//                         Container(
//                           width: MediaQuery.of(context).size.width,
//                           decoration: BoxDecoration(
//                               border:
//                                   Border.all(color: Colors.orange, width: 2),
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(20))),
//                           child: Column(
//                             children: [
//                               SizedBox(
//                                   child: Align(
//                                 alignment: Alignment.center,
//                                 child: Text(ptname,
//                                     style: TextStyle(
//                                       color: Color(
//                                         0xff7b8794,
//                                       ),
//                                       fontSize: 24,
//                                     )),
//                               )),
//                               SizedBox(
//                                 height: 10.0,
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: <Widget>[
//                                   Column(
//                                     children: <Widget>[
//                                      // Text(
//                                         "HN",
//                                         style: TextStyle(
//                                           color: Color(
//                                             0xff666666,
//                                           ),
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.w400,
//                                           fontFamily: "Roboto",
//                                         ),
//                                         textAlign: TextAlign.center,
//                                       ),
//                                       Text(
//                                         hn,
//                                         style: TextStyle(
//                                           color: Color(
//                                             0xff666666,
//                                           ),
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.w400,
//                                           fontFamily: "Roboto",
//                                         ),
//                                         textAlign: TextAlign.center,
//                                       ),
//                                     ],
//                                   ),
//                                   SizedBox(
//                                     width: 15.0,
//                                   ),
//                                   Column(
//                                     children: <Widget>[
//                                       Text(
//                                         "เลขที่บัตรประจำตัวประชาชน",
//                                         style: TextStyle(
//                                           color: Color(
//                                             0xff666666,
//                                           ),
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.w400,
//                                           fontFamily: "Roboto",
//                                         ),
//                                         textAlign: TextAlign.center,
//                                       ),
//                                       Text(
//                                        cid,
//                                         style: TextStyle(
//                                           color: Color(
//                                             0xff666666,
//                                           ),
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.w400,
//                                           fontFamily: "Roboto",
//                                         ),
//                                         textAlign: TextAlign.center,
//                                       ),
//                                     ],
//                                   ),
//                                   SizedBox(
//                                     width: 15.0,
//                                   ),
//                                   Column(
//                                     children: <Widget>[
//                                       Text(
//                                         "อายุ",
//                                         style: TextStyle(
//                                           color: Color(
//                                             0xff666666,
//                                           ),
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.w400,
//                                           fontFamily: "Roboto",
//                                         ),
//                                         textAlign: TextAlign.center,
//                                       ),
//                                       Text(
//                                         age,
//                                         style: TextStyle(
//                                           color: Color(
//                                             0xff666666,
//                                           ),
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.w400,
//                                           fontFamily: "Roboto",
//                                         ),
//                                         textAlign: TextAlign.center,
//                                       ),
//                                     ],
//                                   ),
//                                   SizedBox(
//                                     width: 15.0,
//                                   ),
//                                   Column(
//                                     children: <Widget>[
//                                       Text(
//                                         "สิทธิการรักษา",
//                                         style: TextStyle(
//                                           color: Color(
//                                             0xff666666,
//                                           ),
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.w400,
//                                           fontFamily: "Roboto",
//                                         ),
//                                         textAlign: TextAlign.center,
//                                       ),
//                                       Text(
//                                        'สิทธิหลักประกันแห่งชาติ USC',
//                                         style: TextStyle(
//                                           color: Color(
//                                             0xff666666,
//                                           ),
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.w400,
//                                           fontFamily: "Roboto",
//                                         ),
//                                         textAlign: TextAlign.center,
//                                       ),
//                                     ],
//                                   )
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 10.0,
//                               ),
//                             ],
//                           ),
//                         ),

//                         SizedBox(
//                           height: 20.0,
//                         ),
//                         // button(),
//                         // SizedBox(
//                         //   height: 10.0,
//                         // ),
//                         Container(
//                           width: MediaQuery.of(context).size.width * 0.9,
//                           child: Text(
//                             'รายการ ',
//                             style: TextStyle(
//                               color: Color(
//                                 0xff4f4f4f,
//                               ),
//                               fontSize: 30,
//                               fontWeight: FontWeight.w400,
//                               fontFamily: "Roboto",
//                             ),
//                           ),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Container(
//                               width: MediaQuery.of(context).size.width * 0.4,
//                               child: ListView.builder(
//                                 itemCount: 1,
//                                 shrinkWrap: true,
//                                 itemBuilder:
//                                     (BuildContext context, int index) =>
//                                         Container(
//                                   width:
//                                       MediaQuery.of(context).size.width * .45,
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: 10.0, vertical: 5.0),
//                                   child: Card(
//                                     color: Color(
//                                       0xff0baabd,
//                                     ),
//                                     elevation: 2.0,
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(12.0),
//                                     ),
//                                     child: InkWell(
//                                       onTap: () {
//                                         MaterialPageRoute route =
//                                             MaterialPageRoute(
//                                                 builder: (value) =>
//                                                     Internaldetail(
//                                                       getDepartment:
//                                                           getDepartments[0],
//                                                           // ptname: ptname,
//                                                           // cid: cid,
//                                                           // hn: hn,
//                                                           // age: age,

//                                                     ));
//                                         Navigator.push(context, route);
//                                       },
//                                       child: Container(
//                                         height: 70.0,
//                                         width:
//                                             MediaQuery.of(context).size.width,
//                                         padding: EdgeInsets.symmetric(
//                                             horizontal: 10.0),
//                                         child: Row(
//                                           children: [
//                                             Text(
//                                               getDepartments[0]
//                                                   .servicegroupName,
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 20),
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               width: MediaQuery.of(context).size.width * 0.4,
//                               child: ListView.builder(
//                                 itemCount: 1,
//                                 shrinkWrap: true,
//                                 itemBuilder:
//                                     (BuildContext context, int index) =>
//                                         Container(
//                                   width:
//                                       MediaQuery.of(context).size.width * .45,
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: 10.0, vertical: 5.0),
//                                   child: Card(
//                                     color: Color(
//                                       0xff0baabd,
//                                     ),
//                                     elevation: 2.0,
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(12.0),
//                                     ),
//                                     child: InkWell(
//                                       onTap: () {
//                                         MaterialPageRoute route =
//                                             MaterialPageRoute(
//                                                 builder: (value) => Dentist(
//                                                       getDepartments:
//                                                           getDepartments[1], 
//                                                           // ptname: ptname,
//                                                           // cid: cid,
//                                                           // hn: hn,
//                                                           // age: age,
//                                                     ));
//                                         Navigator.push(context, route);
//                                       },
//                                       child: Container(
//                                         height: 70.0,
//                                         width:
//                                             MediaQuery.of(context).size.width,
//                                         padding: EdgeInsets.symmetric(
//                                             horizontal: 10.0),
//                                         child: Row(
//                                           children: [
//                                             Text(
//                                               getDepartments[1]
//                                                   .servicegroupName,
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 20),
//                                             )
//                                           ],
//                                         ),
//                                         //  widget(child: Container(alignment: Alignment.center,))
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 20.0,
//                         ),
//                         Container(
//                           width: MediaQuery.of(context).size.width * 0.9,
//                           child: Container(
//                               // margin: new EdgeInsets.symmetric(horizontal: 30.0),
//                               child: Center(
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: <Widget>[
//                                 Container(
//                                   height: 50.0,
//                                   child: RaisedButton(
//                                     onPressed: () {
//                                       Navigator.pop(context);
//                                     },
//                                     child: Row(
//                                       children: [
//                                         Icon(
//                                           Icons.reply_all,
//                                           color: Colors.grey[600],
//                                         ),
//                                         Text(
//                                           'ย้อนกลับ ',
//                                           style: TextStyle(
//                                             fontSize: 22.0,
//                                             color: Color(
//                                               0xff727876,
//                                             ),
//                                           ),
//                                           textAlign: TextAlign.center,
//                                         ),
//                                       ],
//                                     ),
//                                     color: Colors.white,
//                                     shape: RoundedRectangleBorder(
//                                       side: BorderSide(
//                                           color: Colors.orange,
//                                           width: 1,
//                                           style: BorderStyle.solid),
//                                       borderRadius:
//                                           new BorderRadius.circular(12.0),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           )),
//                         ),
//                         SizedBox(
//                           height: 20.0,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 Padding(padding: EdgeInsets.only(top: 40.0)),
//                 Container(
//                   width: MediaQuery.of(context).size.width * 0.9,
//                   // child: Mystyle().bottomBar(),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
