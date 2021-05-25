import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class AppBottomBar extends StatelessWidget {
  AppBottomBar({Key key, this.onItemTapped, this.selectedIndex})
      : super(key: key);

  final Function onItemTapped;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {



    return ConvexAppBar(

      
          items: [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.favorite, title: 'Favorites'),
            TabItem(icon: Icons.search, title: 'Search'),
            TabItem(icon: Icons.person, title: 'Profile'),
          ],
          initialActiveIndex: 0,//optional, default as 0
          onTap: (int i ){
           //will print index value of which item is been clicked 
            print("index $i");
          },
        );
    // return BottomNavigationBar(
    //   items: const <BottomNavigationBarItem>[
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.home),
    //       label: 'Home',
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.business),
    //       label: 'Business',
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.school),
    //       label: 'School',
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.school),
    //       label: 'Sc',
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.school),
    //       label: 'ool',
    //     ),
    //   ],
    //   currentIndex: selectedIndex,
    //   selectedItemColor: Colors.amber[800],
    //   onTap: (int index) {
    //     onItemTapped(index);
    //   },
    // );
  }
}



/////ใส่ทุกหน้า  currentIndex: selectedIndex,
      // selectedItemColor: Colors.amber[800],
      // onTap: (int index) {
      //   onItemTapped(index);
      // },
