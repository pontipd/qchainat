import 'package:chainatqueue/models/department.dart';
import 'package:chainatqueue/models/getserviceList.dart';
import 'package:chainatqueue/screens/haveappointment.dart';
import 'package:chainatqueue/screens/login.dart';
import 'package:chainatqueue/screens/queue.dart';
import 'package:chainatqueue/screens/queueQr.dart';
import 'package:chainatqueue/utility/buttom_bar.dart';
import 'package:chainatqueue/utility/main_drawer.dart';
import 'package:chainatqueue/widget/app_bottom_bar.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import 'Page5.dart';
import 'getmedlist.dart';
import 'page1.dart';
import 'page2.dart';
import 'page3.dart';

int selectedPage = 0;
int check = 0;

final _pageOptions = [Page1(), Page5(), Drugdispen(), Page3(), Page2()];

class BookgueueresHN extends StatefulWidget {
  final GetDepartment getDepartment;
  final GetserviceList getserviceList;
  final String hn,
      ptname,
      cid,
      age,
      dob,
      servicename,
      inputHn,
      displayname,
      listdepartmentName,
      departmentName,
      name,
      queue_left,
      service_status_name,
      q,
      qHn,
      qids,
      idlist,
      gidlist;
  BookgueueresHN(
      {Key key,
      this.getDepartment,
      this.gidlist,
      this.idlist,
      this.departmentName,
      this.age,
      this.cid,
      this.servicename,
      this.listdepartmentName,
      this.hn,
      this.name,
      this.dob,
      this.ptname,
      this.inputHn,
      this.q,
      this.qHn,
      this.qids,
      this.service_status_name,
      this.queue_left,
      this.getserviceList,
      this.displayname,
      grtservice})
      : super(key: key);
  @override
  _BookgueueresHNState createState() => _BookgueueresHNState();
}

class _BookgueueresHNState extends State<BookgueueresHN> {
  set floatingActionButton(Container floatingActionButton) {}
  GetDepartment getDepartments;
  var servicegroupid, nameService, departmentName;

  int selectedPage = 0;
  final _pageOptions = [Page1(), Page5(), Drugdispen(), Page3(), Page2()];
  String hn,
      ptname,
      cid,
      age,
      inputHn,
      displayname,
      dob,
      name,
      q,
      qHn,
      qids,
      idlist,
      queue_left,
      service_status_name,
      gidlist,
      servicename,
      listdepartmentName;
  GetserviceList getserviceList;
  @override
  void initState() {
    check = 0;
    // TODO: implement initState
    super.initState();

    // getDepartments = widget.getDepartment;
    getserviceList = widget.getserviceList;
    // departmentName = getserviceList.serviceName;
    // servicegroupid = getserviceList.serviceGroupid;
    inputHn = "${widget.inputHn}";
    name = "${widget.name}";
    qids = "${widget.qids}";
    servicename = "${widget.servicename}";
    departmentName = "${widget.departmentName}";
    q = "${widget.q}";
    qHn = "${widget.qHn}";
    queue_left = "${widget.queue_left}";
    service_status_name = "${widget.service_status_name}";
    listdepartmentName = "${widget.listdepartmentName}";
    displayname = "${widget.displayname}";
    print('####book $inputHn');
    // findDepartmentList();
    // print(servicegroupid);
    // print(departmentName);
  }

  int _selectedIndex = 1;
  static List<Widget> _widgetOptions = <Widget>[
    Page1(),
    Page5(),
    Drugdispen(),
    Page3(),
    Page2(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    ptname = "${widget.ptname}";
    departmentName = "${widget.departmentName}";
    hn = "${widget.hn}";
    q = "${widget.q}";
    qids = "${widget.qids}";
    cid = "${widget.cid}";
    age = "${widget.age}";
    name = "${widget.name}";
    queue_left = "${widget.queue_left}";
    service_status_name = "${widget.service_status_name}";
    qHn = "${widget.qHn}";
    inputHn = "${widget.inputHn}";
    return Scaffold(
      //  appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(60.0),
      //   // here the desired height
      //   child: AppBar(
      //     backgroundColor: Color(
      //       0xff089EAD,
      //     ),
      //     title: Text(
      //       "โรงพยาบาลชัยนาทนเรนทร",
      //       style: GoogleFonts.kanit(fontSize: 22.0, color: Colors.white),
      //       textAlign: TextAlign.center,
      //     ),
      //     actions: <Widget>[
      //       Container(
      //         width: 60.0,
      //         child: Align(
      //           alignment: Alignment.center,
      //           child: Image.asset(
      //             'images/person.png',
      //             color: Colors.white,
      //             width: 70.0,
      //           ),
      //         ),
      //       )
      //     ],
      //   ),
      // ),
      // appBar: AppBar(
      //   title: Text("โรงพยาบาลชัยนาทนเรนทร"),
      // ),
      // drawer: MainDrawer(),

      backgroundColor: Colors.white,

      body: (check != 0)
          ? _pageOptions[selectedPage]
          : SingleChildScrollView(
              child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 100,
              ),
              child: Column(
                // appBar: AppBar(
                //   title: Text("โรงพยาบาลชัยนาทนเรนทร"),
                // ),
                // drawer: MainDrawer(),

                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                 // Padding(padding: EdgeInsets.only(top: 10.0)),

                 // Padding(padding: EdgeInsets.only(top: 30.0)),
                  Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                    color: Color(
                      0xff089EAD,
                    ),
                   //   color: Colors.cyan[700],
                    child: Row(
                      // Padding(padding: EdgeInsets.only(top: 30.0)),
                      children: <Widget>[
                //    Padding(padding: EdgeInsets.only(top: 120.0)),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: IconButton(
                              icon: Icon(Icons.menu),
                              iconSize: 20.0,
                              color: Colors.white,
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Text(
                            'คิวตรวจรักษา',
                            style: GoogleFonts.prompt(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Center(
                  //   child: _pageOptions[selectedPage],
                  // ),
                  // SizedBox(
                  //   height: 50.0,
                  // ),
                //  Padding(padding: EdgeInsets.only(top: 20.0)),
                  // Container(
                  //   width: MediaQuery.of(context).size.width * 0.9,
                  //   child: Container(
                  //
                  //         child: Padding(
                  //           padding: const EdgeInsets.only(left: 5.0),
                  //           child: Text('คิวตรวจ/ห้องจ่ายยา',
                  //               style: TextStyle(
                  //                   fontSize: 25,
                  //                   fontWeight: FontWeight.bold,
                  //                   color: Colors.cyan[400]),
                  //                   textAlign: TextAlign.center,
                  //                   ),
                  //         )),
                  //   ),
                  
                  SizedBox(
                    height: 40.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.90,
                    // A fixed-height child.
                   // color: const Color(0xffeeee00), // Yellow
                    height: 200.0,
                    alignment: Alignment.center,
                    child: Card(
                      elevation: 5,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Container(
                        // padding: EdgeInsets.all(5),
                        // width: MediaQuery.of(context).size.width,
                        child: Column(children: [
                          Row(
                            children: [
                              Padding(padding: EdgeInsets.only(left: 20.0)),
                              Expanded(
                                  flex: 80,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '     $departmentName' == null
                                          ? "-"
                                          : ' $departmentName',
                                      style: TextStyle(
                                        color: Color(
                                          0xff116EA8,
                                        ),
                                        fontSize: 24,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Kanit",
                                      ),
                                    ),
                                  )),
                              Expanded(
                                  flex: 20,
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: SizedBox(
                                      child: Icon(
                                        Icons.delete_outline,
                                        size: 30,
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: Divider(
                                height: 10,
                                thickness: 1.25,
                                color: Colors.grey[400]),
                          ),
                          Padding(padding: EdgeInsets.only(top: 8.0)),
                          Row(
                            children: [
                              Padding(padding: EdgeInsets.only(left: 20.0)),
                              Expanded(
                                  flex: 50,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      ' คิวของคุณคือ',
                                      style: TextStyle(
                                        color: Color(
                                          0xff828282,
                                        ),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Kanit",
                                      ),
                                    ),
                                  )),
                              Expanded(
                                  flex: 50,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'รอคิว',
                                      // "$departmentName",
                                      style: TextStyle(
                                        color: Color(
                                          0xff828282,
                                        ),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Kanit",
                                      ),

                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(padding: EdgeInsets.only(left: 20.0)),
                              Expanded(
                                  flex: 50,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      q == null ? "-" : q,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 34,
                                        color: Color(
                                          0xff116EA8,
                                        ),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                              Expanded(
                                  flex: 50,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      queue_left == null ? "-" : queue_left,
                                      style: TextStyle(
                                        color: Color(
                                          0xffF2994A,
                                        ),
                                        fontSize: 34.0,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Kanit",
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                            ],
                          ),
                          Container(
                            // color: Color(
                            //                 0xff828282,
                            //               ),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    //Padding(padding: EdgeInsets.only(left: 5.0)),
                                    SizedBox(
                                        child: Text(
                                          service_status_name == null
                                              ? "-"
                                              : service_status_name,
                                          style: TextStyle(
                                            color: Color(
                                              0xff116EA8,
                                            ),
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Kanit",
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.99 /
                                                2),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                    ),
                    //Text('Fixed Height Content'),
                  ),

                  SizedBox(
                    height: 40,
                  ),

                  Container(
                    //  color: const Color(0xff008000), // Green
                    height: 200.0,
                    alignment: Alignment.center,
                    child: Card(
                      elevation: 5,
                      color: Color(
                        0xff089EAD,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Container(
                        child: Column(
                          children: [
                            Padding(padding: EdgeInsets.only(top: 7.0)),
                            SizedBox(
                              child: Text(
                                // "$departmentName",
                                "กรุณาลงทะเบียนที่\nKiosk ก่อนเข้ารับบริการ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Kanit",
                                ),
                                textAlign: TextAlign.center,
                              ),
                              width: MediaQuery.of(context).size.width * 0.88,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.85,
                              child: Divider(
                                height: 10,
                                thickness: 0,
                                // color: Colors.grey[400]
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 7.0)),
                            SizedBox(
                              child: FloatingActionButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7.5)),
                                clipBehavior: Clip.antiAlias,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.leftToRight,
                                        child: QueueQr(
                                          qids: qids,
                                          qHn: qHn,
                                          hn: inputHn,
                                        )),
                                  );
                                },
                                backgroundColor: Color(
                                  0xffF2994A,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.85,
                                    ),
                                    Text(
                                      'กดเพื่อ Scan QR Code',
                                      style: GoogleFonts.prompt(fontSize: 18.0),
                                    ),
                                  ],
                                ),
                              ),
                              width: MediaQuery.of(context).size.width * 0.75,
                            ),
                            Padding(padding: EdgeInsets.only(top: 7.0)),
                            SizedBox(
                              height: 10.0,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            )),

      bottomNavigationBar: ConvexAppBar(
        // height: MediaQuery.of(context).size.width * 0.90,

        backgroundColor: Color(
          0xff089EAD,
        ),
        items: [
          TabItem(icon: Icons.date_range_outlined, title: 'นัดหมาย'),
          TabItem(icon: Icons.people, title: 'คิวตรวจ'),
          TabItem(icon: Icons.roofing, title: 'รับยาใกล้บ้าน'),
          TabItem(icon: Icons.pending_actions, title: 'ผลตรวจ'),
          TabItem(icon: Icons.article_outlined, title: 'ตรวจสิทธิ'),
        ],
        initialActiveIndex: 0, //optional, default as 0
        onTap: (int i) {
          setState(() {
            selectedPage = i;
            check = 1;
          });
        },
      ), // This trail
    );
  }
}
