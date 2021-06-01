//  Future<List<Hresulty>> fetchAppoints(http.Client client, var json)  async {
//     // final response = await http.get(Uri.http('http://chainathospital.org',
//     //     '/coreapi/api/v2/get_appointment_list/0408812'));

//     var header = {'Content-Type': 'application/json'};
//     var url = Uri.parse(
//         'http://chainathospital.org/coreapi/api/v2/get_appointment_list/${patient.hns}');

//     final http.Response response = await http.Client().get(
//       url,
//     );

//     if (response.statusCode == 200) {
//       // If the server did return a 200 OK response,
//       // then parse the JSON.
//       final result = jsonDecode(response.body);
//       print('rrrrrr=${result['data']}');
//       List data = result['data'];
//       setState(() {
//         getappointments =
//             Future.value(data.map((job) => new Appoint.fromJson(job)).toList());

//         // checkhnso();
//       });
//     } else {
//       // If the server did not return a 200 OK response,
//       // then throw an exception.
//       throw Exception('Failed to load album');
//     }
//   }

// Future<dynamic> medList(http.Client client, var json) async {
//     var url =
//         Uri.parse('http://chainathospital.org/coreapi/api/v2/get_med_exam_list/0408812');
//     try {
//       final response = await client.post(url,
//           headers: {"Content-Type": "application/json"}, body: json);
//       print('res**********ssssss*ressssssss = $response');
//       var getData = jsonDecode(response.body);
//       print('test*** ==> $getData ');
//       GetHresult gethresult = GetHresult.fromJson(convert.jsonDecode(getData));
//       setState(() {
//         for (var i = 0; i < gethresult.data.length; i++) {
//           gethresults.add(gethresult);
//         }
//         // checkhnso();
//       });
      
//     } catch (e) {
//       print(e);
//     }
//   }





dynamic hn;
  dynamic medExamId;
  dynamic medExamDate;
  dynamic medExamYear;
  dynamic ptName;
  dynamic age;
  dynamic examDate;
  dynamic bp;
  dynamic weight;
  dynamic height;
  dynamic bmi;
  dynamic pulse;
  dynamic respiration;
  dynamic cXR;
  dynamic uAGlucose;
  dynamic uAProtein;
  dynamic uAPH;
  dynamic uASpGr;
  dynamic stoolExamination;
  dynamic cBCWBCCount;
  dynamic cBCNeutrophil;
  dynamic cBCLymphocyte;
  dynamic cBCMonocyte;
  dynamic cBCEosinophil;
  dynamic cBCBasophil;
  dynamic cBCRBCCount;
  dynamic cBCHemoglobin;
  dynamic cBCHematocrit;
  dynamic cBCMCV;
  dynamic cBCPlateletCount;
  dynamic fBS;
  dynamic cholesterol;
  dynamic triglyceride;
  dynamic hDL;
  dynamic lDL;
  dynamic bUN;
  dynamic creatinine;
  dynamic sGOT;
  dynamic sGPT;
  dynamic alkalinePhosphatse;
  dynamic uricAcid;