class GetAppointMent {
  bool status;
  List<Data> data;

  GetAppointMent({this.status, this.data});

  GetAppointMent.fromJson(Map<String, dynamic> json) {
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

  fromJson(job) {}
}

class Data {
  String appointId;
  String ptName;
  String hn;
  String appointDate;
  String appointTimeBegin;
  String appointTimeEnd;
  String depcode;
  String department;
  String appointPreparing;
  String appointReason;
  String doctorId;
  String doctorName;
  String appointStatus;
  String appointRightCode;
  String appointRight;

  Data(
      {this.appointId,
      this.ptName,
      this.hn,
      this.appointDate,
      this.appointTimeBegin,
      this.appointTimeEnd,
      this.depcode,
      this.department,
      this.appointPreparing,
      this.appointReason,
      this.doctorId,
      this.doctorName,
      this.appointStatus,
      this.appointRightCode,
      this.appointRight});

  Data.fromJson(Map<String, dynamic> json) {
    appointId = json['appoint_id'];
    ptName = json['pt_name'];
    hn = json['hn'];
    appointDate = json['appoint_date'];
    appointTimeBegin = json['appoint_time_begin'];
    appointTimeEnd = json['appoint_time_end'];
    depcode = json['depcode'];
    department = json['department'];
    appointPreparing = json['appoint_preparing'];
    appointReason = json['appoint_reason'];
    doctorId = json['doctor_id'];
    doctorName = json['doctor_name'];
    appointStatus = json['appoint_status'];
    appointRightCode = json['appoint_right_code'];
    appointRight = json['appoint_right'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appoint_id'] = this.appointId;
    data['pt_name'] = this.ptName;
    data['hn'] = this.hn;
    data['appoint_date'] = this.appointDate;
    data['appoint_time_begin'] = this.appointTimeBegin;
    data['appoint_time_end'] = this.appointTimeEnd;
    data['depcode'] = this.depcode;
    data['department'] = this.department;
    data['appoint_preparing'] = this.appointPreparing;
    data['appoint_reason'] = this.appointReason;
    data['doctor_id'] = this.doctorId;
    data['doctor_name'] = this.doctorName;
    data['appoint_status'] = this.appointStatus;
    data['appoint_right_code'] = this.appointRightCode;
    data['appoint_right'] = this.appointRight;
    return data;
  }
}
