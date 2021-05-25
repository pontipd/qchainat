class CreateQueue {
  PatientInfo patientInfo;
  Right right;
  Appoint appoint;
  String servicegroupid;
  String serviceid;
  int createdFrom;
  int qStatusId;
  Null uId;
  int quickly;

  CreateQueue(
      {this.patientInfo,
      this.right,
      this.appoint,
      this.servicegroupid,
      this.serviceid,
      this.createdFrom,
      this.qStatusId,
      this.uId,
      this.quickly});

  CreateQueue.fromJson(Map<String, dynamic> json) {
    patientInfo = json['patient_info'] != null
        ? new PatientInfo.fromJson(json['patient_info'])
        : null;
    right = json['right'] != null ? new Right.fromJson(json['right']) : null;
    appoint =
        json['appoint'] != null ? new Appoint.fromJson(json['appoint']) : null;
    servicegroupid = json['servicegroupid'];
    serviceid = json['serviceid'];
    createdFrom = json['created_from'];
    qStatusId = json['q_status_id'];
    uId = json['u_id'];
    quickly = json['quickly'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.patientInfo != null) {
      data['patient_info'] = this.patientInfo.toJson();
    }
    if (this.right != null) {
      data['right'] = this.right.toJson();
    }
    if (this.appoint != null) {
      data['appoint'] = this.appoint.toJson();
    }
    data['servicegroupid'] = this.servicegroupid;
    data['serviceid'] = this.serviceid;
    data['created_from'] = this.createdFrom;
    data['q_status_id'] = this.qStatusId;
    data['u_id'] = this.uId;
    data['quickly'] = this.quickly;
    return data;
  }
}

class PatientInfo {
  String ptName;
  String hn;
  String cid;
  String dob;
  String age;
  Null dataVisit;
  Null vn;
  Null mainDep;
  Null department;

  PatientInfo(
      {this.ptName,
      this.hn,
      this.cid,
      this.dob,
      this.age,
      this.dataVisit,
      this.vn,
      this.mainDep,
      this.department});

  PatientInfo.fromJson(Map<String, dynamic> json) {
    ptName = json['pt_name'];
    hn = json['hn'];
    cid = json['cid'];
    dob = json['dob'];
    age = json['age'];
    dataVisit = json['data_visit'];
    vn = json['vn'];
    mainDep = json['main_dep'];
    department = json['department'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pt_name'] = this.ptName;
    data['hn'] = this.hn;
    data['cid'] = this.cid;
    data['dob'] = this.dob;
    data['age'] = this.age;
    data['data_visit'] = this.dataVisit;
    data['vn'] = this.vn;
    data['main_dep'] = this.mainDep;
    data['department'] = this.department;
    return data;
  }
}

class Right {
  String birthdate;
  String countSelect;
  String fname;
  String lname;
  String maininscl;
  String maininsclMain;
  String maininsclName;
  String nation;
  String personId;
  String primaryAmphurName;
  String primaryMoo;
  String primaryMoobanName;
  String primaryProvinceName;
  String primaryTumbonName;
  String primaryprovince;
  String sex;
  String subinscl;
  String subinsclName;
  String title;
  String titleName;
  String wsDataSource;
  String wsDateRequest;
  String wsStatus;
  String wsStatusDesc;
  String wsid;
  String wsidBatch;

  Right(
      {this.birthdate,
      this.countSelect,
      this.fname,
      this.lname,
      this.maininscl,
      this.maininsclMain,
      this.maininsclName,
      this.nation,
      this.personId,
      this.primaryAmphurName,
      this.primaryMoo,
      this.primaryMoobanName,
      this.primaryProvinceName,
      this.primaryTumbonName,
      this.primaryprovince,
      this.sex,
      this.subinscl,
      this.subinsclName,
      this.title,
      this.titleName,
      this.wsDataSource,
      this.wsDateRequest,
      this.wsStatus,
      this.wsStatusDesc,
      this.wsid,
      this.wsidBatch});

  Right.fromJson(Map<String, dynamic> json) {
    birthdate = json['birthdate'];
    countSelect = json['count_select'];
    fname = json['fname'];
    lname = json['lname'];
    maininscl = json['maininscl'];
    maininsclMain = json['maininscl_main'];
    maininsclName = json['maininscl_name'];
    nation = json['nation'];
    personId = json['person_id'];
    primaryAmphurName = json['primary_amphur_name'];
    primaryMoo = json['primary_moo'];
    primaryMoobanName = json['primary_mooban_name'];
    primaryProvinceName = json['primary_province_name'];
    primaryTumbonName = json['primary_tumbon_name'];
    primaryprovince = json['primaryprovince'];
    sex = json['sex'];
    subinscl = json['subinscl'];
    subinsclName = json['subinscl_name'];
    title = json['title'];
    titleName = json['title_name'];
    wsDataSource = json['ws_data_source'];
    wsDateRequest = json['ws_date_request'];
    wsStatus = json['ws_status'];
    wsStatusDesc = json['ws_status_desc'];
    wsid = json['wsid'];
    wsidBatch = json['wsid_batch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['birthdate'] = this.birthdate;
    data['count_select'] = this.countSelect;
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['maininscl'] = this.maininscl;
    data['maininscl_main'] = this.maininsclMain;
    data['maininscl_name'] = this.maininsclName;
    data['nation'] = this.nation;
    data['person_id'] = this.personId;
    data['primary_amphur_name'] = this.primaryAmphurName;
    data['primary_moo'] = this.primaryMoo;
    data['primary_mooban_name'] = this.primaryMoobanName;
    data['primary_province_name'] = this.primaryProvinceName;
    data['primary_tumbon_name'] = this.primaryTumbonName;
    data['primaryprovince'] = this.primaryprovince;
    data['sex'] = this.sex;
    data['subinscl'] = this.subinscl;
    data['subinscl_name'] = this.subinsclName;
    data['title'] = this.title;
    data['title_name'] = this.titleName;
    data['ws_data_source'] = this.wsDataSource;
    data['ws_date_request'] = this.wsDateRequest;
    data['ws_status'] = this.wsStatus;
    data['ws_status_desc'] = this.wsStatusDesc;
    data['wsid'] = this.wsid;
    data['wsid_batch'] = this.wsidBatch;
    return data;
  }
}

class Appoint {
  Null appointId;
  Null ptName;
  Null hn;
  Null appointDate;
  String appointTimeBegin;
  String appointTimeEnd;
  String depcode;
  Null department;
  Null appointPreparing;
  Null appointReason;
  Null doctorId;
  Null doctorName;
  Null appointStatus;
  Null appointRightCode;
  Null appointRight;

  Appoint(
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

  Appoint.fromJson(Map<String, dynamic> json) {
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
