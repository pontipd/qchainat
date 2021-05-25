// import 'dart:convert';
// import 'dart:convert' as convert;
// import 'package:chainatqueue/models/Queuelist.dart';
// import 'package:chainatqueue/models/album.dart';
// import 'package:chainatqueue/models/appoint.dart';
// import 'package:chainatqueue/models/checkhnso.dart';
// import 'package:chainatqueue/models/getAppointment.dart';
// import 'package:chainatqueue/models/getgueue.dart';
// import 'package:chainatqueue/models/gethresult.dart';
// import 'package:chainatqueue/models/getnhso.dart';
// import 'package:chainatqueue/models/getrx.dart';
// import 'package:chainatqueue/models/hresulty.dart';
// import 'package:chainatqueue/models/patineModel.dart';
// import 'package:chainatqueue/models/rxqn.dart';
// import 'package:chainatqueue/models/user_model.dart';
// import 'package:chainatqueue/screens/Medicineroom.dart';
// import 'package:chainatqueue/screens/Selectdepartment.dart';
// import 'package:chainatqueue/screens/appointmentdetil.dart';
// import 'package:chainatqueue/screens/comrx.dart';
// import 'package:chainatqueue/screens/dentist.dart';
// import 'package:chainatqueue/screens/getmedicine.dart';
// import 'package:chainatqueue/screens/getmedlist.dart';
// import 'package:chainatqueue/screens/internaldetail.dart';
// import 'package:chainatqueue/screens/page1.dart';
// import 'package:chainatqueue/screens/page2.dart';
// import 'package:chainatqueue/screens/page3.dart';
// import 'package:chainatqueue/screens/queue.dart';
// import 'package:chainatqueue/screens/queueQr.dart';
// import 'package:chainatqueue/screens/startouse.dart';
// import 'package:chainatqueue/transitions/enter_exit_route.dart';
// import 'package:chainatqueue/utility/main_drawer.dart';
// import 'package:chainatqueue/utility/my_style.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;
// import 'package:async/async.dart';
// import 'package:page_transition/page_transition.dart';


// final FirebaseAuth _auth = FirebaseAuth.instance;
// int selectedPage = 0;
// final _pageOptions = [Page1(), Page5(), Drugdispen(), Page3(), Page2()];

// class Page5 extends StatefulWidget {
//   String ptname, cid, age, pt, inputHn;
//   // Getappointmen getappointment;

//   Page5({
//     Key key,
//     this.age,
//     this.cid,
//     this.inputHn,
//     this.ptname,
//     this.pt,
//   }) : super(key: key);
//   @override
//   _Page5State createState() => _Page5State();
// }

// class _Page5State extends State<Page5> {
//   Future<List<Album>> futureAlbum;
//   String displayname, inputHn;
//   Future<List<Appoint>> getappointments;
//   Future<List<Hresulty>> hresulty;
//   Future<List<Rxqn>> rxqn;
//   Future<List<Queuelist>> queuelist;
//   List<GetRx> getrX = List();

//   List<ChackHnso> checkHnso = List();
//   var hnso;
//   ChackHnso chackHnso;
//   String staus;
//   bool status;
//   String rxtype;
//   String rxid,
//       qfir,
//       count,
//       servicid,
//       servicgroub,
//       q,
//       qids,
//       oldStatus = '0',
//       statusDrug = '0';
//   int qstatus;
//   User user;
//   UserModel patient;
//   String birth;
//   int countSelect;
//   String fname;
//   String hmain;
//   String hmainName;
//   String lname;
//   String maininscl;
//   String maininsclMain;
//   String maininsclName;
//   String nation;
//   String personId;
//   String primaryAmphurName;
//   String primaryMoo;
//   String primaryMoobanName;
//   String primaryProvinceName;
//   String primaryTumbonName;
//   String primaryprovince;
//   String purchaseprovince;
//   String purchaseprovinceName;
//   String sex;
//   String startdate;
//   String startdateSss;
//   String subinscl;
//   String subinsclName;
//   String title;
//   String titleName;
//   String wsDataSource;
//   String wsDateRequest;
//   String wsStatus;
//   String wsStatusDesc;
//   String wsid;
//   String pt;
//   String wsidBatch;
//   var floatingActionButton;
//   bool loading = false;
//   var now = DateTime.now();
//   var date;
//   @override
//   void initState() {
//     super.initState();
//     finddisplay();
//     loading = true;
//     fetchAppoints(hns);
//     onGetData(hns);
//     inputHn = "${widget.inputHn}";
//     // cid = "${widget.cid}";
//     // print('pppppppppppppppppppppppppppppp=>$cid')
    
//     print(_auth.currentUser);
//     user = _auth.currentUser;

//     getuser();
  
//     // getAppointment();
//     readData();

//     Map<String, dynamic> _map = {"qn": 1283, "date": "2021-04-20"};
//     //Map<String, dynamic> _map = {"qn": 1379, "date": "2021-04-20"};
//     //{"qn": 1378, "date": "2021-04-20"} rxtyer =1 countdurg ไม่ใช่0
//     //ไม่ได้ {"qn": 1575, "date": "2021-04-20"}
//     var json = jsonEncode(_map);
//     medList(http.Client(), json);

//     var month = now.month.toString().padLeft(2, '0');
//     var day = now.day.toString().padLeft(2, '0');
//     date = "${now.year}" + "-" + "$month" + "-" + "$day";
//     print(date);
//     // futureAlbum = fetchAlbum();
//   }

//   Future<User> getuser() async {
//     await FirebaseFirestore.instance
//         .collection('user')
//         .doc(user.uid)
//         .get()
//         .then((DocumentSnapshot documentSnapshot) {
//       if (documentSnapshot.exists) {
//         //
//         print(documentSnapshot.data());
//         patient = UserModel(hns: documentSnapshot.data()['hns']);

//         // fetch();
//         print(
//             '-----------------------------Document data: ${documentSnapshot.data()} ');
//         hns = patient.hns;
//         cids =patient.cids;

//         // Map<String, dynamic> _map = {"qn": 1272, "date": "2021-03-04"};
//         // var data = jsonEncode(_map);
//         onGetData(hns);
//         fetchAppoints(hns);
//         getPtright(cids);
//         // fetchs(data);
//         // medList(http.Client(), json);
//         print('hns==== $hns');
//       } else {
//         print('Document does not exist on the database');
//       }
//     });
//   }

//   Future<Null> finddisplay() async {
//     await Firebase.initializeApp().then((value) async {
//       await FirebaseAuth.instance.authStateChanges().listen((event) {
//         displayname = event.displayName;
//         inputHn = event.displayName;
//         print('## = $displayname');
//         print('##12 = $inputHn');
//         // getAppointment();
//       });
//     });
//     // checkAppointment;
//   }

//   Future<Null> readData() async {
//     await Firebase.initializeApp().then((value) {
//       print('init');
//     });
//   }
// Future<Null> getPtright(cids) async {
//     var url =
//         Uri.parse('http://q.chainathospital.org/app/kiosk/pt-right?cid=$cids');
//     try {
//       final http.Response response = await http.Client().get(
//         url,
//       );
//       print('res = $response');
//       var result = json.decode(response.body);
//       print('result = $result');
//       GetNHSO getptright = GetNHSO.fromJson(convert.jsonDecode(response.body));
//       if (getptright.toString() != null) {
//         setState(() {
//           pt = getptright.subinsclName;
//           birth = getptright.birthdate;
//           // countSselect = getptright.countSelect;
//           fname = getptright.fname;
//           lname = getptright.lname;
//           maininscl = getptright.maininscl;
//           maininsclMain = getptright.maininsclMain;
//           maininsclName = getptright.maininsclName;
//           nation = getptright.nation;
//           primaryAmphurName = getptright.primaryAmphurName;
//           personId = getptright.personId;
//           primaryAmphurName = getptright.primaryAmphurName;
//           primaryMoo = getptright.primaryMoo;
//           primaryMoobanName = getptright.primaryMoobanName;
//           primaryProvinceName = getptright.primaryprovince;
//           primaryTumbonName = getptright.primaryTumbonName;
//           primaryprovince = getptright.primaryprovince;
//           purchaseprovince = getptright.purchaseprovince;
//           purchaseprovinceName = getptright.purchaseprovinceName;
//           sex = getptright.sex;
//           startdate = getptright.startdate;
//           startdateSss = getptright.startdateSss;
//           subinscl = getptright.subinscl;
//           subinsclName = getptright.subinsclName;
//           title = getptright.title;
//           titleName = getptright.titleName;
//           wsDataSource = getptright.wsDataSource;
//           wsDateRequest = getptright.wsDateRequest;
//           wsStatus = getptright.wsStatus;
//           wsStatusDesc = getptright.wsStatusDesc;
//           wsid = getptright.wsid;
//           wsidBatch = getptright.wsidBatch;
//           print('555555555555555555555555555555555555555555$subinsclName');
//           // checkappointment();
//         });
//       }
//     } catch (e) {}
//   }
//   Future<List<Queuelist>> fetchAppoints(hns) async {
//     var header = {'Content-Type': 'application/json'};
//     var url = Uri.parse(
//         'http://q.chainathospital.org/app/kiosk/queue-list?hn=$hns');

//     final http.Response response = await http.Client().get(
//       url,
//     );

//     if (response.statusCode == 200) {
//       // If the server did return a 200 OK response,
//       // then parse the JSON.
//       final result = jsonDecode(response.body);
//       if (result['status'] == false) {
//         print('#########3');
//         setState(() {
//           // getappointments = Future.value();
//           loading = false;
//         });
//       } else {
//         print('rrrrrr=${result['data']}');

//         List<Object> data = result['data'];

//         setState(() {
//           loading = false;
//           queuelist = Future.value(
//               data.map((job) => new Queuelist.fromJson(job)).toList());
//           // checkhnso();
//         });
//       }
//     } else {
//       loading = false;
//       throw Exception('Failed to load album');
//     }
//   }

//   Future _refreshData() async {
//     await Future.delayed(Duration(seconds: 5));
//     setState(() {});
//   }

//   Future test(int value) {
//     print(value);
//   }

//   Future<Null> medList(http.Client client, var json) async {
//     print('44444444444$json');
//     var url = Uri.parse(
//         'http://chainathospital.org/coreapi/api/v2/get_rx_list_by_qn');

//     print('ooooooooooooooooooooooooooo');

//     try {
//       final response = await client.post(url,
//           headers: {"Content-Type": "application/json"}, body: json);
//       var body = jsonDecode(response.body);
//       if (response.statusCode == 200) {
//         if (body['status'] == true && body['data'] != null) {
//           GetRx getRx = GetRx.fromJson(body);
//           print(getRx.data);
//           if (getRx.data.length != 0) {
//             final firstItem = getRx.data.elementAt(0);
//             print('firstItem: ${firstItem.rxOperatorId}');
//             rxtype = getRx.data[0].rxType;
//             rxid = getRx.data[0].rxOperatorId;
//             count = getRx.data[0].countdrug;
//             qfir = getRx.data[0].qfinace;
//             hn = getRx.data[0].hn;
//             print('#########################################hn ====> $hn');
//             print('#########################################qfir ====>$qfir');
//             print(
//                 '#########################################count ====> $count');
//             print(
//                 '#########################################rxType===> $rxtype');
//             print(
//                 '#########################################rxOperatorId===> $rxid');

//             // print(getRx.data[0].rxOperatorId);

//             // print(getRx.data[0].dataPharmacy[0].pharmacyDrugName);
//             // if (getRx.data[0].dataPharmacy != null) {
//             //   for (var i = 0; i < getRx.data[0].dataPharmacy.length; i++) {
//             //     setState(() {

//             //       // rxtype = getRx.data[0].rxType;
//             //     });
//             //   }
//             // }
//           } else {
//             final snackBar = SnackBar(content: Text('ไม่พบข้อมูล.'));
//             ScaffoldMessenger.of(context).showSnackBar(snackBar);
//           }
//         } else {
//           final snackBar = SnackBar(content: Text('ไม่พบข้อมูล.'));
//           ScaffoldMessenger.of(context).showSnackBar(snackBar);
//         }
//       } else {
//         throw Exception('Failed to load data');
//       }

//       setState(() {
//         loading = false;
//       });
//     } catch (e) {
//       print(e);
//       final snackBar = SnackBar(content: Text('Failed to load data.'));
//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//       setState(() {
//         loading = false;
//       });
//     }
//   }

//   Future<void> onGetData(hns) async {
//     var header = {'Content-Type': 'application/json'};
//     var url = Uri.parse(
//         'http://chainathospital.org/coreapi/api/v2/get_patient_info/$hns');

//     var response = await http.get(url, headers: header);

//     try {
//       PatientModel patientModel =
//           PatientModel.fromJson(convert.jsonDecode(response.body));
//       if (patientModel.status == false) {
//         isHasData = false;
//         setState(() {
//           ptname = '';
//           hn = '';
//           age = '';
//           dob = '';
//           cid = '';
//         });
//       } else {
//         isHasData = true;
//         setState(() {
//           ptname = patientModel.data[0].ptName;
//           hn = patientModel.data[0].hn;
//           age = patientModel.data[0].age;
//           dob = patientModel.data[0].dob;
//           cid = patientModel.data[0].cid;
//         });
//       }
//       print('44444444444444444444====$hn');
//       print('44444444444444444444====$age');
//       print('44444444444444444444====$ptname');
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //     bottomNavigationBar: ConvexAppBar(
//       //   items: [
//       //     TabItem(icon: Icons.home, title: 'Home'),
//       //     TabItem(icon: Icons.map, title: 'Discovery'),
//       //     TabItem(icon: Icons.add, title: 'Add'),
//       //     TabItem(icon: Icons.message, title: 'Message'),
//       //     TabItem(icon: Icons.people, title: 'Profile'),
//       //   ],
//       //   initialActiveIndex: 2,//optional, default as 0
//       //   onTap: (int i) => print('click index=$i'),
//       // ),
//       appBar: AppBar(
//         title: Text('คิวตรวจ/ห้องจ่ายยา'),
//       ),

//       // appBar: PreferredSize(
//       //   preferredSize: Size.fromHeight(60.0),
//       //   // here the desired height
//       //   child: AppBar(
//       //     backgroundColor: Color(
//       //       0xff089EAD,
//       //     ),
//       //     title: Text(
//       //       "คิวตรวจ/ห้องจ่ายยา",
//       //       style: GoogleFonts.prompt(fontSize: 22.0, color: Colors.white),
//       //       textAlign: TextAlign.center,
//       //     ),
//       // actions: <Widget>[
//       //   Container(
//       //     width: 60.0,
//       //     child: Align(
//       //       alignment: Alignment.center,
//       //       child: Image.asset(
//       //         'images/person.png',
//       //         color: Colors.white,
//       //         width: 70.0,
//       //       ),
//       //     ),
//       //   )
//       // ],

//       // ),      ),
//       drawer: MainDrawer(),
//       body: Center(
//         child: Container(
//           //  color: Colors.cyan[400],
//           width: MediaQuery.of(context).size.width * 0.90,
//           height: MediaQuery.of(context).size.height,
//           child: Column(
//             children: [
//               // Padding(padding: EdgeInsets.only(top: 20.0)),
//               // Center(
//               //   child: Text(
//               //     'คิวตรวจ/ห้องจ่ายยา',
//               //     style: TextStyle(
//               //       fontSize: 25,
//               //       fontWeight: FontWeight.bold,
//               //       color: Colors.cyan[400],
//               //     ),
//               //     textAlign: TextAlign.right,
//               //   ),
//               // ),
//               SizedBox(
//                 height: 60.0,
//               ),
//               Expanded(
//                 flex: 8,
//                 child: Center(
//                     child: RefreshIndicator(
//                   onRefresh: _refreshData,
//                   child: FutureBuilder<List<Queuelist>>(
//                     future: queuelist,
//                     builder: (context, snapshot) {
//                       if (snapshot.hasData) {
//                         return ListView.builder(
//                           itemCount: snapshot.data.length,
//                           itemBuilder: (context, index) {
//                             return AppointItem(
//                                 queuelist: snapshot.data[index], testfn: test);
//                           },
//                         );
//                       } else if (snapshot.hasError) {
//                         return Text("error${snapshot.error}");
//                       } else if (!loading && !snapshot.hasData) {
//                         return InkWell(
//                           child: Row(
//                             children: [
//                               Column(
//                                 children: [
//                                   Padding(padding: EdgeInsets.only(top: 10.0)),
//                                   Container(
//                                     width:
//                                         MediaQuery.of(context).size.width * 0.9,
//                                     height: 50.0,
//                                     child: Text(
//                                       'ท่านยังไม่มีคิวห้องตรวจ/ห้องจ่ายยา',
//                                       style: GoogleFonts.prompt(
//                                         fontSize: 22.0,
//                                         fontWeight: FontWeight.w400,
//                                         color: Colors.grey[600],
//                                       ),
//                                       textAlign: TextAlign.center,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 25,
//                                   ),
//                                   Container(
//                                     width:
//                                         MediaQuery.of(context).size.width * 0.9,
//                                     height: 270.0,
//                                     decoration: BoxDecoration(
//                                         image: DecorationImage(
//                                             image:
//                                                 AssetImage('images/go.png'))),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         );
//                       }

//                       // By default, show a loading spinner.
//                       return CircularProgressIndicator();
//                     },
//                   ),
//                 )),
//               ),
//               SizedBox(
//                 height: 20.0,
//               ),
//               floatingActionButton = Container(
//                 width: MediaQuery.of(context).size.width * 0.85,
//                 height: 50.0,
//                 child: FloatingActionButton(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(7.5)),
//                   clipBehavior: Clip.antiAlias,
//                   onPressed: () {
//                     MaterialPageRoute route = MaterialPageRoute(
//                         builder: (value) => Department(
//                               inputHn: inputHn,
//                               ptname: ptname,
//                               name: name,
//                               cid: cid,
//                               age: age,
//                             ));
//                     Navigator.push(context, route);
//                   },
//                   backgroundColor: Color(
//                     0xffef8b43,
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                         width: MediaQuery.of(context).size.width * 0.85,
//                       ),
//                       Text(
//                         'คิวตรวจรักษา',
//                         style: GoogleFonts.prompt(fontSize: 18.0),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20.0,
//               ),
//               floatingActionButton = Container(
//                 width: MediaQuery.of(context).size.width * 0.85,
//                 height: 50.0,
//                 child: FloatingActionButton(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(7.5)),
//                   clipBehavior: Clip.antiAlias,
//                   onPressed: () async {
//                     if (count == '0') {
//                       if (qfir == '1') {
//                         setState(() {
//                           servicid = '54';
//                           qstatus = 11;
//                           servicgroub = '26';
//                         });
//                         print('serviceId $servicid');
//                         print('ServiceGroup $servicgroub');
//                         print('qstatus $qstatus');
//                         await savequeue();
//                       } else if (qfir == '0') {
//                         await noHasDataDialog(context);
//                       }
//                     } else if (rxtype == '2') {
//                       showDialog<String>(
//                         context: context,
//                         builder: (BuildContext context) => AlertDialog(
//                           // title: const Text(''),
//                           content: const Text(
//                               'ท่านต้องการเลือกรับยา\nใกล้บ้านหรือไม่?'),
//                           actions: <Widget>[
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.pop(context, 'Cancel');
//                                 Navigator.push(
//                                   context,
//                                   PageTransition(
//                                     type: PageTransitionType.rightToLeft,
//                                     child: Comrx(
//                                       rxid: rxid,
//                                       count: count,
//                                       qfir: qfir,
//                                       age: age,
//                                     ),
//                                   ),
//                                 );
//                               },
//                               child: const Text('ไม่ต้องการ'),
//                             ),
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.pop(context, 'Ok');
//                                 Navigator.push(
//                                   context,
//                                   PageTransition(
//                                     type: PageTransitionType.rightToLeft,
//                                     child: Medicineroom(
//                                       rxid: rxid,
//                                       count: count,
//                                       qfir: qfir,
//                                       age: age,
//                                       ptname: ptname,
//                                       hn: hn,
//                                     ),
//                                   ),
//                                 );
//                               },
//                               child: const Text('ต้องการ'),
//                             ),
//                           ],
//                         ),
//                       );
//                       // if (count == '0') {
//                       //   if (qfir == '1') {
//                       //     setState(() {
//                       //       servicid = '55';
//                       //       qstatus = 11;
//                       //       servicgroub = '26';
//                       //     });
//                       //   } else if (qfir == '0') {
//                       //     await noHasDataDialog(context);
//                       //   }
//                       // // }
//                       //  else {
//                       // Navigator.push(
//                       //   context,
//                       //   PageTransition(
//                       //     type: PageTransitionType.leftToRight,
//                       //     child: Medicineroom(
//                       //       age: age,
//                       //       rxid: rxid,
//                       //       count: count,
//                       //       qfir: qfir,
//                       //     ),
//                       //   ),
//                       // );
//                       // }
//                     } else {
//                       print('age $age');
//                       Navigator.push(
//                         context,
//                         PageTransition(
//                           type: PageTransitionType.leftToRight,
//                           child: Comrx(
//                             age: age,
//                             rxid: rxid,
//                             count: count,
//                             qfir: qfir,
//                           ),
//                         ),
//                       );

//                       // if (count == '0') {
//                       //   if (qfir == '1') {
//                       //     setState(() {
//                       //       servicid = '55';
//                       //       qstatus = 11;
//                       //       servicgroub = '26';
//                       //     });
//                       //     await savequeue();
//                       //   } else if (qfir == '0') {
//                       //     await noHasDataDialog(context);
//                       //   }
//                       // }
//                       // else {
//                       //   await Navigator.push(
//                       //     context,
//                       //     PageTransition(
//                       //       type: PageTransitionType.leftToRight,
//                       //       child: Comrx(
//                       //         rxid: rxid,
//                       //         count: count,

//                       //         qfir: qfir,
//                       //         age: age,
//                       //         // ptname: ptname,
//                       //         // inputHn: inputHn,
//                       //         // cid: cid,
//                       //       ),
//                       //     ),
//                       //   );
//                       // }
//                     }
//                   },
//                   //

//                   backgroundColor: Color(
//                     0xffef8b43,
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                         width: MediaQuery.of(context).size.width * 0.85,
//                       ),
//                       Text(
//                         'คิวห้องยาและการเงิน',
//                         style: GoogleFonts.prompt(fontSize: 18.0),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20.0,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

  

//   Future savequeue() async {
//     print('ggg');
//     Map<String, dynamic> _map = {
//       "patient_info": {
//         "pt_name": ptname,
//         "hn": inputHn,
//         "cid": cid,
//         "dob": dob,
//         "age": age,
//         "data_visit": null,
//         "vn": null,
//         "main_dep": null,
//         "department": null
//       },
//       "right": {
//         "birthdate": "25280806",
//         "count_select": 0,
//         "fname": "ศรีสุนันท์",
//         "lname": "หาคม",
//         "maininscl": "OFC",
//         "maininscl_main": "C",
//         "maininscl_name": 'pt',
//         "nation": "099",
//         "person_id": "1180400006631",
//         "primary_amphur_name": "เมืองชัยนาท",
//         "primary_moo": "-",
//         "primary_mooban_name": "-",
//         "primary_province_name": "ชัยนาท",
//         "primary_tumbon_name": "บ้านกล้วย",
//         "primaryprovince": "1800",
//         "sex": "2",
//         "subinscl": "O1",
//         "subinscl_name": subinsclName,
//         "title": "004",
//         "title_name": "น.ส.",
//         "ws_data_source": "NHSO",
//         "ws_date_request": "2021-04-27T11:33:10+07:00",
//         "ws_status": "NHSO-000001",
//         "ws_status_desc": "ok",
//         "wsid": "WS000010230511649",
//         "wsid_batch": "WSB00002246239585"
//       },
//       "appoint": {
//         "appoint_id": null,
//         "pt_name": null,
//         "hn": null,
//         "appoint_date": null,
//         "appoint_time_begin": null,
//         "appoint_time_end": null,
//         "depcode": null,
//         "department": null,
//         "appoint_preparing": null,
//         "appoint_reason": null,
//         "doctor_id": null,
//         "doctor_name": null,
//         "appoint_status": null,
//         "appoint_right_code": null,
//         "appoint_right": null,
//       },
//       "servicegroupid": servicgroub,
//       "serviceid": servicid,
//       "created_from": 2,
//       "quickly": 0,
//       "q_status_id": qstatus,
//       "u_id": "test"
//     };
//     var json = jsonEncode(_map);
//     await queue(http.Client(), json);
//   }

//   Future<Null> queue(http.Client client, var json) async {
//     print('gggggg #$json');
//     var url = Uri.parse('http://q.chainathospital.org/app/kiosk/create-queue');
//     try {
//       final response = await http.post(
//         url,
//         headers: {"Content-Type": "application/json"},
//         body: json,
//       );
//       print('eee ${response.body}');
//       var getData = await jsonDecode(response.body);
//       print('wwww $getData');
//       var getQ = await Getqueue.fromJson(getData);
//       print(getQ.modelQueue.qIds);
//       setState(() {
//         q = getQ.modelQueue.qNum;
//         qids = getQ.modelQueue.qIds.toString();
//       });

//       print('qqqqq $q');
//       queues(context);

//       // print('test ==> $getData ');
//       // Map<String, dynamic> getqueue = jsonDecode(getData);
//       // var getQ = Getqueue.fromJson(jsonDecode(getData));

//       // print(getQ.modelQueue);
//     } catch (e) {
//       print(e);
//     }
//   }

//   Future noHasDataDialog(BuildContext context) {
//     return showDialog(
//       context: context,
//       builder: (context) {
//         return SimpleDialog(
//           children: [
//             Container(
//               width: 440.0,
//               height: 120.0,
//               child: Column(
//                 children: [
//                   Text(
//                     'ไม่มีรายการยา',
//                     style: GoogleFonts.kanit(
//                       color: Colors.black,
//                       fontSize: 24.0,
//                       fontWeight: FontWeight.w400,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   Divider(
//                     height: 15,
//                     thickness: 1.0,
//                     color: Colors.grey[100],
//                   ),
//                   Text(
//                     'กลับบบ้านได้',
//                     style: GoogleFonts.kanit(
//                       color: Colors.black,
//                       fontSize: 18.0,
//                       fontWeight: FontWeight.w400,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: <Widget>[
//                 Container(
//                   width: 115.0,
//                   height: 53.0,
//                   child: RaisedButton(
//                     color: Colors.white,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(3.0)),
//                     onPressed: () {
//                       // MaterialPageRoute route =
//                       //     MaterialPageRoute(builder: (value) => HosScreen());
//                       Navigator.pop(context);
//                     },
//                     child: Text(
//                       'ปิดหน้าต่าง',
//                       style: GoogleFonts.kanit(
//                         fontSize: 22.0,
//                         color: Colors.black,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Future queues(BuildContext context) {
//     return showDialog(
//       context: context,
//       builder: (context) {
//         return SimpleDialog(
//           children: [
//             Container(
//               width: 440.0,
//               height: 120.0,
//               child: Column(
//                 children: [
//                   Text(
//                     'รับบัตรคิว',
//                     style: GoogleFonts.kanit(
//                       color: Color(
//                         0xff089EAD,
//                       ),
//                       fontSize: 24.0,
//                       fontWeight: FontWeight.w400,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   Divider(
//                     height: 15,
//                     thickness: 1.0,
//                     color: Colors.grey[100],
//                   ),
//                   Text(
//                     'รับหมายเลขคิวชำระเงิน\n$q',
//                     style: GoogleFonts.kanit(
//                       color: Colors.black,
//                       fontSize: 18.0,
//                       fontWeight: FontWeight.w400,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: <Widget>[
//                 Container(
//                   width: 150.0,
//                   height: 53.0,
//                   child: RaisedButton(
//                     color: Colors.white,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: new BorderRadius.circular(5.0),
//                         side: BorderSide(
//                           color: Color(
//                             0xff089EAD,
//                           ),
//                         )),
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: Text(
//                       'ปิดหน้าต่าง',
//                       style: GoogleFonts.kanit(
//                         fontSize: 22.0,
//                         color: Color(
//                           0xff089EAD,
//                         ),
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

// class AppointItem extends StatelessWidget {
//   AppointItem(
//       {Key key,
//       this.appoint,
//       this.testfn,
//       this.hresulty,
//       this.rxqn,
//       this.queuelist})
//       : super(key: key);
//   final Appoint appoint;
//   final Hresulty hresulty;
//   final Queuelist queuelist;
//   final Rxqn rxqn;

//   final Function testfn;
//   List<ChackHnso> checkHnso = List();
//   List<GetRx> getRx = List();
//   List<GetRx> getrX = List();
//   GetRx getrx;

//   var hnso;
//   bool staus;
//   ChackHnso chackHnso;
//   Widget _CardItemRight(String title, String description) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Expanded(
//             flex: 50,
//             child: Text(
//               '  $title',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//             )),
//         Expanded(
//             flex: 50,
//             child: Text(
//               description,
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             )),
//       ],
//     );
//   }

//   bool status;
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 5,
//       color: Colors.white,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(5.0),
//       ),
//       child: Container(
//         padding: EdgeInsets.all(5),
//         // width: MediaQuery.of(context).size.width,
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Padding(padding: EdgeInsets.only(left: 20.0)),
//                 Expanded(
//                     flex: 60,
//                     child: Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         '     ${queuelist.servicegroupName}' == null
//                             ? "-"
//                             : '${queuelist.servicegroupName}',
//                         style: TextStyle(
//                           color: Color(
//                             0xff116EA8,
//                           ),
//                           fontSize: 24,
//                           fontWeight: FontWeight.w400,
//                           fontFamily: "Kanit",
//                         ),
//                       ),
//                     )),
//                 Expanded(
//                     flex: 30,
//                     child: Align(
//                       alignment: Alignment.bottomRight,
//                       child: SizedBox(
//                         child: Icon(
//                           Icons.delete_outline,
//                           size: 30,
//                         ),
//                       ),
//                     )),
//               ],
//             ),
            

//             // Icon(Icons.date_range_outlined),
//             Container(
//               width: MediaQuery.of(context).size.width * 0.85,
//               child:
//                   Divider(height: 10, thickness: 1.25, color: Colors.grey[400]),
//             ),
//             Padding(padding: EdgeInsets.only(top: 7.0)),
//             Row(
//               children: [
//                 Column(
//                   children: [
//                     SizedBox(
//                         child: Text(
//                           'คิวของคุณคือ',
//                           // "$departmentName",
//                           style: TextStyle(
//                             color: Color(
//                               0xff828282,
//                             ),
//                             fontSize: 18,
//                             fontWeight: FontWeight.w400,
//                             fontFamily: "Kanit",
//                           ),

//                           textAlign: TextAlign.center,
//                         ),
//                         width: 195),
//                     SizedBox(
//                         child: Text(
//                           queuelist.qNum == null ? "-" : queuelist.qNum,
//                           style: TextStyle(
//                             fontWeight: FontWeight.w400,
//                             fontSize: 34,
//                             color: Color(
//                               0xff116EA8,
//                             ),
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                         width: 195),
//                     SizedBox(
//                         child: Text(
//                           queuelist.serviceStatusName == null
//                               ? "-"
//                               : queuelist.serviceStatusName,
//                           // "$departmentName",
//                           style: TextStyle(
//                             color: Color(
//                               0xff116EA8,
//                             ),
//                             fontSize: 24.0,
//                             fontWeight: FontWeight.w400,
//                             fontFamily: "Kanit",
//                           ),

//                           textAlign: TextAlign.center,
//                         ),
//                         width: 195),
//                   ],
//                 ),
//                 // Column(children: [
//                 //  SizedBox(
//                 //         child: Divider(
//                 //   height: 10,
//                 //   thickness: 1.25,
//                 //   color: Colors.grey[400]
//                 //   ),
//                 //  ),
//                 // ],),
//                 Column(
//                   children: [
//                     SizedBox(
//                         child: Text(
//                           'รอคิว',
//                           // "$departmentName",
//                           style: TextStyle(
//                             color: Color(
//                               0xff828282,
//                             ),
//                             fontSize: 18,
//                             fontWeight: FontWeight.w400,
//                             fontFamily: "Kanit",
//                           ),

//                           textAlign: TextAlign.center,
//                         ),
//                         width: 100),
//                     SizedBox(
//                       child: Text(
//                         queuelist.queueLeft == null ? "-" : queuelist.queueLeft,
//                         // "$departmentName",
//                         style: TextStyle(
//                           color: Color(
//                             0xffF2994A,
//                           ),
//                           fontSize: 36.0,
//                           fontWeight: FontWeight.w400,
//                           fontFamily: "Kanit",
//                         ),

//                         textAlign: TextAlign.center,
//                       ),
//                       width: 50,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             // Padding(padding: EdgeInsets.only(top: 7.0)),
//             SizedBox(
//               height: 13.0,
//             ),
//             queuelist.serviceStatusName == 'รอลงทะเบียน'
//                 ? Divider(
//                     thickness: 2,
//                     height: 1,
//                   )
//                 : Container(),
//             queuelist.serviceStatusName == 'รอลงทะเบียน'
//                 ? Align(
//                     alignment: Alignment.bottomRight,
//                     child: TextButton(
//                       style: TextButton.styleFrom(
//                         textStyle: const TextStyle(fontSize: 16),
//                       ),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           PageTransition(
//                               type: PageTransitionType.leftToRight,
//                               child: QueueQr(
//                                 // qids: qids,
//                                 queuelist: queuelist,
//                               )),
//                         );
//                       },
//                       child: const Text('Scan QR Code'),
//                     ),
//                   )
//                 : Container()
//           ],
//         ),
//       ),
//     );
//     // return Card(
//     //   child: Column(
//     //     mainAxisSize: MainAxisSize.min,
//     //     children: <Widget>[
//     //       Container(
//     //           width: MediaQuery.of(context).size.width * 0.90,
//     //           padding: EdgeInsets.all(8),
//     //           child: Row(
//     //             mainAxisAlignment: MainAxisAlignment.start,
//     //             children: [
//     //               Padding(padding: EdgeInsets.only(top: 15.0)),
//     //               Align(
//     //                 alignment: Alignment.topLeft,
//     //                 child: Row(
//     //                   children: [
//     //                     Text(
//     //                       "ปีที่ : ",
//     //                       style: TextStyle(
//     //                           fontWeight: FontWeight.bold, fontSize: 16),
//     //                     ),
//     //                     Text(
//     //                       queuelist.qIds == null
//     //                           ? "-"
//     //                           : queuelist.qIds,
//     //                       style: TextStyle(
//     //                         fontWeight: FontWeight.w400,
//     //                         fontSize: 16,
//     //                         color: Color(0xff666666),
//     //                       ),
//     //                     ),
//     //                   ],
//     //                 ),
//     //               ),
//     //             ],
//     //           )),
//     //       Divider(height: 10, thickness: 1.25, color: Colors.grey[400]),
//     //       // ListTile(
//     //       //   leading: Icon(Icons.album),
//     //       //   title: Text(appoint.appoint_id),
//     //       //   subtitle: Text(appoint.pt_name),
//     //       // ),

//     //       Container(
//     //         width: MediaQuery.of(context).size.width * 0.90,
//     //         // width: double.maxFinite,
//     //         color: Colors.blue,
//     //         child: Row(
//     //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     //           children: [
//     //             // Expanded(
//     //             //   flex: 100,
//     //             //   child: Container(
//     //             //       padding: EdgeInsets.all(8),
//     //             //       color: Colors.amber,
//     //             //       child: Column(
//     //             //           mainAxisAlignment: MainAxisAlignment.center,
//     //             //           children: [

//     //             //              _CardItemRight(
//     //             //               'วันที่:',
//     //             //               hresulty.med_exam_date == null
//     //             //                   ? " "
//     //             //                   :  hresulty.med_exam_date),

//     //             //           ])),
//     //             // ),
//     //             Expanded(
//     //               flex: 70,
//     //               child: Container(
//     //                   height: 80,
//     //                   padding: EdgeInsets.all(8),
//     //                   color: Colors.amberAccent,
//     //                   child: Column(
//     //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     //                     children: [
//     //                       // _CardItemRight(
//     //                       //     'วันที่ :',
//     //                       //     hresulty.med_exam_date == null
//     //                       //         ? " "
//     //                       //         : hresulty.med_exam_date),
//     //                     ],
//     //                   )),
//     //             )
//     //           ],
//     //         ),
//     //       ),

//     //       Row(
//     //         mainAxisAlignment: MainAxisAlignment.end,
//     //         children: <Widget>[
//     //           const SizedBox(width: 8),
//     //           TextButton(
//     //             child: const Text('รายละเอียด'),
//     //             onPressed: () {
//     //               MaterialPageRoute route = MaterialPageRoute(
//     //                   builder: (value) => Hresultdetail(
//     //                         hresulty: hresulty,
//     //                       ));
//     //               Navigator.push(context, route);
//     //             },
//     //           ),
//     //           const SizedBox(width: 8),
//     //           SizedBox(
//     //             height: 20.0,
//     //           ),
//     //         ],
//     //       ),
//     //     ],
//     //   ),
//     // );
//   }

//   Future<Null> checkhnso(nhso) async {
//     print('------------');
//     var header = {'Content-Type': 'application/json'};
//     var url = Uri.parse(
//         'http://chainathospital.org/coreapi/api/v2/check_state_nhso/');

//     try {
//       var response = await http.get(url, headers: header);
//       ChackHnso chackHnso =
//           ChackHnso.fromJson(convert.jsonDecode(response.body));

//       for (var i = 0; i < chackHnso.nonCheckNhso.length; i++) {
//         checkHnso.add(chackHnso);
//       }

//       if (chackHnso.nonCheckNhso.contains(hnso) == true) {
//         status = true;
//         print('[[[[[$hnso]]]]]');
//       } else {
//         print('[[[[[$hnso]]]]]');
//         status = false;
//       }

//       //   //  print(index.toString());

//       // } else {}

//     } catch (e) {}
//   }
// }
