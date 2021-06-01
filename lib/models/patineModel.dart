// class PatientModel {
//   bool status;
//   List<Data> data;

//   PatientModel({this.status, this.data});

//   PatientModel.fromJson(Map<String, dynamic> json) {
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
class PatientModel {
  bool status;
  List<Data> data;

  PatientModel({this.status, this.data});

  PatientModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String ptName;
  String hn;
  String cid;
  String dob;
  String age;
  String phone;
  List<DataVisit> dataVisit;
  List<String> vn;
  List<String> mainDep;
  List<String> department;

  Data(
      {this.ptName,
      this.hn,
      this.cid,
      this.dob,
      this.age,
      this.phone,
      this.dataVisit,
      this.vn,
      this.mainDep,
      this.department});

  Data.fromJson(Map<String, dynamic> json) {
    ptName = json['pt_name'];
    hn = json['hn'];
    cid = json['cid'];
    dob = json['dob'];
    age = json['age'];
    phone = json['phone'];
    if (json['data_visit'] != null) {
      dataVisit = new List<DataVisit>();
      json['data_visit'].forEach((v) {
        dataVisit.add(new DataVisit.fromJson(v));
      });
    }
else {
      dataVisit = null;
    }
    if (json['vn'] != null) {
      vn = json['vn'].cast<String>();
    } else {
      vn = null;
    }
    if (json['main_dep'] != null) {
      mainDep = json['main_dep'].cast<String>();
    } else {
     mainDep = null;
    }
      if (json['department'] != null) {
     department = json['department'].cast<String>();
    } else {
      department = null;
    }
    // vn = json['vn'].cast<String>();
    // mainDep = json['main_dep'].cast<String>();
    // department = json['department'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pt_name'] = this.ptName;
    data['hn'] = this.hn;
    data['cid'] = this.cid;
    data['dob'] = this.dob;
    data['age'] = this.age;
    data['phone'] = this.phone;
    if (this.dataVisit != null) {
      data['data_visit'] = this.dataVisit.map((v) => v.toJson()).toList();
    }
    data['vn'] = this.vn;
    data['main_dep'] = this.mainDep;
    data['department'] = this.department;
    return data;
  }
}

class DataVisit {
  String vn;
  String mainDep;
  String department;
  String qn;

  DataVisit({this.vn, this.mainDep, this.department, this.qn});

  DataVisit.fromJson(Map<String, dynamic> json) {
    vn = json['vn'];
    mainDep = json['main_dep'];
    department = json['department'];
    qn = json['qn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vn'] = this.vn;
    data['main_dep'] = this.mainDep;
    data['department'] = this.department;
    data['qn'] = this.qn;
    return data;
  }
}

