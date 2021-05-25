import 'package:flutter/material.dart';

/* Text เมื่อกดปุ่ม ลงทะเบียน แสดงว่าท่านยอมรับ ข้อตกลงการใช้บริการของเรา
    
  */
class Ok extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
        overflow: TextOverflow.visible,
        textAlign: TextAlign.center,
        text: const TextSpan(
          style: TextStyle( 
            height: 1.5,
            fontSize: 18.0,
            fontFamily: 'Kanit',
            fontWeight: FontWeight.w400,
            color: Color.fromARGB(255, 79, 79, 79),

            /* letterSpacing: 0.18, */
          ),
          children: [
            TextSpan(
              text: '''เมื่อกดปุ่ม ''',
              style: TextStyle(
                fontSize: 18.0,
                fontFamily: 'Kanit',
                /* letterSpacing: null, */
              ),
            ),
            TextSpan(
              text: '''ลงทะเบียน''',
              style: TextStyle(
                color: Color.fromARGB(255, 8, 158, 173),

                /* letterSpacing: null, */
              ),
            ),
            TextSpan(
              text: ''' แสดงว่าท่านยอมรับ 
''',
              style: TextStyle(
                fontSize: 18.0,

                /* letterSpacing: null, */
              ),
            ),
            TextSpan(
              text: '''ข้อตกลงการใช้บริการของเรา''',
              style: TextStyle(
                fontSize: 18.0,
                color: Color.fromARGB(255, 8, 158, 173),

                /* letterSpacing: null, */
              ),
            )
          ],
        ));
  }

  showok() {}
  
}
