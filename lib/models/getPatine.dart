// class getpatirnt {
//   bool status;
//   List<Data> data;

//   getpatirnt({this.status, this.data});

//   getpatirnt.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     if (json['data'] != null) {
//       data = new List<Data>();
//       json['data'].forEach((v) {
//         data.add(new Data.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.data != null) {
//       data['data'] = this.data.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Data {
//   String ptName;
//   String hn;
//   String cid;
//   String dob;
//   String age;

//   Data({this.ptName, this.hn, this.cid, this.dob, this.age});

//   Data.fromJson(Map<String, dynamic> json) {
//     ptName = json['pt_name'];
//     hn = json['hn'];
//     cid = json['cid'];
//     dob = json['dob'];
//     age = json['age'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['pt_name'] = this.ptName;
//     data['hn'] = this.hn;
//     data['cid'] = this.cid;
//     data['dob'] = this.dob;
//     data['age'] = this.age;
//     return data;
//   }
// }
