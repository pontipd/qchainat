import 'package:chainatqueue/screens/getmedicine.dart';
import 'package:chainatqueue/screens/haveappointment.dart';
import 'package:chainatqueue/screens/login.dart';
import 'package:chainatqueue/utility/buttom_bar.dart';
import 'package:chainatqueue/utility/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Getmedicine extends StatefulWidget {
  @override
  _GetmedicineState createState() => _GetmedicineState();
}

class _GetmedicineState extends State<Getmedicine> {
    var floatingActionButton;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Appointment'),
      // ),
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
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Color(
            0xffeff7f9,
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 16.0,
                child: Text(
                  "รับยาใกล้บ้าน",
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.kanit(
                    color: Color(
                      0xff089EAD,
                    ),
                    fontSize: 24.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                // width: 342,
                // height: 20,
              ),
              Padding(padding: EdgeInsets.only(top: 50.0)),
              Text(
                'อัพเดทคิว  12 ก.พ. 2564 เวลา 12.00 น.',
                style: GoogleFonts.prompt(
                  fontSize: 16.0,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40.0,
              ),
              InkWell(
                onTap: () {
                  // MaterialPageRoute route =
                  //     MaterialPageRoute(builder: (value) => Havemedicine());
                  // Navigator.push(context, route);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: 273.0,
                  decoration: BoxDecoration(
                      image:
                          DecorationImage(image: AssetImage('images/kisspng.png'))),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              Text(
                'ท่านยังไม่มีรายการรับยาใกล้บ้าน',
                style: GoogleFonts.kanit(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[600],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              SizedBox(
                height: 40.0,
              ),
              
            ],
          ),
        ),
      ),
       bottomNavigationBar: BottomBar(),
    );
  }
}
