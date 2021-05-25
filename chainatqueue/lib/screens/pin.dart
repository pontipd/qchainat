import 'package:chainatqueue/screens/login.dart';
import 'package:chainatqueue/screens/startouse.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_view/pin_code_view.dart';

class Pincode2 extends StatefulWidget {
  final String genders,
      username,
      password,
      type,
      name,
      surname,
      phon,
      bh,
      cids,
      inputHn,
      hns;

  Pincode2(
      {Key key,
      this.bh,
      this.cids,
      this.genders,
      this.name,
      this.password,
      this.phon,
      this.surname,
      this.type,
      this.hns,
      this.inputHn,
      this.username})
      : super(key: key);

  @override
  _Pincode2State createState() => _Pincode2State();
}

class _Pincode2State extends State<Pincode2> {
  String genders,
      username,
      password,
      type,
      name,
      surname,
      phon,
      bh,
      cids,
      hns,
      inputHn;
  bool isHasData;
  @override
  Widget build(BuildContext context) {
    bh = "${widget.bh}";
    surname = "${widget.surname}";

    name = "${widget.name}";
    cids = "${widget.cids}";
    hns = "${widget.hns}";
    inputHn = "${widget.inputHn}";
    print('pin $inputHn');

    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(
              0x21992e9,
            ),
            Colors.blue[200],
          ],
          stops: [
            0.8,
            1,
          ],
        ),
      ),
      child: PinCode(
        keyTextStyle: TextStyle(
          color: Colors.blue,
          fontSize: 20.0,
        ),
        backgroundColor: Colors.grey[200],
        correctPin: '123456',
        codeTextStyle: GoogleFonts.prompt(
          color: Color(
            0xff09b5c1,
          ),
        ),
        title: Text(
          'เข้าใช้งานระบบ',
          style: GoogleFonts.prompt(
            fontSize: 24.0,
            color: Color(0xff116ea8),
          ),
        ),
        subTitle: Text(
          'ระบุ Pin Code',
          style: GoogleFonts.prompt(
            fontSize: 20.0,
            color: Color(0xff116ea8),
          ),
        ),
        obscurePin: true,
        codeLength: 6,
        onCodeSuccess: (success) {
          MaterialPageRoute route = MaterialPageRoute(
              builder: (value) => Startouse1(
                name: name,
                                            cids: cids,
                                            bh: bh,
                                            hns: hns,
                                            phon: phon,
                                            surname: surname,
                  
                    inputHn: inputHn,
                  ));
          Navigator.push(context, route);
        },
        onCodeFail: (fail) {
          showDialog(
            context: context,
            builder: (context) => SimpleDialog(
              title: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 170.0,
                child: Column(
                  children: <Widget>[
                    Text(
                      "รหัสผ่านไม่ถูกต้อง กรุณาลองใหม่อีกครั้ง",
                      style: GoogleFonts.prompt(
                        color: Color(
                          0xff27b345,
                        ),
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      height: 50.0,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          print("Button clicked!");
                        },
                        child: Text(
                          "OK",
                          style: GoogleFonts.prompt(fontSize: 20.0),
                        ),
                        textColor: Colors.white,
                        color: Color(
                          0xff2f80ed,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            100,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    ));
  }
}
