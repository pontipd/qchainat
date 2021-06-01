

import 'package:chainatqueue/utility/my_style.dart';
import 'package:flutter/material.dart';

Future<Null> normalDialog(
    BuildContext context, String string) async {
  showDialog(
    
      context: context,
      builder: (context) => SimpleDialog(
            title: ListTile(
              leading: Image.asset('images/logo.png'),
              // leading: MyStyle().showLogo(),
              // title: Text(
                // title,
                // style: MyStyle().prinaryStyle(),
              
              title: Text(
                'คุณมีช่องว่าง?',
                style: MyStyle().redBoldStyle(),
              ),
                subtitle: Text(string,
                 style: MyStyle().prinaryStyle(),
                ),
              ),
              // subtitle: Text(message,style:MyStyle().pinkStyle() ,),
            // ),
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'ตกลง',
                  style: MyStyle().okStyle(),
                  ),
              ),
            ],
          ));

          
}


Future<Null> shoDialog(
    BuildContext context, String string) async {
  showDialog(
      context: context,
      builder: (context) => SimpleDialog(
            title: ListTile(
              leading: Image.asset('images/logo.png'),
              // leading: MyStyle().showLogo(),
              // title: Text(
                // title,
                // style: MyStyle().prinaryStyle(),
              title: Text(
                '',
                style: MyStyle().redBoldStyle(),
              ),
                subtitle: Text(string,
                 style: MyStyle().prinaryStyle(),
                ),
              ),
              // subtitle: Text(message,style:MyStyle().pinkStyle() ,),
            // ),
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'ตกลง',
                  style: MyStyle().okStyle(),
                  ),
              ),
            ],
          ));

          
}