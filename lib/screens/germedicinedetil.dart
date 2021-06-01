import 'dart:convert';
import 'package:chainatqueue/models/appoint.dart';
import 'package:chainatqueue/models/depenlist.dart';
import 'package:chainatqueue/models/getDepartment.dart';
import 'package:chainatqueue/models/getserviceList.dart';
import 'package:chainatqueue/models/rxde.dart';
import 'package:chainatqueue/screens/bookQresHN.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Havemedicinedetail extends StatefulWidget {
  String rxnumber;
  final Depenlist appoint;
  Havemedicinedetail({Key key, this.rxnumber, this.appoint}) : super(key: key);

  @override
  _HavemedicinedetailState createState() => _HavemedicinedetailState();
}

class _HavemedicinedetailState extends State<Havemedicinedetail> {
  set floatingActionButton(Container floatingActionButton) {}
  String departmentName, servicename;
  String rxnumber;
  Depenlist appoint;
  GetDepartments getDepartment;
  bool loading = false;
  Future<List<Rxde>> rxde;
  @override
  void initState() {
    super.initState();
    loading = true;
    rxnumber = "${widget.rxnumber}";
    print('rxnumberde> $rxnumber');
    Map<String, dynamic> _map = {
      "rx_number": "${widget.rxnumber}",
    };
    var data = jsonEncode(_map);
    fetchs(data);
  }

  Future<List<Rxde>> fetchs(data) async {
    try {
      var header = {'Content-Type': 'application/json'};
      var url =
          Uri.parse('http://chainathospital.org/coreapi/api/v2/get_rx_detail');

      final response = await http.post(url, headers: header, body: data);

      if (response.statusCode == 200) {
        print(response.statusCode);
        print('jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj');

        print(json.decode(response.body));
        print('*********$response');

        final result = jsonDecode(response.body);

        if (result['status'] == false) {
          print('#########3');
          setState(() {
            loading = false;
          });
        } else {
          print('rrrrrr=${result['data']}');

          List data = result['data'];
          setState(() {
            loading = false;
            rxde = Future.value(
                data.map((job) => new Rxde.fromJson(job)).toList());
            // checkhnso();
          });
        }
      } else {
        loading = false;
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load album');
      }
    } catch (e) {
      print('error === $e');
    }
  }

  Future _refreshData() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "รายละเอียดใบสั่งยา",
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
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 20.0)),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Center(
                  child: Card(
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
                                     widget.appoint.pt_name == null
                                          ? "-"
                                          : widget.appoint.pt_name, 
                                    // "$departmentName",
                                    style: TextStyle(
                                      color: Color(
                                        0xff116EA8,
                                      ),
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Kanit",
                                    ),

                                    textAlign: TextAlign.center,
                                  ),
                                  width: 300),
                            ],
                          ),
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
                                        '         HN : ',
                                        // "$departmentName",
                                        style: TextStyle(
                                          color: Color(
                                            0xff828282,
                                          ),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Kanit",
                                        ),

                                        // textAlign: TextAlign.left,
                                      ),
                                      width: 150),
                                  SizedBox(
                                      child: Text(
                                        '         สถานที่รับยา :',
                                        // "$departmentName",
                                        style: TextStyle(
                                          color: Color(
                                            0xff828282,
                                          ),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Kanit",
                                        ),
                                      ),
                                      width: 150),
                                  SizedBox(
                                      child: Text(
                                        ' เลขที่ใบสั่งยา :',
                                        // "$departmentName",
                                        style: TextStyle(
                                          color: Color(
                                            0xff828282,
                                          ),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Kanit",
                                        ),

                                        textAlign: TextAlign.center,
                                      ),
                                      width: 150),
                                  SizedBox(
                                      child: Text(
                                        '         วันที่  :',
                                        // "$departmentName",
                                        style: TextStyle(
                                          color: Color(
                                            0xff828282,
                                          ),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Kanit",
                                        ),

                                        // textAlign: TextAlign.center,
                                      ),
                                      width: 150),
                                  SizedBox(
                                      child: Text(
                                        ' แพทย์สั่งยา  :',
                                        // "$departmentName",
                                        style: TextStyle(
                                          color: Color(
                                            0xff828282,
                                          ),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Kanit",
                                        ),

                                        textAlign: TextAlign.center,
                                      ),
                                      width: 150),
                                  SizedBox(
                                      child: Text(
                                        ' แผนก/คลินิก  :',
                                        // "$departmentName",
                                        style: TextStyle(
                                          color: Color(
                                            0xff828282,
                                          ),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Kanit",
                                        ),

                                        textAlign: TextAlign.center,
                                      ),
                                      width: 150),
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
                              Padding(padding: EdgeInsets.only(top: 17.0)),
                              Column(
                                children: [
                                  SizedBox(
                                      child: Text(
                                        widget.appoint.HN,
                                        // "$departmentName",
                                        style: TextStyle(
                                          color: Color(
                                            0xff2D9CDB,
                                          ),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Kanit",
                                        ),

                                        textAlign: TextAlign.left,
                                      ),
                                      width: 150),
                                  SizedBox(
                                    child: Text(
                                      widget.appoint.pharmacy_drug_name == null
                                          ? "-"
                                          : widget.appoint.pharmacy_drug_name,
                                      // "$departmentName",
                                      style: TextStyle(
                                        color: Color(
                                          0xff2D9CDB,
                                        ),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Kanit",
                                      ),

                                      textAlign: TextAlign.left,
                                    ),
                                    width: 150,
                                  ),
                                  SizedBox(
                                    child: Text(
                                      widget.appoint.rx_operator_id == null
                                          ? "-"
                                          : widget.appoint.rx_operator_id,
                                      // "$departmentName",
                                      style: TextStyle(
                                        color: Color(
                                          0xff2D9CDB,
                                        ),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Kanit",
                                      ),

                                      textAlign: TextAlign.left,
                                    ),
                                    width: 150,
                                  ),
                                  SizedBox(
                                    child: Text(
                                      widget.appoint.prescription_date == null
                                          ? "-"
                                          : widget.appoint.prescription_date,
                                      // "$departmentName",
                                      style: TextStyle(
                                        color: Color(
                                          0xff2D9CDB,
                                        ),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Kanit",
                                      ),

                                      textAlign: TextAlign.left,
                                    ),
                                    width: 150,
                                  ),
                                  SizedBox(
                                    child: Text(
                                      widget.appoint.doctor_name == 'null'
                                          ? "-"
                                          : widget.appoint.doctor_name,
                                      // "$departmentName",
                                      style: TextStyle(
                                        color: Color(
                                          0xff2D9CDB,
                                        ),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Kanit",
                                      ),

                                      textAlign: TextAlign.left,
                                    ),
                                    width: 150,
                                  ),
                                  SizedBox(
                                    child: Text(
                                      widget.appoint.deptname == null
                                          ? "-"
                                          : widget.appoint.deptname,
                                      // "$departmentName",
                                      style: TextStyle(
                                        color: Color(
                                          0xff2D9CDB,
                                        ),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Kanit",
                                      ),

                                      textAlign: TextAlign.left,
                                    ),
                                    width: 150,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.0,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                flex: 7,
                child: Center(
                    child: RefreshIndicator(
                  onRefresh: _refreshData,
                  child: FutureBuilder<List<Rxde>>(
                    future: rxde,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return AppointItem(rxde: snapshot.data[index],);
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Text("error${snapshot.error}");
                      } else if (!loading && !snapshot.hasData) {
                        return InkWell(
                          onTap: () {},
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 950.0,
                            child: Text(
                              'ท่านยังไม่มีรายการยา',
                              style: GoogleFonts.prompt(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[600],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }

                      return CircularProgressIndicator();
                    },
                  ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppointItem extends StatelessWidget {
  AppointItem({Key key, this.rxde, this.testfn,this.index}) : super(key: key);
  final Rxde rxde;
final index;
  final Function testfn;

  var hnso;
  bool staus;

  Widget _CardItemRight(String title, String description) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            flex: 15,
            child: Text(
              '  $title',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            )),
        Expanded(
            flex: 60,
            child: Text(
              description,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            )),
      ],
    );
  }

  bool status;
  @override
  Widget build(BuildContext context ) {
    return Card(
      elevation: 0,
      color: Colors.white, 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
                child: Text(
                  
                  'รายการที่  ',
                  // "$departmentName",
                  style: TextStyle(
                    color: Color(
                      0xff4F4F4F,
                    ),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                  ),
                  textAlign: TextAlign.left,
                ),
                width: MediaQuery.of(context).size.width * 0.85),
            SizedBox(
                child: Text(
                  rxde?.drug_name ?? "-",
                  // "$departmentName",
                  style: TextStyle(
                    color: Color(
                      0xff116EA8,
                    ),
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                  ),
                  // textAlign: TextAlign.center,
                ),
                width: MediaQuery.of(context).size.width * 0.85),
            SizedBox(
                child: Text(
                  '${rxde?.qty ?? "-"}  ${rxde?.drug_unit ?? "-"}',

                  // "$departmentName",
                  style: TextStyle(
                    color: Color(
                      0xff116EA8,
                    ),
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                  ),
                  textAlign: TextAlign.right,
                ),
                width: MediaQuery.of(context).size.width * 0.85),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              child:
                  Divider(height: 15, thickness: 1.25, color: Colors.grey[400]),
            ),
          ],
        ),
      ),
    );
  }
}
