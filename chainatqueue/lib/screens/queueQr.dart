import 'dart:convert';
import 'dart:io';

import 'package:chainatqueue/models/Queuelist.dart';
import 'package:chainatqueue/models/getDepartment.dart';
import 'package:chainatqueue/models/getserviceList.dart';
import 'package:chainatqueue/screens/queuetaking.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:chainatqueue/utility/my_style.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:barcode/barcode.dart';
import 'package:google_fonts/google_fonts.dart';

class QueueQr extends StatefulWidget {
  final String q, qids, qid, hn;
  Queuelist queuelist;

  QueueQr({
    Key key,
    this.q,
    this.qids,
    this.queuelist,
    this.hn,
    this.qid,
  }) : super(key: key);

  @override
  _QueueQrState createState() => _QueueQrState();
}

class _QueueQrState extends State<QueueQr> {
  set floatingActionButton(Container floatingActionButton) {}
  double screen;
  String q, qids, filename, qid, hn;
  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width * 0.95;
    q = "${widget.q}";
    qids = "${widget.hn}";
    // qids = "${widget.qids}";
    hn = "${widget.hn}";
   qids = "${widget.queuelist.qHn}";

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "QR Code เพื่อลงทะเบียน",
          style: GoogleFonts.kanit(
            fontSize: 24.0,
            color: Color(
              0xff116EA8,
            ),
          ),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.grey),
            onPressed: () {
              Navigator.pop(context);
            }
            //  onPressed: () =>
            //   Navigator.of(context).pop(),

            ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.90,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.90,
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 40.0)),
                  // Row(
                  //   children: <Widget>[
                  //     IconButton(
                  //         icon: Icon(Icons.arrow_back),
                  //         iconSize: 36.0,
                  //         color: Color(
                  //           0xff828282,
                  //         ),
                  //         onPressed: () {
                  //           Navigator.pop(context);
                  //         }),
                  //     Text(
                  //       'QR Code เพื่อลงทะเบียน $qids',
                  //       style: GoogleFonts.kanit(
                  //         fontSize: 24.0,
                  //         color: Color(
                  //           0xff116EA8,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 30.0,
                  // ),

                  Container(
                    child: BarcodeWidget(
                      barcode: Barcode.code128(),
                      data: '$qids',
                      drawText: false,
                    ),
                    width: 200,
                  ),

                  SizedBox(
                    height: 40,
                  ),

                  QrImage(
                    data: '$qids',
                    version: QrVersions.auto,
                    size: 200.0,
                  ),

//  buildBarcode(
//     Barcode.code128(useCode128B: false, useCode128C: false),
//     'BARCODE\t128',
//     filename: 'code-128a',
//   );

// Generate a SVG with "Hello World!"
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
