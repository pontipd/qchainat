class GetserviceList {
  int serviceid;
  String serviceName;
  int serviceGroupid;
  String serviceRoute;
  int prnProfileid;
  int prnProfileidQuickly;
  int prnCopyqty;
  String servicePrefix;
  int serviceNumdigit;
  String serviceStatus;
  Null serviceMdNameId;
  int printByHn;
  int quickly;
  int showOnKiosk;
  int showOnMobile;
  String btnKioskName;

  GetserviceList(
      {this.serviceid,
      this.serviceName,
      this.serviceGroupid,
      this.serviceRoute,
      this.prnProfileid,
      this.prnProfileidQuickly,
      this.prnCopyqty,
      this.servicePrefix,
      this.serviceNumdigit,
      this.serviceStatus,
      this.serviceMdNameId,
      this.printByHn,
      this.quickly,
      this.showOnKiosk,
      this.showOnMobile,
      this.btnKioskName});

  GetserviceList.fromJson(Map<String, dynamic> json) {
    serviceid = json['serviceid'];
    serviceName = json['service_name'];
    serviceGroupid = json['service_groupid'];
    serviceRoute = json['service_route'];
    prnProfileid = json['prn_profileid'];
    prnProfileidQuickly = json['prn_profileid_quickly'];
    prnCopyqty = json['prn_copyqty'];
    servicePrefix = json['service_prefix'];
    serviceNumdigit = json['service_numdigit'];
    serviceStatus = json['service_status'];
    serviceMdNameId = json['service_md_name_id'];
    printByHn = json['print_by_hn'];
    quickly = json['quickly'];
    showOnKiosk = json['show_on_kiosk'];
    showOnMobile = json['show_on_mobile'];
    btnKioskName = json['btn_kiosk_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serviceid'] = this.serviceid;
    data['service_name'] = this.serviceName;
    data['service_groupid'] = this.serviceGroupid;
    data['service_route'] = this.serviceRoute;
    data['prn_profileid'] = this.prnProfileid;
    data['prn_profileid_quickly'] = this.prnProfileidQuickly;
    data['prn_copyqty'] = this.prnCopyqty;
    data['service_prefix'] = this.servicePrefix;
    data['service_numdigit'] = this.serviceNumdigit;
    data['service_status'] = this.serviceStatus;
    data['service_md_name_id'] = this.serviceMdNameId;
    data['print_by_hn'] = this.printByHn;
    data['quickly'] = this.quickly;
    data['show_on_kiosk'] = this.showOnKiosk;
    data['show_on_mobile'] = this.showOnMobile;
    data['btn_kiosk_name'] = this.btnKioskName;
    return data;
  }
}
