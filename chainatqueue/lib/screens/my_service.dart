
import 'package:chainatqueue/utility/my_style.dart';
import 'package:flutter/material.dart';

class Myservic extends StatefulWidget {
  @override
  _MyservicState createState() => _MyservicState();
}

class _MyservicState extends State<Myservic> {
   int index = 0;

  get showWidget => null;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().darkColor,
      ),drawer: Drawer(), body:showWidget[index],
     
    );
  }

  Widget myButttonbar() {
    return BottomNavigationBar(
      onTap: (int i) {
        setState(() {
          index = i;
        });
      },
      currentIndex: index,
      items:<BottomNavigationBarItem> [
        nnav(),
        bnav(),
        cnav(),
        dnav(),
        enav(),
      ],
    );
  }

  

  BottomNavigationBarItem nnav() {
      return BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text("First"),
      );
    }

    BottomNavigationBarItem bnav() {
      return BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text("First"),
      );
    }

    BottomNavigationBarItem cnav() {
      return BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text("First"),
      );
    }

    BottomNavigationBarItem dnav() {
      return BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text("First"),
      );
    }

    BottomNavigationBarItem enav() {
      return BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text("First"),
      );
    }
}