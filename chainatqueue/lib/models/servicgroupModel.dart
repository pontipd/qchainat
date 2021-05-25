class Getservicegroup {
  int servicegroupid;
  String servicegroupCode;
  int servicegroupTypeId;
  String servicegroupName;
  String servicegroupPrefix;
  int servicegroupOrder;
  int subserviceStatus;
  int servicegroupStatus;
  int showOnKiosk;
  int showOnMobile;

  Getservicegroup(
      {this.servicegroupid,
      this.servicegroupCode,
      this.servicegroupTypeId,
      this.servicegroupName,
      this.servicegroupPrefix,
      this.servicegroupOrder,
      this.subserviceStatus,
      this.servicegroupStatus,
      this.showOnKiosk,
      this.showOnMobile});

  Getservicegroup.fromJson(Map<String, dynamic> json) {
    servicegroupid = json['servicegroupid'];
    servicegroupCode = json['servicegroup_code'];
    servicegroupTypeId = json['servicegroup_type_id'];
    servicegroupName = json['servicegroup_name'];
    servicegroupPrefix = json['servicegroup_prefix'];
    servicegroupOrder = json['servicegroup_order'];
    subserviceStatus = json['subservice_status'];
    servicegroupStatus = json['servicegroup_status'];
    showOnKiosk = json['show_on_kiosk'];
    showOnMobile = json['show_on_mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['servicegroupid'] = this.servicegroupid;
    data['servicegroup_code'] = this.servicegroupCode;
    data['servicegroup_type_id'] = this.servicegroupTypeId;
    data['servicegroup_name'] = this.servicegroupName;
    data['servicegroup_prefix'] = this.servicegroupPrefix;
    data['servicegroup_order'] = this.servicegroupOrder;
    data['subservice_status'] = this.subserviceStatus;
    data['servicegroup_status'] = this.servicegroupStatus;
    data['show_on_kiosk'] = this.showOnKiosk;
    data['show_on_mobile'] = this.showOnMobile;
    return data;
  }
}
