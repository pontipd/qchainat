import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyStyledeawer{
   Color darkColor = Colors.pink[300];
   Color primaryColor = Colors.green;
   //ความห่างของBOX
  SizedBox mySizeBox() => SizedBox(width:8.0,height: 10.0,);

 Text showTitle(String title) => Text(
   title,
   
   style: TextStyle(
     fontSize:24.0,
     color:Colors.pink[300],
     fontWeight: FontWeight.bold,
      ),
   );

   MyStyledeawer();

  
 }

