class ChackHnso {
  List<String> checkNhso;
  List<String> nonCheckNhso;

  ChackHnso({this.checkNhso, this.nonCheckNhso});

  ChackHnso.fromJson(Map<String, dynamic> json) {
    checkNhso = json['check_nhso'].cast<String>();
    nonCheckNhso = json['non_check_nhso'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['check_nhso'] = this.checkNhso;
    data['non_check_nhso'] = this.nonCheckNhso;
    return data;
  }
}
