class Getconfig {
  int id;
  int drugQty;
  String pharmacyDrug;
  String drugElderly;

  Getconfig({this.id, this.drugQty, this.pharmacyDrug, this.drugElderly});

  Getconfig.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    drugQty = json['drug_qty'];
    pharmacyDrug = json['pharmacy_drug'];
    drugElderly = json['drug_elderly'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['drug_qty'] = this.drugQty;
    data['pharmacy_drug'] = this.pharmacyDrug;
    data['drug_elderly'] = this.drugElderly;
    return data;
  }
}
