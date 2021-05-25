import 'package:chainatqueue/main.dart';
import 'package:chainatqueue/screens/profile.dart';
import 'package:chainatqueue/screens/resetPassword.dart';
import 'package:chainatqueue/screens/resetpin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(Nav());

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int index = 0;
  List<Widget> list = [
    Profile(),
    RePassword(),
    ResetPin(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Nav'),
        ),
        body: list[index],
        drawer: MyDrawer(
          onTap: (ctx, i) {
            setState(() {
              index = i;
              Navigator.pop(ctx);
            });
          },
        ),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  final Function onTap;
  MyDrawer({this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Padding(
                padding: EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 60,
                      height: 60,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/person.png'),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'aaaaaaa',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      'xxxx@gmail.com',
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.grey[600],
              ),
              title: Text(
                'ข้อมูลส่วนตัว',
                style:
                    GoogleFonts.prompt(fontSize: 18.0, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              onTap: () => onTap(context, 0),
            ),
            ListTile(
              leading: Icon(
                Icons.screen_lock_portrait,
                color: Colors.grey[600],
              ),
              title: Text(
                'เปลี่ยน Pin Code',
                style:
                    GoogleFonts.prompt(fontSize: 18.0, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              onTap: () => onTap(context, 1),
            ),
            ListTile(
              leading: Icon(
                Icons.lock,
                color: Colors.grey[600],
              ),
              title: Text(
                'เปลี่ยนรหัสผ่าน',
                style:
                    GoogleFonts.prompt(fontSize: 18.0, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              onTap: () => onTap(context, 2),
            ),
            ListTile(
              leading: Icon(
                Icons.notifications,
                color: Colors.grey[600],
              ),
              title: Text(
                'แจ้งเตือนนัดหมาย',
                style:
                    GoogleFonts.prompt(fontSize: 18.0, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              onTap: () => onTap(context, 3),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.grey[600],
              ),
              title: Text(
                'เวอร์ชั่น',
                style:
                    GoogleFonts.prompt(fontSize: 18.0, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              onTap: () => onTap(context, 4),
            ),
            Divider(
              height: 1.0,
            ),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.grey[600],
              ),
              title: Text(
                'ออกจากระบบ',
                style:
                    GoogleFonts.prompt(fontSize: 18.0, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              onTap: () => onTap(context, 0),
            ),
          ],
        ),
      ),
    );
  }
}
