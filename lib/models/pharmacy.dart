class Pharmacy {
  String pharmacyDrugId;
  String pharmacyDrugName;
  String pharmacyDrugAddress;

  Pharmacy(
      {this.pharmacyDrugId, this.pharmacyDrugName, this.pharmacyDrugAddress});

  Pharmacy.fromJson(Map<String, dynamic> json) {
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
