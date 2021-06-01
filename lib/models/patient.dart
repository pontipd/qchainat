class Patient {
  String birthday;
  String cids;
  String email;
  String hns;
  String name;
  String phone;
  String prefix;
  String surname;
  String uid;

  Patient(
      {this.birthday,
      this.cids,
      this.email,
      this.hns,
      this.name,
      this.phone,
      this.prefix,
      this.uid,
      this.surname});

  Patient.fromJson(Map<String, dynamic> json) {
    birthday = json['birthday'];
    cids = json['cids'];
    email = json['email'];
    hns = json['hns'];
    name = json['name'];
    phone = json['phone'];
    prefix = json['prefix'];
    uid = json['uid'];
    surname = json['surname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['birthday'] = this.birthday;
    data['cids'] = this.cids;
    data['email'] = this.email;
    data['hns'] = this.hns;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['prefix'] = this.prefix;
    data['uid'] = this.uid;
    data['surname'] = this.surname;
    return data;
  }
}
