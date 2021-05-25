class GetNHSO {
  String birthdate;
  int countSelect;
  String fname;
  String hmain;
  String hmainName;
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
  String purchaseprovince;
  String purchaseprovinceName;
  String sex;
  String startdate;
  String startdateSss;
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

  GetNHSO(
      {this.birthdate,
      this.countSelect,
      this.fname,
      this.hmain,
      this.hmainName,
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
      this.purchaseprovince,
      this.purchaseprovinceName,
      this.sex,
      this.startdate,
      this.startdateSss,
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

  GetNHSO.fromJson(Map<String, dynamic> json) {
    birthdate = json['birthdate'];
    countSelect = json['count_select'];
    fname = json['fname'];
    hmain = json['hmain'];
    hmainName = json['hmain_name'];
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
    purchaseprovince = json['purchaseprovince'];
    purchaseprovinceName = json['purchaseprovince_name'];
    sex = json['sex'];
    startdate = json['startdate'];
    startdateSss = json['startdate_sss'];
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
    data['hmain'] = this.hmain;
    data['hmain_name'] = this.hmainName;
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
    data['purchaseprovince'] = this.purchaseprovince;
    data['purchaseprovince_name'] = this.purchaseprovinceName;
    data['sex'] = this.sex;
    data['startdate'] = this.startdate;
    data['startdate_sss'] = this.startdateSss;
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
