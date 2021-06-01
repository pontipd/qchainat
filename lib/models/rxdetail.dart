class GetrxDetail {
  bool status;
  List<Data> data;

  GetrxDetail({this.status, this.data});

  GetrxDetail.fromJson(Map<String, dynamic> json) {
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
  String vn;
  String drugCode;
  String drugName;
  String qty;
  String drugUnit;
  String drugusage;
  String name1;
  String name2;
  String name3;
  String drugSeq;
  String drugWarning;

  Data(
      {this.vn,
      this.drugCode,
      this.drugName,
      this.qty,
      this.drugUnit,
      this.drugusage,
      this.name1,
      this.name2,
      this.name3,
      this.drugSeq,
      this.drugWarning});

  Data.fromJson(Map<String, dynamic> json) {
    vn = json['vn'];
    drugCode = json['drug_code'];
    drugName = json['drug_name'];
    qty = json['qty'];
    drugUnit = json['drug_unit'];
    drugusage = json['drugusage'];
    name1 = json['name1'];
    name2 = json['name2'];
    name3 = json['name3'];
    drugSeq = json['drug_seq'];
    drugWarning = json['drug_warning'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vn'] = this.vn;
    data['drug_code'] = this.drugCode;
    data['drug_name'] = this.drugName;
    data['qty'] = this.qty;
    data['drug_unit'] = this.drugUnit;
    data['drugusage'] = this.drugusage;
    data['name1'] = this.name1;
    data['name2'] = this.name2;
    data['name3'] = this.name3;
    data['drug_seq'] = this.drugSeq;
    data['drug_warning'] = this.drugWarning;
    return data;
  }
}
