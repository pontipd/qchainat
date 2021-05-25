import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class Rxqn {
  final dynamic rx_operator_id;
  final dynamic hn;
  final dynamic vstdate;
  final dynamic vn;
  final dynamic date;
  final dynamic doctor_id;
  final dynamic doctor_name;
  final dynamic rx_type;
  final dynamic drug_status;
  final dynamic countdrug;
  final dynamic qfinace;
  final dynamic data_pharmacy;
  final dynamic pharmacy_drug_id;
    final dynamic      pharmacy_drug_name;
      final dynamic    pharmacy_drug_address;
  Rxqn({
    this.rx_operator_id,
    this.hn,
    this.vstdate,
    this.vn,
    this.date,
    this.doctor_id,
    this.doctor_name,
    this.rx_type,
    this.drug_status,
    this.countdrug,
    this.qfinace,
    this.data_pharmacy,
     this.pharmacy_drug_id,
     this.   pharmacy_drug_name,
      this.  pharmacy_drug_address,
  });

  factory Rxqn.fromJson(Map<dynamic, dynamic> json) {
    return Rxqn(
      rx_operator_id: json['rx_operator_id'],
      hn: json['hn'],
      vstdate: json['vstdate'],
      vn: json['vn'],
      date: json['date'],
      doctor_id: json['doctor_id'],
      doctor_name: json['doctor_name'],
      rx_type: json['rx_type'],
      drug_status: json['drug_status'],
      countdrug: json['countdrug'],
      qfinace: json['qfinace'],
      data_pharmacy: json['data_pharmacy'],
       pharmacy_drug_id: json['pharmacy_drug_id'],
        pharmacy_drug_name: json[ 'pharmacy_drug_name'],
        pharmacy_drug_address: json['pharmacy_drug_address'],
    );
  }

  Map<dynamic, dynamic> toJson() => {
        'rx_operator_id': rx_operator_id,
        'hn': hn,
        'vstdate': vstdate,
        'vn': vn,
        'date': date,
        'doctor_id': doctor_id,
        'doctor_name': doctor_name,
        'rx_type': rx_type,
        'drug_status': drug_status,
        'countdrug': countdrug,
        'qfinace': qfinace,
        'data_pharmacy': data_pharmacy,
        'pharmacy_drug_id':pharmacy_drug_id,
        'pharmacy_drug_name': pharmacy_drug_name,
        'pharmacy_drug_address':pharmacy_drug_address,
      };
}
