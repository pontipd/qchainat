import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class Rxde{
 String vn;
  String drug_code;
  String drug_name;
  String qty;
  String drug_unit;
 String drugusage;
 String name1;
 String name2;
 String name3;
 String drug_seq;
  String drug_warning;
  Rxde(
      {
 this. vn,
  this. drug_code,
  this. drug_name,
  this. qty,
  this. drug_unit,
 this. drugusage,
 this. name1,
 this. name2,
 this. name3,
 this. drug_seq,
  this. drug_warning,});

  factory Rxde.fromJson(Map<String, dynamic> json) {
    return Rxde(
       vn : json['vn'],
    drug_code : json['drug_code'],
    drug_name : json['drug_name'],
    qty : json['qty'],
    drug_unit : json['drug_unit'],
    drugusage : json['drugusage'],
    name1 : json['name1'],
    name2 : json['name2'],
    name3 : json['name3'],
    drug_seq : json['drug_seq'],
    drug_warning : json['drug_warning'],
    );
  }

  Map<String, dynamic> toJson() => {
        'vn' : vn,
    'drug_code' : drug_code,
    'drug_name' : drug_name,
    'qty' : qty,
    'drug_unit' : drug_unit,
    'drugusage' : drugusage,
    'name1' : name1,
    'name2' : name2,
    'name3' : name3,
    'drug_seq' : drug_seq,
    'drug_warning' : drug_warning,
      };
}
