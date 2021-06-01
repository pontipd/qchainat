class Getrx {
  bool status;
  List<Data> data;

  Getrx({this.status, this.data});

  Getrx.fromJson(Map<String, dynamic> json) {
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
  dynamic rxOperatorId;
  String hn;
  String vstdate;
  String vn;
  String date;
  String doctorId;
  String doctorName;
  String rxType;
  String drugStatus;
  String countdrug;
  String qfinace;
  List<DataPharmacy> dataPharmacy;

  Data(
      {this.rxOperatorId,
      this.hn,
      this.vstdate,
      this.vn,
      this.date,
      this.doctorId,
      this.doctorName,
      this.rxType,
      this.drugStatus,
      this.countdrug,
      this.qfinace,
      this.dataPharmacy});

  Data.fromJson(Map<String, dynamic> json) {
    rxOperatorId = json['rx_operator_id'];
    hn = json['hn'];
    vstdate = json['vstdate'];
    vn = json['vn'];
    date = json['date'];
    doctorId = json['doctor_id'];
    doctorName = json['doctor_name'];
    rxType = json['rx_type'];
    drugStatus = json['drug_status'];
    countdrug = json['countdrug'];
    qfinace = json['qfinace'];
    if (json['data_pharmacy'] != null) {
      dataPharmacy = new List<DataPharmacy>();
      json['data_pharmacy'].forEach((v) {
        dataPharmacy.add(new DataPharmacy.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rx_operator_id'] = this.rxOperatorId;
    data['hn'] = this.hn;
    data['vstdate'] = this.vstdate;
    data['vn'] = this.vn;
    data['date'] = this.date;
    data['doctor_id'] = this.doctorId;
    data['doctor_name'] = this.doctorName;
    data['rx_type'] = this.rxType;
    data['drug_status'] = this.drugStatus;
    data['countdrug'] = this.countdrug;
    data['qfinace'] = this.qfinace;
    if (this.dataPharmacy != null) {
      data['data_pharmacy'] = this.dataPharmacy.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataPharmacy {
  String pharmacyDrugId;
  String pharmacyDrugName;
  String pharmacyDrugAddress;

  DataPharmacy(
      {this.pharmacyDrugId, this.pharmacyDrugName, this.pharmacyDrugAddress});

  DataPharmacy.fromJson(Map<String, dynamic> json) {
    pharmacyDrugId = json['pharmacy_drug_id'];
    pharmacyDrugName = json['pharmacy_drug_name'];
    pharmacyDrugAddress = json['pharmacy_drug_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pharmacy_drug_id'] = this.pharmacyDrugId;
    data['pharmacy_drug_name'] = this.pharmacyDrugName;
    data['pharmacy_drug_address'] = this.pharmacyDrugAddress;
    return data;
  }
}


// class Getrx {
//   bool status;
//   List<Data> data;

//   Getrx({this.status, this.data});

//   Getrx.fromJson(Map<String, dynamic> json) {
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
//   dynamic rxOperatorId;
//   String hn;
//   String vstdate;
//   String vn;
//   String date;
//   String doctorId;
//   String doctorName;
//   String rxType;
//   String drugStatus;
//   String countdrug;
//   String qfinace;
//   dynamic dataPharmacy;

//   Data(
//       {this.rxOperatorId,
//       this.hn,
//       this.vstdate,
//       this.vn,
//       this.date,
//       this.doctorId,
//       this.doctorName,
//       this.rxType,
//       this.drugStatus,
//       this.countdrug,
//       this.qfinace,
//       this.dataPharmacy});

//   Data.fromJson(Map<String, dynamic> json) {
//     rxOperatorId = json['rx_operator_id'];
//     hn = json['hn'];
//     vstdate = json['vstdate'];
//     vn = json['vn'];
//     date = json['date'];
//     doctorId = json['doctor_id'];
//     doctorName = json['doctor_name'];
//     rxType = json['rx_type'];
//     drugStatus = json['drug_status'];
//     countdrug = json['countdrug'];
//     qfinace = json['qfinace'];
//     dataPharmacy = json['data_pharmacy'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['rx_operator_id'] = this.rxOperatorId;
//     data['hn'] = this.hn;
//     data['vstdate'] = this.vstdate;
//     data['vn'] = this.vn;
//     data['date'] = this.date;
//     data['doctor_id'] = this.doctorId;
//     data['doctor_name'] = this.doctorName;
//     data['rx_type'] = this.rxType;
//     data['drug_status'] = this.drugStatus;
//     data['countdrug'] = this.countdrug;
//     data['qfinace'] = this.qfinace;
//     data['data_pharmacy'] = this.dataPharmacy;
//     return data;
//   }
// }
