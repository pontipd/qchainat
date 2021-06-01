import 'package:flutter/material.dart';

class Mystyle {
  var now = DateTime.now();
  Container head() {
    return Container(
      width: double.infinity,
      height: 155,
      padding: EdgeInsets.only(top: 15.0),
      child: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 50,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      image:
                          DecorationImage(image: AssetImage('images/home.png')),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "ระบบคิวอัจฉริยะ",
                      style: TextStyle(
                        fontFamily: "Prompt",
                        color: Color(
                          0xff0baabd,
                        ),
                        fontSize: 64,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(right: 15.0)),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "วันพฤหัสบดี ที่ ${now.day} เมษายน ${now.year} เวลา ${now.hour}:${now.minute} น.   ",
                style: TextStyle(
                  fontFamily: "Prompt",
                  color: Color(
                    0xff0baabd,
                  ),
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container bottomBar() {
    return Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Chai Nat Hospital",
              style: TextStyle(
                color: Color(
                  0xfff2fbf9,
                ),
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
                fontFamily: "Prompt",
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                Text(
                  "199 5 Phahonyothin Rd, Ban Kluai, Mueang Chai Nat District, Chai Nat 17000 Call  : 056-411-055",
                  style: TextStyle(
                    color: Color(
                      0xfff2fbf9,
                    ),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Prompt",
                  ),
                ),
                SizedBox(width: 162.0,),
                // Align(alignment: Alignment.topRight,
                //                   child: Container(
                //     alignment: Alignment.center,
                //     child: Container(
                //       width: 70,
                //       height: 70,
                //       decoration: BoxDecoration(
                //         image:
                //             DecorationImage(image: AssetImage('images/logodepa.png')),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Container(
            width: double.infinity,
            child: Divider(
              height: 15,
              thickness: 1.0,
              color: Color(
                0xfff2fbf9,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Version 1.0",
                style: TextStyle(
                  color: Color(
                    0xfff2fbf9,
                  ),
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Prompt",
                ),
              ),
              Text(
                "         Dev by AndamanPatana ",
                style: TextStyle(
                  color: Color(
                    0xfff2fbf9,
                  ),
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Prompt",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Mystyle();
}
