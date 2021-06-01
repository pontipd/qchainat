import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class Depenlist {
  final String rx_operator_id;
  final String pharmacy_drug_name;
  final String deptname;
  final String HN;
  final String pt_name;
  final String doctor_name;
  final String prescription_date;
  final String dispensing_status_des;

  Depenlist(
      {this.rx_operator_id,
      this.pharmacy_drug_name,
      this.deptname,
      this.HN,
      this.pt_name,
      this.doctor_name,
      this.prescription_date,
      this.dispensing_status_des});

  factory Depenlist.fromJson(Map<String, dynamic> json) {
    return Depenlist(
      rx_operator_id: json['rx_operator_id'],
      pharmacy_drug_name: json['pharmacy_drug_name'],
      deptname: json['deptname'],
      HN: json['HN'],
      pt_name: json['pt_name'],
      doctor_name: json['doctor_name'],
      prescription_date: json['prescription_date'],
      dispensing_status_des: json['dispensing_status_des'],
    );
  }
  Map<String, dynamic> toJson() => {
        'rx_operator_id': rx_operator_id,
        'pharmacy_drug_name': pharmacy_drug_name,
        'deptname': deptname,
        'HN': HN,
        'pt_name': pt_name,
        'doctor_name': doctor_name,
        'prescription_date': prescription_date,
        'dispensing_status_des': dispensing_status_des,
      };
}
