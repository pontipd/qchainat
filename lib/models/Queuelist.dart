class Queuelist {
  String qIds;
  String qNum;
  String qHn;
  String qVn;
  String qQn;
  String qStatusId;
  String serviceid;
  String servicegroupName;
  String deptname;
  String serviceStatusName;
  String queueLeft;

  Queuelist(
      {this.qIds,
      this.qNum,
      this.qHn,
      this.qVn,
      this.qQn,
      this.qStatusId,
      this.serviceid,
      this.servicegroupName,
      this.deptname,
      this.serviceStatusName,
      this.queueLeft});

  Queuelist.fromJson(Map<String, dynamic> json) {
    qIds = json['q_ids'];
    qNum = json['q_num'];
    qHn = json['q_hn'];
    qVn = json['q_vn'];
    qQn = json['q_qn'];
    qStatusId = json['q_status_id'];
    serviceid = json['serviceid'];
    servicegroupName = json['servicegroup_name'];
    deptname = json['deptname'];
    serviceStatusName = json['service_status_name'];
    queueLeft = json['queue_left'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['q_ids'] = this.qIds;
    data['q_num'] = this.qNum;
    data['q_hn'] = this.qHn;
    data['q_vn'] = this.qVn;
    data['q_qn'] = this.qQn;
    data['q_status_id'] = this.qStatusId;
    data['serviceid'] = this.serviceid;
    data['servicegroup_name'] = this.servicegroupName;
    data['deptname'] = this.deptname;
    data['service_status_name'] = this.serviceStatusName;
    data['queue_left'] = this.queueLeft;
    return data;
  }
}
