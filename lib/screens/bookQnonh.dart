import 'package:chainatqueue/models/department.dart';
import 'package:chainatqueue/models/getserviceList.dart';
import 'package:chainatqueue/screens/haveappointment.dart';
import 'package:chainatqueue/screens/login.dart';
import 'package:chainatqueue/screens/queueQr.dart';
import 'package:chainatqueue/utility/buttom_bar.dart';
import 'package:chainatqueue/utility/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookgueueONHN extends StatefulWidget {
  final GetDepartment getDepartment;
  final GetserviceList getserviceList;
  final String hn, ptname, cid, age, listdepartmentName, inputHn, displayname, name, q;

  BookgueueONHN(
      {Key key,
      this.getDepartment,
      this.age,
      this.cid,
      this.hn,
      this.listdepartmentName,
      this.q,
      this.name,
      this.ptname,
      this.inputHn,
      this.getserviceList,
      this.displayname,
      grtservice})
      : super(key: key);
  @override
  _BookgueueONHNState createState() => _BookgueueONHNState();
}

class _BookgueueONHNState extends State<BookgueueONHN> {
  set floatingActionButton(Container floatingActionButton) {}
  GetDepartment getDepartments;
  var servicegroupid, nameService, departmentName;
  String hn, ptname,listdepartmentName, cid, age, inputHn, displayname, name, q;
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
    q = "${widget.q}";
    listdepartmentName = "${widget.listdepartmentName}";
    displayname = "${widget.displayname}";
    print('####book $inputHn');
    // findDepartmentList();
    print(servicegroupid);
    print(departmentName);
  }

  @override
  Widget build(BuildContext context) {
    ptname = "${widget.ptname}";
    hn = "${widget.hn}";
    cid = "${widget.cid}";
    q = "${widget.q}";
    listdepartmentName = "${widget.listdepartmentName}";
    age = "${widget.age}";
    name = "${widget.name}";
    inputHn = "${widget.inputHn}";
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        // here the desired height
        child: AppBar(
          backgroundColor: Color(
            0xff089EAD,
          ),
          title: Text(
            "โรงพยาบาลชัยนาทนเรนทร",
            style: GoogleFonts.kanit(fontSize: 22.0, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            Container(
              width: 60.0,
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'images/person.png',
                  color: Colors.white,
                  width: 70.0,
                ),
              ),
            )
          ],
        ),
      ),
      drawer: MainDrawer(),
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
                                    '     $listdepartmentName',
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
                                        ' (รอซักประวัติ)  ',
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
                                      '20',
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
                                "กรุณาลงทะเบียนผู้ป่วยใหม่\nที่งานเวชระเบียน\nก่อนรับบริการ",
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
                          // SizedBox(
                          //   child: FloatingActionButton(
                          //     shape: RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(7.5)),
                          //     clipBehavior: Clip.antiAlias,
                          //     onPressed: () {
                          //       MaterialPageRoute route = MaterialPageRoute(
                          //           builder: (value) => QueueQr());
                          //       Navigator.push(context, route);
                          //     },
                          //     backgroundColor: Color(
                          //       0xffF2994A,
                          //     ),
                          //     child: Column(
                          //       mainAxisAlignment: MainAxisAlignment.center,
                          //       children: [
                          //         Container(
                          //           width: MediaQuery.of(context).size.width *
                          //               0.85,
                          //         ),
                          //         Text(
                          //           'กดเพื่อ Scan QR Code',
                          //           style: GoogleFonts.prompt(fontSize: 18.0),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          //   width: MediaQuery.of(context).size.width * 0.75,
                          // ),
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
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
