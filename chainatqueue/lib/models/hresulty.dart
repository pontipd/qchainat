import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class Hresulty {
  final String hn;
  final String med_exam_id;
  final String med_exam_date;
  final String med_exam_year;
  final String pt_name;
  final String age;
  final String exam_date;
  final String bp;
  final String weight;
  final String height;
  final String bmi;
  final String pulse;
  final String respiration;
  final String CXR;
  final String UA_Glucose;
  final String UA_Protein;
  final String UA_pH;
  final String UA_SpGr;
  final String Stool_examination;
  final String CBC_WBC_Count;
  final String CBC_Neutrophil;
  final String CBC_Lymphocyte;
  final String CBC_Monocyte;
  final String CBC_Eosinophil;
  final String CBC_Basophil;
  final String CBC_RBC_Count;
  final String CBC_Hemoglobin;
  final String CBC_Hematocrit;
  final String CBC_MCV;
  final String CBC_Platelet_Count;
  final String FBS;
  final String Cholesterol;
  final String Triglyceride;
  final String HDL;
  final String LDL;
  final String BUN;
  final String Creatinine;
  final String SGOT;
  final String SGPT;
  final String Alkaline_Phosphatse;
  final String Uric_Acid;
  Hresulty(
      {this.hn,
      this.med_exam_id,
      this.med_exam_date,
      this.med_exam_year,
      this.pt_name,
      this.age,
      this.exam_date,
      this.bp,
      this.weight,
      this.height,
      this.bmi,
      this.pulse,
      this.respiration,
      this.CXR,
      this.UA_Glucose,
      this.UA_Protein,
      this.UA_pH,
      this.UA_SpGr,
      this.Stool_examination,
      this.CBC_WBC_Count,
      this.CBC_Neutrophil,
      this.CBC_Lymphocyte,
      this.CBC_Monocyte,
      this.CBC_Eosinophil,
      this.CBC_Basophil,
      this.CBC_RBC_Count,
      this.CBC_Hemoglobin,
      this.CBC_Hematocrit,
      this.CBC_MCV,
      this.CBC_Platelet_Count,
      this.FBS,
      this.Cholesterol,
      this.Triglyceride,
      this.HDL,
      this.LDL,
      this.BUN,
      this.Creatinine,
      this.SGOT,
      this.SGPT,
      this.Alkaline_Phosphatse,
      this.Uric_Acid});

  factory Hresulty.fromJson(Map<String, dynamic> json) {
    return Hresulty(
      hn: json['hn'],
      med_exam_id: json['med_exam_id'],
      med_exam_date: json['med_exam_date'],
      med_exam_year: json['med_exam_year'],
      pt_name: json['pt_name'],
      age: json['age'],
      exam_date: json['exam_date'],
      bp: json['bp'],
      weight: json['weight'],
      height: json['height'],
      bmi: json['bmi'],
      pulse: json['pulse'],
      respiration: json['respiration'],
      CXR: json['CXR'],
      UA_Glucose: json['UA_Glucose'],
      UA_Protein: json['UA_Protein'],
      UA_pH: json['UA_pH'],
      UA_SpGr: json['UA_SpGr'],
      Stool_examination: json['Stool_examination'],
      CBC_WBC_Count: json['CBC_WBC_Count'],
      CBC_Neutrophil: json['CBC_Neutrophil'],
      CBC_Lymphocyte: json['CBC_Lymphocyte'],
      CBC_Monocyte: json['CBC_Monocyte'],
      CBC_Eosinophil: json['CBC_Eosinophil'],
      CBC_Basophil: json['CBC_Basophil'],
      CBC_RBC_Count: json['CBC_RBC_Count'],
      CBC_Hemoglobin: json['CBC_Hemoglobin'],
      CBC_Hematocrit: json['CBC_Hematocrit'],
      CBC_MCV: json['CBC_MCV'],
      CBC_Platelet_Count: json['CBC_Platelet_Count'],
      FBS: json['FBS'],
      Cholesterol: json['Cholesterol'],
      Triglyceride: json['Triglyceride'],
      HDL: json['HDL'],
      LDL: json['LDL'],
      BUN: json['BUN'],
      Creatinine: json['Creatinine'],
      SGOT: json['SGOT'],
      SGPT: json['SGPT'],
      Alkaline_Phosphatse: json['Alkaline_Phosphatse'],
      Uric_Acid: json['Uric_Acid'],
    );
  }

  Map<String, dynamic> toJson() => {
        ' hn ': hn,
        'med_exam_id': med_exam_id,
        'med_exam_date': med_exam_date,
        'med_exam_year': med_exam_year,
        'pt_name': pt_name,
        'age': age,
        'exam_date': exam_date,
        'bp': bp,
        'weight': weight,
        'height': height,
        'bmi': bmi,
        'pulse': pulse,
        'respiration': respiration,
        'CXR': CXR,
        'UA_Glucose': UA_Glucose,
        'UA_Protein': UA_Protein,
        'UA_pH': UA_pH,
        'UA_SpGr': UA_SpGr,
        'Stool_examination': Stool_examination,
        'CBC_WBC_Count': CBC_WBC_Count,
        'CBC_Neutrophil': CBC_Neutrophil,
        'CBC_Lymphocyte': CBC_Lymphocyte,
        'CBC_Monocyte': CBC_Monocyte,
        'CBC_Eosinophil': CBC_Eosinophil,
        'CBC_Basophil': CBC_Basophil,
        'CBC_RBC_Count': CBC_RBC_Count,
        'CBC_Hemoglobin': CBC_Hemoglobin,
        'CBC_Hematocrit': CBC_Hematocrit,
        'CBC_MCV': CBC_MCV,
        'CBC_Platelet_Count': CBC_Platelet_Count,
        'FBS': FBS,
        'Cholesterol': Cholesterol,
        'Triglyceride': Triglyceride,
        'HDL': HDL,
        'LDL': LDL,
        'BUN': BUN,
        'Creatinine': Creatinine,
        'SGOT': SGOT,
        'SGPT': SGPT,
        'Alkaline_Phosphatse': Alkaline_Phosphatse,
        'Uric_Acid': Uric_Acid,
      };
}
