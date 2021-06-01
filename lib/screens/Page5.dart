import 'dart:convert';
import 'dart:convert' as convert;
import 'package:chainatqueue/models/Queuelist.dart';
import 'package:chainatqueue/models/album.dart';
import 'package:chainatqueue/models/appoint.dart';
import 'package:chainatqueue/models/checkhnso.dart';
import 'package:chainatqueue/models/getAppointment.dart';
import 'package:chainatqueue/models/getgueue.dart';
import 'package:chainatqueue/models/gethresult.dart';
import 'package:chainatqueue/models/getnhso.dart';
import 'package:chainatqueue/models/getrx.dart';
import 'package:chainatqueue/models/hresulty.dart';
import 'package:chainatqueue/models/patineModel.dart';
import 'package:chainatqueue/models/rxqn.dart';
import 'package:chainatqueue/models/user_model.dart';
import 'package:chainatqueue/provider/app_provider.dart';
import 'package:chainatqueue/screens/Medicineroom.dart';
import 'package:chainatqueue/screens/Selectdepartment.dart';
import 'package:chainatqueue/screens/appointmentdetil.dart';
import 'package:chainatqueue/screens/comrx.dart';
import 'package:chainatqueue/screens/dentist.dart';
import 'package:chainatqueue/screens/getmedicine.dart';
import 'package:chainatqueue/screens/getmedlist.dart';
import 'package:chainatqueue/screens/internaldetail.dart';
import 'package:chainatqueue/screens/page2.dart';
import 'package:chainatqueue/screens/page3.dart';
import 'package:chainatqueue/screens/queue.dart';
import 'package:chainatqueue/screens/queueQr.dart';
import 'package:chainatqueue/screens/startouse.dart';
import 'package:chainatqueue/transitions/enter_exit_route.dart';
import 'package:chainatqueue/utility/main_drawer.dart';
import 'package:chainatqueue/utility/my_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'Qrgetlist.dart';
import 'hresultdetil.dart';
import 'medicalrecord.dart';
import 'page1.dart';
import '../provider/app_provider.dart';

FirebaseMessaging messaging = FirebaseMessaging.instance;

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

final FirebaseAuth _auth = FirebaseAuth.instance;
int selectedPage = 0;
final _pageOptions = [Page1(), Page5(), Drugdispen(), Page3(), Page2()];

class Page5 extends StatefulWidget {
  String ptname, cid, age, pt, inputHn;

  // Getappointmen getappointment;

  Page5({
    Key key,
    this.age,
    this.cid,
    this.inputHn,
    this.ptname,
    this.pt,
  }) : super(key: key);
  @override
  _Page5State createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  Future<List<Album>> futureAlbum;
  String displayname, inputHn;
  Future<List<Appoint>> getappointments;
  Future<List<Hresulty>> hresulty;
  Future<List<Rxqn>> rxqn;
  Future<List<Queuelist>> queuelist;
  List<GetRx> getrX = List();
  String token;
  List<ChackHnso> checkHnso = List();
  var hnso;
  ChackHnso chackHnso;
  String staus;
  bool status;
  String rxtype;
  String rxid,
      deptCode,
      department,
      vn,
      qn,
      qfir,
      count,
      servicid,
      servicgroub,
      q,
      qids,
      oldStatus = '0',
      statusDrug = '0';
  int qstatus;
  User user;
  UserModel patient;
  String birth;
  int countSelect;
  String fname, phone;
  String tokenn;
  String hmain;
  String hmainName;
  String lname;
  String maininscl;
  String maininsclMain;
  String maininsclName;
  String nation;
  String personId;
  String primaryAmphurName;
  String primaryMoo;
  String primaryMoobanName;
  String primaryProvinceName;
  String primaryTumbonName;
  String primaryprovince;
  String purchaseprovince;
  String purchaseprovinceName;
  String sex;
  String startdate;
  String startdateSss;
  String subinscl;
  String subinsclName;
  String title;
  String titleName;
  String wsDataSource;
  String wsDateRequest;
  String wsStatus;
  String wsStatusDesc;
  String wsid;
  String pt;
  String uid;
  String wsidBatch;
  var floatingActionButton;
  bool loading = false;
  var now = DateTime.now();
  var date;

  GetRx getRx;

  @override
  void initState() {
    super.initState();
    finddisplay();
    loading = true;

    onGetData();
    inputHn = "${widget.inputHn}";
    // cid = "${widget.cid}";
    // print('pppppppppppppppppppppppppppppp=>$cid')

    print(_auth.currentUser);
    user = _auth.currentUser;
    messaging.getToken().then(setToken);

    setState(() {
      token = token;
      tokenn = token;
      print('tokenn =====>$tokenn');
    });

    getquuelists();

    // getuser();

    // getAppointment();
    readData();

    // Map<String, dynamic> _map = {"qn": 2, "date": "2021-05-25"};
    // //Map<String, dynamic> _map = {"qn": 1379, "date": "2021-04-20"};
    // //{"qn": 1378, "date": "2021-04-20"} rxtyer =1 countdurg ไม่ใช่0
    // //ไม่ได้ {"qn": 1575, "date": "2021-04-20"}
    // var json = jsonEncode(_map);
    // medList(http.Client(), json);

    var month = now.month.toString().padLeft(2, '0');
    var day = now.day.toString().padLeft(2, '0');
    date = "${now.year}" + "-" + "$month" + "-" + "$day";
    print('date   ---- $date');
    // messaging.getToken().then(setToken);
    // futureAlbum = fetchAlbum();
  }

  void setToken(String token) {
    setState(() {
      token = token;
      tokenn = token;
      print('tokenn =====>$tokenn');
    });
  }

  Future<User> getuser() async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(user.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print(documentSnapshot.data());
        patient = UserModel(
            hns: documentSnapshot.data()['hns'],
            cids: documentSnapshot.data()['cids']);

        // fetch();
        print(
            '-----------------------------Document data: ${documentSnapshot.data()} ');
        hns = patient.hns;
        cids = patient.cids;

        // Map<String, dynamic> _map = {"qn": 1272, "date": "2021-03-04"};
        // var data = jsonEncode(_map);
        onGetData();
        // getquuelists(hns);
        getPtright(cids);
        // fetchs(data);
        // medList(http.Client(), json);
        print('hns==== $hns');
        print('hns==== $cids');
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  Future<Null> finddisplay() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance.authStateChanges().listen((event) {
        displayname = event.displayName;
        inputHn = event.displayName;
        print('## = $displayname');
        print('##12 = $inputHn');
        // getAppointment();
      });
    });
    // checkAppointment;
  }

  Future<Null> readData() async {
    await Firebase.initializeApp().then((value) {
      print('init');
    });
  }

  Future<Null> getPtright(cids) async {
    var url =
        Uri.parse('http://q.chainathospital.org/app/kiosk/pt-right?cid=$cids');
    try {
      final http.Response response = await http.Client().get(
        url,
      );
      print('res = $response');
      var result = json.decode(response.body);
      print('result = $result');
      GetNHSO getptright = GetNHSO.fromJson(convert.jsonDecode(response.body));
      if (getptright.toString() != null) {
        setState(() {
          pt = getptright.subinsclName;
          birth = getptright.birthdate;
          // countSselect = getptright.countSelect;
          fname = getptright.fname;
          lname = getptright.lname;
          maininscl = getptright.maininscl;
          maininsclMain = getptright.maininsclMain;
          maininsclName = getptright.maininsclName;
          nation = getptright.nation;
          primaryAmphurName = getptright.primaryAmphurName;
          personId = getptright.personId;
          primaryAmphurName = getptright.primaryAmphurName;
          primaryMoo = getptright.primaryMoo;
          primaryMoobanName = getptright.primaryMoobanName;
          primaryProvinceName = getptright.primaryprovince;
          primaryTumbonName = getptright.primaryTumbonName;
          primaryprovince = getptright.primaryprovince;
          purchaseprovince = getptright.purchaseprovince;
          purchaseprovinceName = getptright.purchaseprovinceName;
          sex = getptright.sex;
          startdate = getptright.startdate;
          startdateSss = getptright.startdateSss;
          subinscl = getptright.subinscl;
          subinsclName = getptright.subinsclName;
          title = getptright.title;
          titleName = getptright.titleName;
          wsDataSource = getptright.wsDataSource;
          wsDateRequest = getptright.wsDateRequest;
          wsStatus = getptright.wsStatus;
          wsStatusDesc = getptright.wsStatusDesc;
          wsid = getptright.wsid;
          wsidBatch = getptright.wsidBatch;
          print('555555555555555555555555555555555555555555$subinsclName');
          // checkappointment();
        });
      }
    } catch (e) {}
  }

  Future<List<Queuelist>> getquuelists() async {
    var appState = Provider.of<AppProvider>(context, listen: false);
    var header = {'Content-Type': 'application/json'};
    var url = Uri.parse(
        'http://q.chainathospital.org/app/kiosk/queue-list?hn=${appState.patientInfo.hns}');

    final http.Response response = await http.Client().get(
      url,
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final result = jsonDecode(response.body);
      if (result['status'] == false) {
        print('#########3');
        setState(() {
          // getappointments = Future.value();
          loading = false;
        });
      } else {
        print('rrrrrr=${result['data']}');

        List<Object> _data = result['data'];

        setState(() {
          loading = false;

          queuelist = Future.value(
              _data.map((job) => new Queuelist.fromJson(job)).toList());
          // checkhnso();
        });
      }
    } else {
      loading = false;
      throw Exception('Failed to load album');
    }
  }

  Future _refreshData() async {
    await Future.delayed(Duration(seconds: 3));
    getquuelists();
  }

  Future<Null> medList(http.Client client, var json) async {
    print('44444444444$json');
    var url = Uri.parse(
        'http://chainathospital.org/coreapi/api/v2/get_rx_list_by_qn');

    print('ooooooooooooooooooooooooooo');

    try {
      final response = await client.post(url,
          headers: {"Content-Type": "application/json"}, body: json);
      var body = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (body['status'] == true && body['data'] != null) {
          setState(() {
            getRx = GetRx.fromJson(body);
          });
          print(getRx.data);
          if (getRx.data.length != 0) {
            final firstItem = getRx.data.elementAt(0);
            print('firstItem: ${firstItem.rxOperatorId}');
            print('firstItem: ${firstItem.qfinace}');
            setState(() {
              rxtype = getRx.data[0].rxType;
              rxid = getRx.data[0].rxOperatorId;
              count = getRx.data[0].countdrug;
              qfir = getRx.data[0].qfinace;
              hn = getRx.data[0].hn;
              deptCode = getRx.data[0].deptCode;
              department = getRx.data[0].department;
              vn = getRx.data[0].vn;
              print('#########################################hn ====> $hn');
              print('#########################################qfir ====>$qfir');
              print(
                  '#########################################count ====> $count');
              print(
                  '#########################################rxType===> $rxtype');
              print(
                  '#########################################rxOperatorId===> $rxid');
              print(
                  '#########################################count ====> $deptCode');
              print(
                  '#########################################rxType===> $department');
              print(
                  '#########################################rxOperatorId===> $vn');
            });
          } else {
            final snackBar = SnackBar(content: Text('ไม่พบข้อมูล.'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        } else {
          final snackBar = SnackBar(content: Text('ไม่พบข้อมูล.'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      } else {
        throw Exception('Failed to load data');
      }

      setState(() {
        loading = false;
      });
    } catch (e) {
      print(e);
      final snackBar = SnackBar(content: Text('Failed to load data.'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      setState(() {
        loading = false;
      });
    }
  }

  Future<void> onGetData() async {
    var appState = Provider.of<AppProvider>(context, listen: false);
    var header = {'Content-Type': 'application/json'};

    var url = Uri.parse(
        'http://chainathospital.org/coreapi/api/v2/get_patient_info/${appState.patientInfo.hns}/$date');

    var response = await http.get(url, headers: header);
    var result = jsonDecode(response.body);
    print('------$result');

    try {
      PatientModel patientModel =
          PatientModel.fromJson(convert.jsonDecode(response.body));
      if (patientModel.status == false) {
        isHasData = false;
        setState(() {
          ptname = '';
          hn = '';
          age = '';
          dob = '';
          cid = '';
        });
      } else {
        isHasData = true;
        setState(() {
          ptname = patientModel.data[0].ptName;
          hn = patientModel.data[0].hn;
          age = patientModel.data[0].age;
          dob = patientModel.data[0].dob;
          cid = patientModel.data[0].cid;
          phone = patientModel.data[0].phone;
          uid = appState.patientInfo.uid;
          print('111111111111111====$hn');
          print('11111111111111====$age');
          print('1111111111111111====$phone');
          print('1111111111111111====$uid');
        });
      }
    } catch (e) {
      print(e);
    }
  }

  void onSelectAppointItem(
    GetRx getRx,
    Queuelist queuelist,
  ) async {
    qn = queuelist.qQn; // print('*************$date');
    // print('*************$hns');
    // Map<String, dynamic> _map = {"qn": qn, "date": "2021-05-28"};
    // Map<String, dynamic> _map = {"qn": 1379, "date": "2021-04-20"};
    Map<String, dynamic> _map = {
      "qn": qn,
      "date": date
    }; // rxtyer =1 countdurg ไม่ใช่0
    //ไม่ได้ {"qn": 1575, "date": "2021-04-20"}
    var json = jsonEncode(_map);
    medList(http.Client(), json);
    var rx = getRx.data[0];
    if (rx.countdrug == '0') {
      if (rx.qfinace == '1') {
        setState(() {
          servicid = '54';
          qstatus = 11;
          servicgroub = '26';
        });
      }
      await savequeue(vn);
    } else if (qfir == '0') {
      await noHasDataDialog(context);
    } else if (rxtype == '2') {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          // title: const Text(''),
          content: const Text('ท่านต้องการเลือกรับยา\nใกล้บ้านหรือไม่?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'Cancel');
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: Comrx(
                      rxid: rxid,
                      count: count,
                      qfir: qfir,
                      age: age,
                    ),
                  ),
                );
              },
              child: const Text('ไม่ต้องการ'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'Ok');
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: Medicineroom(
                      rxid: rxid,
                      count: count,
                      qfir: qfir,
                      age: age,
                      ptname: ptname,
                      hn: hn,
                    ),
                  ),
                );
              },
              child: const Text('ต้องการ'),
            ),
          ],
        ),
      );
    } else {
      print('age $age');
      Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.leftToRight,
          child: Comrx(
            age: age,
            rxid: rxid,
            count: count,
            qfir: qfir,
          ),
        ),
      );

      if (count == '0') {
        if (qfir == '1') {
          setState(() {
            servicid = '55';
            qstatus = 11;
            servicgroub = '26';
          });
          await savequeue(vn);
        } else if (qfir == '0') {
          await noHasDataDialog(context);
        }
      } else {
        await Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.leftToRight,
            child: Comrx(
              rxid: rxid,
              count: count,

              qfir: qfir,
              age: age,
              // ptname: ptname,
              // inputHn: inputHn,
              // cid: cid,
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    tokenn = tokenn;
    return Scaffold(
      appBar: AppBar(
        title: Text('คิวตรวจ/ห้องจ่ายยา'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Container(
          //  color: Colors.cyan[400],
          width: MediaQuery.of(context).size.width * 0.90,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                flex: 9,
                child: Center(
                    child: RefreshIndicator(
                  onRefresh: _refreshData,
                  child: FutureBuilder<List<Queuelist>>(
                    future: queuelist,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return AppointItem(
                                queuelist: snapshot.data[index],
                                getRx: getRx,
                                tokenn: tokenn,
                                onSelectAppointItem: onSelectAppointItem);
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Text("error${snapshot.error}");
                      } else if (!loading && !snapshot.hasData) {
                        return InkWell(
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Padding(padding: EdgeInsets.only(top: 10.0)),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: Center(
                                        child: Text('คิวตรวจ/ห้องจ่ายยา',
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.cyan[400]))),
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 20.0)),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    height: 50.0,
                                    child: Text(
                                      'ท่านยังไม่มีคิวห้องตรวจ/ห้องจ่ายยา',
                                      style: GoogleFonts.prompt(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey[600],
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    height: 270.0,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image:
                                                AssetImage('images/go.png'))),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }

                      // By default, show a loading spinner.
                      return CircularProgressIndicator();
                    },
                  ),
                )),
              ),
              SizedBox(
                height: 10.0,
              ),
              floatingActionButton = Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 50.0,
                child: FloatingActionButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.5)),
                  clipBehavior: Clip.antiAlias,
                  onPressed: () {
                    MaterialPageRoute route = MaterialPageRoute(
                        builder: (value) => Department(
                              inputHn: inputHn,
                              ptname: ptname,
                              name: name,
                              cid: cid,
                              tokenn: tokenn,
                              phone: phone,
                              age: age,
                            ));
                    Navigator.push(context, route);
                  },
                  backgroundColor: Color(
                    0xffef8b43,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                      ),
                      Text(
                        'คิวตรวจรักษา',
                        style: GoogleFonts.prompt(fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future savequeue(vn) async {
    print('ggg');
    print('*************$vn');
    print('*************$tokenn');

    Map<String, dynamic> _map = {
      "patient_info": {
        "pt_name": ptname,
        "hn": inputHn,
        "cid": cid,
        "dob": dob,
        "age": age,
        "phone": phone,
        "data_visit": [
          {
            "vn": vn,
            "main_dep": deptCode,
            "department": department,
            "qn": qn,
          },
        ],
        "vn": [vn],
        "main_dep": [deptCode],
        "department": [
          " $deptCode : $birth",
          qn,
        ]
      },
      "right": {
        "birthdate": "birthdate",
        "count_select": "countSselect",
        "fname": fname,
        "lname": lname,
        "maininscl": maininscl,
        "maininscl_main": "maininsclM",
        "maininscl_name": pt,
        "nation": nation,
        "person_id": personId,
        "primary_amphur_name": primaryAmphurName,
        "primary_moo": primaryMoo,
        "primary_mooban_name": primaryMoobanName,
        "primary_province_name": primaryProvinceName,
        "primary_tumbon_name": primaryTumbonName,
        "primaryprovince": primaryprovince,
        "sex": sex,
        "subinscl": subinscl,
        "subinscl_name": subinsclName,
        "title": title,
        "title_name": titleName,
        "ws_data_source": wsDataSource,
        "ws_date_request": wsDateRequest,
        "ws_status": wsStatus,
        "ws_status_desc": wsStatusDesc,
        "wsid": wsid,
        "wsid_batch": wsidBatch
      },
      "appoint": {
        "appoint_id": null,
        "pt_name": null,
        "hn": null,
        "appoint_date": null,
        "appoint_time_begin": null,
        "appoint_time_end": null,
        "depcode": null,
        "department": null,
        "appoint_preparing": null,
        "appoint_reason": null,
        "doctor_id": null,
        "doctor_name": null,
        "appoint_status": null,
        "appoint_right_code": null,
        "appoint_right": null,
      },
      "servicegroupid": servicgroub,
      "serviceid": servicid,
      "created_from": 2,
      "quickly": 0,
      "q_status_id": qstatus,
      "u_id": uid,
      "token": tokenn
    };
    print(_map);
    var json = jsonEncode(_map);
    await queue(http.Client(), json);
  }

  Future<Null> queue(http.Client client, var json) async {
    print('gggggg #$json');
    var url = Uri.parse('http://q.chainathospital.org/app/kiosk/create-queue');
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json,
      );
      print('eee ${response.body}');
      var getData = await jsonDecode(response.body);
      print('wwww $getData');
      var getQ = await Getqueue.fromJson(getData);
      print(getQ.modelQueue.qIds);
      setState(() {
        q = getQ.modelQueue.qNum;
        qids = getQ.modelQueue.qIds.toString();
      });

      print('qqqqq $q');
      queues(context);

      // print('test ==> $getData ');
      // Map<String, dynamic> getqueue = jsonDecode(getData);
      // var getQ = Getqueue.fromJson(jsonDecode(getData));

      // print(getQ.modelQueue);
    } catch (e) {
      print(e);
    }
  }

  Future noHasDataDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: [
            Container(
              width: 440.0,
              height: 120.0,
              child: Column(
                children: [
                  Text(
                    'ไม่มีรายการยา',
                    style: GoogleFonts.kanit(
                      color: Colors.black,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Divider(
                    height: 15,
                    thickness: 1.0,
                    color: Colors.grey[100],
                  ),
                  Text(
                    'กลับบบ้านได้',
                    style: GoogleFonts.kanit(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: 115.0,
                  height: 53.0,
                  child: RaisedButton(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.0)),
                    onPressed: () {
                      // MaterialPageRoute route =
                      //     MaterialPageRoute(builder: (value) => HosScreen());
                      Navigator.pop(context);
                    },
                    child: Text(
                      'ปิดหน้าต่าง',
                      style: GoogleFonts.kanit(
                        fontSize: 22.0,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Future queues(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: [
            Container(
              width: 440.0,
              height: 120.0,
              child: Column(
                children: [
                  Text(
                    'รับบัตรคิว',
                    style: GoogleFonts.kanit(
                      color: Color(
                        0xff089EAD,
                      ),
                      fontSize: 24.0,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Divider(
                    height: 15,
                    thickness: 1.0,
                    color: Colors.grey[100],
                  ),
                  Text(
                    'รับหมายเลขคิวชำระเงิน\n$q',
                    style: GoogleFonts.kanit(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: 150.0,
                  height: 53.0,
                  child: RaisedButton(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(5.0),
                        side: BorderSide(
                          color: Color(
                            0xff089EAD,
                          ),
                        )),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'ปิดหน้าต่าง',
                      style: GoogleFonts.kanit(
                        fontSize: 22.0,
                        color: Color(
                          0xff089EAD,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class AppointItem extends StatelessWidget {
  AppointItem(
      {Key key,
      this.appoint,
      this.testfn,
      this.hresulty,
      this.firstItem,
      //this.getRx,
      this.rxqn,
      this.queuelist,
      this.getRx,
      this.tokenn,
      this.onSelectAppointItem})
      : super(key: key);
  final Appoint appoint;
  final Hresulty hresulty;
  final Queuelist queuelist;
  final Rxqn firstItem;
  final Rxqn rxqn;
  final GetRx getRx;
  final String tokenn;
  Function onSelectAppointItem;
  // final GetRx getRx;

  final Function testfn;
  List<ChackHnso> checkHnso = List();
  // List<GetRx> getRx = List();
  List<GetRx> getrX = List();
  GetRx getrx;

  var hnso;
  bool staus;
  ChackHnso chackHnso;
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
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        // padding: EdgeInsets.all(5),
        // width: MediaQuery.of(context).size.width,
        child: Column(children: [
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 20.0)),
              Expanded(
                  flex: 60,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '     ${queuelist.servicegroupName}' == null
                          ? "-"
                          : '${queuelist.servicegroupName}',
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
                  flex: 30,
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

          // Icon(Icons.date_range_outlined),
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            child:
                Divider(height: 10, thickness: 1.25, color: Colors.grey[400]),
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
                  flex: 40,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      queuelist.qNum == null ? "-" : queuelist.qNum,
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
                  flex: 60,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      queuelist.queueLeft == null ? "-" : queuelist.queueLeft,
                      // "$departmentName",
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
            child: Expanded(
              flex: 60,
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Column(
                      children: [
                        //Padding(padding: EdgeInsets.only(left: 5.0)),
                        SizedBox(
                            child: Text(
                              queuelist.serviceStatusName == null
                                  ? "-"
                                  : queuelist.serviceStatusName,
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
                            width:
                                MediaQuery.of(context).size.width * 0.99 / 2),

                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                queuelist.serviceStatusName == 'รอลงทะเบียน'
                                    ? Divider(
                                        thickness: 2,
                                        height: 0,
                                      )
                                    : Container(),
                                queuelist.serviceStatusName == 'รอลงทะเบียน'
                                    ? Align(
                                        alignment: Alignment.topLeft,
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                            textStyle:
                                                const TextStyle(fontSize: 16),
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              PageTransition(
                                                  type: PageTransitionType
                                                      .leftToRight,
                                                  child: Qrgetlist(
                                                    // qids: qids,
                                                    queuelist: queuelist,
                                                  )),
                                            );
                                          },
                                          child: const Text(
                                            '  Scan QR Code',
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      )
                                    : Container()
                              ],
                            ),
                            Row(
                              children: [
                                queuelist.serviceStatusName == 'เสร็จสิ้น'
                                    ? Divider(
                                        thickness: 2,
                                        height: 0,
                                      )
                                    : Container(),
                                queuelist.serviceStatusName == 'เสร็จสิ้น'
                                    ? Align(
                                        alignment: Alignment.topLeft,
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                            textStyle: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: "Kanit"),
                                          ),
                                          onPressed: () async {
                                            String qn = queuelist.qQn;

                                            print('qn========> $qn');

                                            onSelectAppointItem(
                                              getRx,
                                              queuelist,
                                            );
                                          },
                                          child: const Text(
                                            'คิวห้องยาและการเงิน',
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      )
                                    : Container()
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  Future<Null> checkhnso(nhso) async {
    print('------------');
    var header = {'Content-Type': 'application/json'};
    var url = Uri.parse(
        'http://chainathospital.org/coreapi/api/v2/check_state_nhso/');

    try {
      var response = await http.get(url, headers: header);
      ChackHnso chackHnso =
          ChackHnso.fromJson(convert.jsonDecode(response.body));

      for (var i = 0; i < chackHnso.nonCheckNhso.length; i++) {
        checkHnso.add(chackHnso);
      }

      if (chackHnso.nonCheckNhso.contains(hnso) == true) {
        status = true;
        print('[[[[[$hnso]]]]]');
      } else {
        print('[[[[[$hnso]]]]]');
        status = false;
      }
    } catch (e) {}
  }
}
