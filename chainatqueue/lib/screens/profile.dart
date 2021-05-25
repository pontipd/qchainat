import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File _image;
  final imagePicker = ImagePicker();
  Future getImage() async {
    final image = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      _image = File(image.path);
    });
  }

  String genders, type;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(
        0xffFFFFFF,
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          height: MediaQuery.of(context).size.height * 1.5,
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 30.0)),
                  Row(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.navigate_before),
                          iconSize: 36.0,
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      Text(
                        'ตั้งค่า',
                        style: GoogleFonts.prompt(
                          fontSize: 24.0,
                          color: Color(
                            0xff089EAD,
                          ),
                        ),
                      )
                    ],
                  ),
               
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "ข้อมูลส่วนตัว",
                          style: GoogleFonts.prompt(
                            fontSize: 18.0,
                            color: Color(
                              0xff089EAD,
                            ),
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Column(
                          children: [
                            _image == null
                                ? Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image:
                                              AssetImage('images/person.png')),
                                    ),
                                  )
                                : Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: FileImage(_image)))),
                            Row(
                              children: [
                                InkWell(
                                  onTap: getImage,
                                  child: Text(
                                    'ถ่ายภาพ',
                                    style: GoogleFonts.prompt(
                                      fontSize: 16.0,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: getImage,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.grey[600],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    width: 300,
                  ),
                  gender(),
                  nameForm(),
                  Padding(padding: EdgeInsets.only(top: 15.0)),
                  surnameForm(),
                  Padding(padding: EdgeInsets.only(top: 15.0)),
                  idCard(),
                  Padding(padding: EdgeInsets.only(top: 15.0)),
                  driverlicense(),
                  Padding(padding: EdgeInsets.only(top: 15.0)),
                  phone(),
                  Padding(padding: EdgeInsets.only(top: 15.0)),
                  emailForm(),
                  Padding(padding: EdgeInsets.only(top: 40.0)),
                  button(),
                  Padding(padding: EdgeInsets.only(top: 30.0)),
                  empty(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  empty() => Container(
        width: 30.0,
      );

  Widget button() => Container(
      margin: new EdgeInsets.symmetric(horizontal: 20.0),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 50.0,
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                   
                    Text(
                      'ย้อนกลับ  ',
                      style: GoogleFonts.prompt(
                        fontSize: 22.0,
                        color: Color(
                          0xff727876,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5.0),
                ),
              ),
            ),
            Container(
              height: 50.0,
              child: RaisedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => SimpleDialog(
                      title: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: 150.0,
                        child: Column(
                          children: <Widget>[
                            Text(
                              "ปรับปรุงข้อมูลสำเร็จ",
                              style: GoogleFonts.prompt(
                                color: Color(
                                  0xff089EAD,
                                ),
                                fontSize: 24,
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
                                  // print("Button clicked!");
                                  // MaterialPageRoute route = MaterialPageRoute(
                                  //     builder: (value) => Menu());
                                  // Navigator.pushAndRemoveUntil(context, route, (route) => false);
                                },
                                child: Text(
                                  "ปิดหน้าต่าง",
                                  style: GoogleFonts.prompt(fontSize: 18.0),
                                ),
                                textColor: Colors.white,
                                color: Color(
                                  0xff089EAD,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                   5.0,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ' ยืนยันข้อมูล',
                      style: GoogleFonts.prompt(
                          fontSize: 22.0, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    // Icon(
                    //   Icons.border_outer,
                    //   color: Colors.green[200],
                    // ),
                  ],
                ),
                color: Color(
                  0xff089EAD,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5.0),
                ),
              ),
            ),
          ],
        ),
      ));

  emailForm() => Container(
        margin: new EdgeInsets.symmetric(horizontal: 10.0),
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        child: TextFormField(
          // onChanged: (value) => user = value.trim(),
          decoration: InputDecoration(
            // prefixIcon: Icon(
            //   Icons.account_box,
            //   color: MyStyle().darkColor,
            // ),
            labelStyle:
                GoogleFonts.prompt(fontSize: 16.0, color: Colors.grey[600]),
            labelText: 'อีเมล์',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.grey[300])),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[300])),
          ),
        ),
        color: Colors.grey[100],
      );

  phone() => Container(
        margin: new EdgeInsets.symmetric(horizontal: 10.0),
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        child: TextFormField(
          keyboardType: TextInputType.number,
          // onChanged: (value) => user = value.trim(),
          decoration: InputDecoration(
            // prefixIcon: Icon(
            //   Icons.account_box,
            //   color: MyStyle().darkColor,
            // ),
            labelStyle:
                GoogleFonts.prompt(fontSize: 16.0, color: Colors.grey[600]),
            labelText: 'โทรศัพท์',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.grey[300])),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[300])),
          ),
        ),
        color: Colors.grey[100],
      );

  driverlicense() => Container(
        margin: new EdgeInsets.symmetric(horizontal: 10.0),
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        child: TextFormField(
          // onChanged: (value) => user = value.trim(),
          decoration: InputDecoration(
            // prefixIcon: Icon(
            //   Icons.account_box,
            //   color: MyStyle().darkColor,
            // ),
            labelStyle:
                GoogleFonts.prompt(fontSize: 16.0, color: Colors.grey[600]),
            labelText: 'วันเดือนปีเกิด',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.grey[300])),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[300])),
          ),
        ),
        color: Colors.grey[100],
      );

  idCard() => Container(
        margin: new EdgeInsets.symmetric(horizontal: 10.0),
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        child: TextFormField(
          keyboardType: TextInputType.number,
          // onChanged: (value) => user = value.trim(),
          decoration: InputDecoration(
            // prefixIcon: Icon(
            //   Icons.account_box,
            //   color: MyStyle().darkColor,
            // ),
            labelStyle:
                GoogleFonts.prompt(fontSize: 16.0, color: Colors.grey[600]),
            labelText: 'เลขที่บัตรประชาชน',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.grey[300])),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[300])),
          ),
        ),
        color: Colors.grey[100],
      );

  surnameForm() => Container(
        margin: new EdgeInsets.symmetric(horizontal: 10.0),
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        child: TextFormField(
          // onChanged: (value) => user = value.trim(),
          decoration: InputDecoration(
            // prefixIcon: Icon(
            //   Icons.account_box,
            //   color: MyStyle().darkColor,
            // ),
            labelStyle:
                GoogleFonts.prompt(fontSize: 16.0, color: Colors.grey[600]),
            labelText: 'นามสกุล',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.grey[300])),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[300])),
          ),
        ),
        color: Colors.grey[100],
      );

  nameForm() => Container(
        margin: new EdgeInsets.symmetric(horizontal: 10.0),
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        child: TextFormField(
          // onChanged: (value) => user = value.trim(),
          decoration: InputDecoration(
            // prefixIcon: Icon(
            //   Icons.account_box,
            //   color: MyStyle().darkColor,
            // ),
            labelStyle:
                GoogleFonts.prompt(fontSize: 16.0, color: Colors.grey[600]),
            labelText: 'ชื่อ',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.grey[300])),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[300])),
          ),
        ),
        color: Colors.grey[100],
      );

  Widget gender() => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Radio(
            value: 'นาย',
            groupValue: genders,
            onChanged: (value) {
              genders = value;
              setState(() {});
            },
          ),
          Text(
            'นาย',
            style: GoogleFonts.prompt(fontSize: 16.0, color: Colors.grey[600]),
          ),
          Radio(
            value: 'นางสาว',
            groupValue: genders,
            onChanged: (value) {
              genders = value;
              setState(() {});
            },
          ),
          Text(
            'นางสาว',
            style: GoogleFonts.prompt(fontSize: 16.0, color: Colors.grey[600]),
          ),
          Radio(
            value: 'นาง',
            groupValue: genders,
            onChanged: (value) {
              genders = value;
              setState(() {});
            },
          ),
          Text(
            'นาง',
            style: GoogleFonts.prompt(fontSize: 16.0, color: Colors.grey[600]),
          ),
        ],
      );
}
