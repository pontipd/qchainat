
import 'package:chainatqueue/utility/buttom_bar.dart';
import 'package:chainatqueue/utility/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Queuetaking extends StatefulWidget {
  @override
  _QueuetakingState createState() => _QueuetakingState();
}

class _QueuetakingState extends State<Queuetaking> {
  set floatingActionButton(Container floatingActionButton) {}

  @override
  Widget build(BuildContext context) {
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
                      style: GoogleFonts.kanit(
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
                                    '     อายุรกรรม ',
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
                              // SizedBox(
                              //   child: Icon(
                              //     Icons.delete_outline,
                              //     size: 30,
                              //   ),
                              //   width:
                              //       MediaQuery.of(context).size.width - 392.0,
                              // ),
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
                                        'A000',
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
                            height: 20.0,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    height: 180.0,
                  ),
                  floatingActionButton = Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    height: 53.0,
                    child: FloatingActionButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
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
