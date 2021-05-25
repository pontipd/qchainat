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
      _selectedIndex = index;
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
    inputHn = "${widget.inputHn}";
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        // here the desired height
        child: AppBar(
          title: Text("รายละเอียด"),
          centerTitle: true,
          leading: new Container(),
          backgroundColor: Color(
            0xff089EAD,
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.close),
              tooltip: 'Show Snackbar',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('This is a snackbar')));

                MaterialPageRoute route =
                    MaterialPageRoute(builder: (value) => Queue());
                Navigator.push(context, route);
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          
          children: [
            Center(
              
child:_pageOptions[selectedPage],
            ),
          Container(
                width: MediaQuery.of(context).size.width * 0.90,
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.90,
                    child: Column(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(top: 10.0)),
                        SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          child: Text(
                            "คิวตรวจ/ห้องจ่ายยา",
                            style: GoogleFonts.kanit(
                              fontSize: 24.0,
                              color: Color(
                                0xff089EAD,
                              ),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          width: 450,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(
                          child: Text(
                            "อัพเดทคิว  12 ก.พ. 2564 เวลา 12.00 น.",
                            style: GoogleFonts.prompt(
                              fontSize: 16.0,
                              color: Color(
                                0xff828282,
                              ),
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          width: 450,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        // Divider(
                        //   height: 15,
                        //   thickness: 1.0,
                        //   color: Color(
                        //     0xfff828282,
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 20.0,
                        // ),
                        Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(padding: EdgeInsets.only(top: 45.0)),
                                    SizedBox(
                                        child: Text(
                                          '     $departmentName',
                                          // "$departmentName",
                                          style: TextStyle(
                                            color: Color(
                                              0xff116EA8,
                                            ),
                                            fontSize: 24,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Kanit",
                                          ),

                                          textAlign: TextAlign.left,
                                        ),
                                        width: 300),
                                    SizedBox(
                                      child: Icon(
                                        Icons.delete_outline,
                                        size: 30,
                                      ),
                                      width:
                                          MediaQuery.of(context).size.width - 392.0,
                                    ),
                                  ],
                                ),

                                // Icon(Icons.date_range_outlined),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.85,
                                  child: Divider(
                                      height: 10,
                                      thickness: 1.25,
                                      color: Colors.grey[400]),
                                ),
                                Padding(padding: EdgeInsets.only(top: 7.0)),
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(
                                            child: Text(
                                              'คิวของคุณคือ',
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
                                            width: 195),
                                        SizedBox(
                                            child: Text(
                                              q,
                                              // "$departmentName",
                                              style: TextStyle(
                                                color: Color(
                                                  0xff116EA8,
                                                ),
                                                fontSize: 36.0,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: "Kanit",
                                              ),

                                              textAlign: TextAlign.center,
                                            ),
                                            width: 195),
                                        SizedBox(
                                            child: Text(
                                              '($service_status_name)',
                                              // "$departmentName",
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
                                            width: 195),
                                      ],
                                    ),
                                    // Column(children: [
                                    //  SizedBox(
                                    //         child: Divider(
                                    //   height: 10,
                                    //   thickness: 1.25,
                                    //   color: Colors.grey[400]
                                    //   ),
                                    //  ),
                                    // ],),
                                    Column(
                                      children: [
                                        SizedBox(
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
                                            width: 150),
                                        SizedBox(
                                          child: Text(
                                            '$queue_left',
                                            // "$departmentName",
                                            style: TextStyle(
                                              color: Color(
                                                0xffF2994A,
                                              ),
                                              fontSize: 36.0,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: "Kanit",
                                            ),

                                            textAlign: TextAlign.center,
                                          ),
                                          width: 50,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                // Padding(padding: EdgeInsets.only(top: 7.0)),
                                SizedBox(
                                  height: 13.0,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),

                        Card(
                          color: Color(
                            0xff089EAD,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.95,
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
                                    width: MediaQuery.of(context).size.width * 0.85),
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
                        SizedBox(
                          height: 20.0,
                        ),
                        floatingActionButton = Container(
                          width: MediaQuery.of(context).size.width * 0.95,
                          height: 50.0,
                          child: FloatingActionButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.5)),
                            clipBehavior: Clip.antiAlias,
                            onPressed: () {
                              // MaterialPageRoute route =
                              //     MaterialPageRoute(builder: (value) => Department());
                              // Navigator.push(context, route);
                            },
                            backgroundColor: Color(
                              0xff2D9CDB,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.85,
                                ),
                                Text(
                                  'จองคิวการตรวจอื่น',
                                  style: GoogleFonts.prompt(fontSize: 18.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            
          ],
        ),
      ),  
          
       
            

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
          });
        },
      ), // This trail
      //  bottomNavigationBar: ConvexAppBar(
      //     style: TabStyle.react,
      //     items: [
      //       TabItem(icon: Icons.home, title: 'Home'),
      //       TabItem(icon: Icons.favorite, title: 'Favorites'),
      //       TabItem(icon: Icons.search, title: 'Search'),
      //       TabItem(icon: Icons.person, title: 'Profile'),
      //       TabItem(icon: Icons.person, title: 'Profile'),
      //     ],
      //     initialActiveIndex: 1,
      //     onTap: (int i) => print('click index=$i'),
      //   ),
    );
  }
}
