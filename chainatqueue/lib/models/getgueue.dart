// To parse this JSON data, do
//
//     final getqueue = getqueueFromJson(jsonString);

import 'dart:convert';

Getqueue getqueueFromJson(String str) => Getqueue.fromJson(json.decode(str));

String getqueueToJson(Getqueue data) => json.encode(data.toJson());

class Getqueue {
  Getqueue({
    this.modelQueue,
    this.modelQtrans,
    this.service_status_name,
    this.queue_left,
  });

  ModelQueue modelQueue;
  ModelQtrans modelQtrans;
 final String service_status_name;
 final String queue_left;

  factory Getqueue.fromJson(Map<String, dynamic> json) => Getqueue(
        modelQueue: ModelQueue.fromJson(json["modelQueue"]),
        modelQtrans: ModelQtrans.fromJson(json["modelQtrans"]),
         service_status_name: json['service_status_name'],
         queue_left: json['queue_left'],


      );

  Map<String, dynamic> toJson() => {
        "modelQueue": modelQueue.toJson(),
        "modelQtrans": modelQtrans.toJson(),

         'service_status_name': service_status_name,
           'queue_left': queue_left,

      };
}

class ModelQtrans {
  ModelQtrans({
    this.qIds,
    this.servicegroupid,
    this.serviceStatusId,
    this.doctorId,
    this.createdAt,
    this.updatedAt,
    this.checkinDate,
    this.ids,
  });

  dynamic qIds;
  dynamic servicegroupid;
  dynamic serviceStatusId;
  String doctorId;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime checkinDate;
  dynamic ids;

  factory ModelQtrans.fromJson(Map<String, dynamic> json) => ModelQtrans(
        qIds: json["q_ids"],
        servicegroupid: json["servicegroupid"],
        serviceStatusId: json["service_status_id"],
        doctorId: json["doctor_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        checkinDate: DateTime.parse(json["checkin_date"]),
        ids: json["ids"],
      );

  Map<String, dynamic> toJson() => {
        "q_ids": qIds,
        "servicegroupid": servicegroupid,
        "service_status_id": serviceStatusId,
        "doctor_id": doctorId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "checkin_date": checkinDate.toIso8601String(),
        "ids": ids,
      };
}

class ModelQueue {
  ModelQueue({
    this.qNum,
    this.cid,
    this.qHn,
    this.qVn,
    this.ptName,
    this.appointId,
    this.servicegroupid,
    this.serviceid,
    this.createdFrom,
    this.qStatusId,
    this.doctorId,
    this.doctorName,
    this.maininsclName,
    this.ptVisitTypeId,
    this.tslotid,
    this.quickly,
    this.uId,
    this.ptPic,
    this.qTimestp,
    this.createdAt,
    this.updatedAt,
    this.qIds,
  });

  String qNum;
  String cid;
  String qHn;
  dynamic qVn;
  String ptName;
  String appointId;
  dynamic servicegroupid;
  dynamic serviceid;
  dynamic createdFrom;
  dynamic qStatusId;
  String doctorId;
  String doctorName;
  String maininsclName;
  dynamic ptVisitTypeId;
  dynamic tslotid;
  dynamic quickly;
  String uId;
  dynamic ptPic;
  DateTime qTimestp;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic qIds;

  factory ModelQueue.fromJson(Map<String, dynamic> json) => ModelQueue(
        qNum: json["q_num"],
        cid: json["cid"],
        qHn: json["q_hn"],
        qVn: json["q_vn"],
        ptName: json["pt_name"],
        appointId: json["appoint_id"],
        servicegroupid: json["servicegroupid"],
        serviceid: json["serviceid"],
        createdFrom: json["created_from"],
        qStatusId: json["q_status_id"],
        doctorId: json["doctor_id"],
        doctorName: json["doctor_name"],
        maininsclName: json["maininscl_name"],
        ptVisitTypeId: json["pt_visit_type_id"],
        tslotid: json["tslotid"],
        quickly: json["quickly"],
        uId: json['u_id'],
        ptPic: json["pt_pic"],
        qTimestp: DateTime.parse(json["q_timestp"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        qIds: json["q_ids"],
      );

  Map<String, dynamic> toJson() => {
        "q_num": qNum,
        "cid": cid,
        "q_hn": qHn,
        "q_vn": qVn,
        "pt_name": ptName,
        "appoint_id": appointId,
        "servicegroupid": servicegroupid,
        "serviceid": serviceid,
        "created_from": createdFrom,
        "q_status_id": qStatusId,
        "doctor_id": doctorId,
        "doctor_name": doctorName,
        "maininscl_name": maininsclName,
        "pt_visit_type_id": ptVisitTypeId,
        "tslotid": tslotid,
        "quickly": quickly,
        "u_id": uId,
        "pt_pic": ptPic,
        "q_timestp": qTimestp.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "q_ids": qIds,
      };
}

// class Getqueue {
//   ModelQueue modelQueue;
//   ModelQtrans modelQtrans;

//   Getqueue({this.modelQueue, this.modelQtrans});

//   Getqueue.fromJson(Map<String, dynamic> json) {
//     modelQueue = json['modelQueue'] != null
//         ? new ModelQueue.fromJson(json['modelQueue'])
//         : null;
//     modelQtrans = json['modelQtrans'] != null
//         ? new ModelQtrans.fromJson(json['modelQtrans'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.modelQueue != null) {
//       data['modelQueue'] = this.modelQueue.toJson();
//     }
//     if (this.modelQtrans != null) {
//       data['modelQtrans'] = this.modelQtrans.toJson();
//     }
//     return data;
//   }
// }

// class ModelQueue {
//   int qIds;
//   String qNum;
//   String qTimestp;
//   Null qArriveTime;
//   Null qAppointTime;
//   String cid;
//   Null qVn;
//   String qHn;
//   Null qQn;
//   Null rxQ;
//   String ptName;
//   Null ptVisitTypeId;
//   String appointId;
//   int servicegroupid;
//   int quickly;
//   int serviceid;
//   int createdFrom;
//   int qStatusId;
//   String doctorId;
//   String doctorName;
//   Null counterserviceid;
//   int tslotid;
//   String createdAt;
//   String updatedAt;
//   Null ptPic;
//   Null ptSound;
//   String maininsclName;

//   ModelQueue(
//       {this.qIds,
//       this.qNum,
//       this.qTimestp,
//       this.qArriveTime,
//       this.qAppointTime,
//       this.cid,
//       this.qVn,
//       this.qHn,
//       this.qQn,
//       this.rxQ,
//       this.ptName,
//       this.ptVisitTypeId,
//       this.appointId,
//       this.servicegroupid,
//       this.quickly,
//       this.serviceid,
//       this.createdFrom,
//       this.qStatusId,
//       this.doctorId,
//       this.doctorName,
//       this.counterserviceid,
//       this.tslotid,
//       this.createdAt,
//       this.updatedAt,
//       this.ptPic,
//       this.ptSound,
//       this.maininsclName});

//   ModelQueue.fromJson(Map<String, dynamic> json) {
//     qIds = json['q_ids'];
//     qNum = json['q_num'];
//     qTimestp = json['q_timestp'];
//     qArriveTime = json['q_arrive_time'];
//     qAppointTime = json['q_appoint_time'];
//     cid = json['cid'];
//     qVn = json['q_vn'];
//     qHn = json['q_hn'];
//     qQn = json['q_qn'];
//     rxQ = json['rx_q'];
//     ptName = json['pt_name'];
//     ptVisitTypeId = json['pt_visit_type_id'];
//     appointId = json['appoint_id'];
//     servicegroupid = json['servicegroupid'];
//     quickly = json['quickly'];
//     serviceid = json['serviceid'];
//     createdFrom = json['created_from'];
//     qStatusId = json['q_status_id'];
//     doctorId = json['doctor_id'];
//     doctorName = json['doctor_name'];
//     counterserviceid = json['counterserviceid'];
//     tslotid = json['tslotid'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     ptPic = json['pt_pic'];
//     ptSound = json['pt_sound'];
//     maininsclName = json['maininscl_name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['q_ids'] = this.qIds;
//     data['q_num'] = this.qNum;
//     data['q_timestp'] = this.qTimestp;
//     data['q_arrive_time'] = this.qArriveTime;
//     data['q_appoint_time'] = this.qAppointTime;
//     data['cid'] = this.cid;
//     data['q_vn'] = this.qVn;
//     data['q_hn'] = this.qHn;
//     data['q_qn'] = this.qQn;
//     data['rx_q'] = this.rxQ;
//     data['pt_name'] = this.ptName;
//     data['pt_visit_type_id'] = this.ptVisitTypeId;
//     data['appoint_id'] = this.appointId;
//     data['servicegroupid'] = this.servicegroupid;
//     data['quickly'] = this.quickly;
//     data['serviceid'] = this.serviceid;
//     data['created_from'] = this.createdFrom;
//     data['q_status_id'] = this.qStatusId;
//     data['doctor_id'] = this.doctorId;
//     data['doctor_name'] = this.doctorName;
//     data['counterserviceid'] = this.counterserviceid;
//     data['tslotid'] = this.tslotid;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['pt_pic'] = this.ptPic;
//     data['pt_sound'] = this.ptSound;
//     data['maininscl_name'] = this.maininsclName;
//     return data;
//   }
// }

// class ModelQtrans {
//   int ids;
//   int qIds;
//   int servicegroupid;
//   Null counterServiceId;
//   String doctorId;
//   String checkinDate;
//   Null checkoutDate;
//   int serviceStatusId;
//   String createdAt;
//   String updatedAt;
//   Null createdBy;
//   Null updatedBy;

//   ModelQtrans(
//       {this.ids,
//       this.qIds,
//       this.servicegroupid,
//       this.counterServiceId,
//       this.doctorId,
//       this.checkinDate,
//       this.checkoutDate,
//       this.serviceStatusId,
//       this.createdAt,
//       this.updatedAt,
//       this.createdBy,
//       this.updatedBy});

//   ModelQtrans.fromJson(Map<String, dynamic> json) {
//     ids = json['ids'];
//     qIds = json['q_ids'];
//     servicegroupid = json['servicegroupid'];
//     counterServiceId = json['counter_service_id'];
//     doctorId = json['doctor_id'];
//     checkinDate = json['checkin_date'];
//     checkoutDate = json['checkout_date'];
//     serviceStatusId = json['service_status_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     createdBy = json['created_by'];
//     updatedBy = json['updated_by'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['ids'] = this.ids;
//     data['q_ids'] = this.qIds;
//     data['servicegroupid'] = this.servicegroupid;
//     data['counter_service_id'] = this.counterServiceId;
//     data['doctor_id'] = this.doctorId;
//     data['checkin_date'] = this.checkinDate;
//     data['checkout_date'] = this.checkoutDate;
//     data['service_status_id'] = this.serviceStatusId;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['created_by'] = this.createdBy;
//     data['updated_by'] = this.updatedBy;
//     return data;
//   }
// }
