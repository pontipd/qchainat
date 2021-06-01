import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class Appoint {
  final String appoint_id;
  final String pt_name;
  final String hn;
  final String appoint_date;
  final String appoint_time_begin;
  final String appoint_time_end;
  final String depcode;
  final String department;
  final String appoint_preparing;
  final String appoint_reason;
  final String doctor_id;
  final String doctor_name;
  final String appoint_status;
  final String appoint_right_code;
  final String appoint_right;
  Appoint(
      {this.appoint_id,
      this.pt_name,
      this.hn,
      this.appoint_date,
      this.appoint_time_begin,
      this.appoint_time_end,
      this.depcode,
      this.department,
      this.appoint_preparing,
      this.appoint_reason,
      this.doctor_id,
      this.doctor_name,
      this.appoint_status,
      this.appoint_right_code,
      this.appoint_right});

  factory Appoint.fromJson(Map<String, dynamic> json) {
    return Appoint(
      appoint_id: json['appoint_id'],
      pt_name: json['pt_name'],
      hn: json['hn'],
      appoint_date: json['appoint_date'],
      appoint_time_begin: json['appoint_time_begin'],
      appoint_time_end: json['appoint_time_end'],
      depcode: json['depcode'],
      department: json['department'],
      appoint_preparing: json['appoint_preparing'],
      appoint_reason: json['appoint_reason'],
      doctor_id: json['doctor_id'],
      doctor_name: json['doctor_name'],
      appoint_status: json['appoint_status'],
      appoint_right_code: json['appoint_right_code'],
      appoint_right: json['appoint_right'],
    );
  }

  Map<String, dynamic> toJson() => {
        'appoint_id': appoint_id,
        'pt_name': pt_name,
        'hn': hn,
        'appoint_date': appoint_date,
        'appoint_time_begin': appoint_time_begin,
        'appoint_time_end': appoint_time_end,
        'depcode': depcode,
        'department': department,
        'appoint_preparing': appoint_preparing,
        'appoint_reason': appoint_reason,
        'doctor_id': doctor_id,
        'doctor_name': doctor_name,
        'appoint_status': appoint_status,
        'appoint_right_code': appoint_right_code,
        'appoint_right': appoint_right,
      };
}
