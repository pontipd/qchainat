class GetHresult {
  bool status;
  List<Data> data;

  GetHresult({this.status, this.data});

  GetHresult.fromJson(Map<String, dynamic> json) {
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
}

class Data {
  

dynamic hn;
  dynamic medExamId;
  dynamic medExamDate;
  dynamic medExamYear;
  dynamic ptName;
  dynamic age;
  dynamic examDate;
  dynamic bp;
  dynamic weight;
  dynamic height;
  dynamic bmi;
  dynamic pulse;
  dynamic respiration;
  dynamic cXR;
  dynamic uAGlucose;
  dynamic uAProtein;
  dynamic uAPH;
  dynamic uASpGr;
  dynamic stoolExamination;
  dynamic cBCWBCCount;
  dynamic cBCNeutrophil;
  dynamic cBCLymphocyte;
  dynamic cBCMonocyte;
  dynamic cBCEosinophil;
  dynamic cBCBasophil;
  dynamic cBCRBCCount;
  dynamic cBCHemoglobin;
  dynamic cBCHematocrit;
  dynamic cBCMCV;
  dynamic cBCPlateletCount;
  dynamic fBS;
  dynamic cholesterol;
  dynamic triglyceride;
  dynamic hDL;
  dynamic lDL;
  dynamic bUN;
  dynamic creatinine;
  dynamic sGOT;
  dynamic sGPT;
  dynamic alkalinePhosphatse;
  dynamic uricAcid;

  Data(
      {this.hn,
      this.medExamId,
      this.medExamDate,
      this.medExamYear,
      this.ptName,
      this.age,
      this.examDate,
      this.bp,
      this.weight,
      this.height,
      this.bmi,
      this.pulse,
      this.respiration,
      this.cXR,
      this.uAGlucose,
      this.uAProtein,
      this.uAPH,
      this.uASpGr,
      this.stoolExamination,
      this.cBCWBCCount,
      this.cBCNeutrophil,
      this.cBCLymphocyte,
      this.cBCMonocyte,
      this.cBCEosinophil,
      this.cBCBasophil,
      this.cBCRBCCount,
      this.cBCHemoglobin,
      this.cBCHematocrit,
      this.cBCMCV,
      this.cBCPlateletCount,
      this.fBS,
      this.cholesterol,
      this.triglyceride,
      this.hDL,
      this.lDL,
      this.bUN,
      this.creatinine,
      this.sGOT,
      this.sGPT,
      this.alkalinePhosphatse,
      this.uricAcid});

  Data.fromJson(Map<String, dynamic> json) {
    hn = json['hn'];
    medExamId = json['med_exam_id'];
    medExamDate = json['med_exam_date'];
    medExamYear = json['med_exam_year'];
    ptName = json['pt_name'];
    age = json['age'];
    examDate = json['exam_date'];
    bp = json['bp'];
    weight = json['weight'];
    height = json['height'];
    bmi = json['bmi'];
    pulse = json['pulse'];
    respiration = json['respiration'];
    cXR = json['CXR'];
    uAGlucose = json['UA_Glucose'];
    uAProtein = json['UA_Protein'];
    uAPH = json['UA_pH'];
    uASpGr = json['UA_SpGr'];
    stoolExamination = json['Stool_examination'];
    cBCWBCCount = json['CBC_WBC_Count'];
    cBCNeutrophil = json['CBC_Neutrophil'];
    cBCLymphocyte = json['CBC_Lymphocyte'];
    cBCMonocyte = json['CBC_Monocyte'];
    cBCEosinophil = json['CBC_Eosinophil'];
    cBCBasophil = json['CBC_Basophil'];
    cBCRBCCount = json['CBC_RBC_Count'];
    cBCHemoglobin = json['CBC_Hemoglobin'];
    cBCHematocrit = json['CBC_Hematocrit'];
    cBCMCV = json['CBC_MCV'];
    cBCPlateletCount = json['CBC_Platelet_Count'];
    fBS = json['FBS'];
    cholesterol = json['Cholesterol'];
    triglyceride = json['Triglyceride'];
    hDL = json['HDL'];
    lDL = json['LDL'];
    bUN = json['BUN'];
    creatinine = json['Creatinine'];
    sGOT = json['SGOT'];
    sGPT = json['SGPT'];
    alkalinePhosphatse = json['Alkaline_Phosphatse'];
    uricAcid = json['Uric_Acid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hn'] = this.hn;
    data['med_exam_id'] = this.medExamId;
    data['med_exam_date'] = this.medExamDate;
    data['med_exam_year'] = this.medExamYear;
    data['pt_name'] = this.ptName;
    data['age'] = this.age;
    data['exam_date'] = this.examDate;
    data['bp'] = this.bp;
    data['weight'] = this.weight;
    data['height'] = this.height;
    data['bmi'] = this.bmi;
    data['pulse'] = this.pulse;
    data['respiration'] = this.respiration;
    data['CXR'] = this.cXR;
    data['UA_Glucose'] = this.uAGlucose;
    data['UA_Protein'] = this.uAProtein;
    data['UA_pH'] = this.uAPH;
    data['UA_SpGr'] = this.uASpGr;
    data['Stool_examination'] = this.stoolExamination;
    data['CBC_WBC_Count'] = this.cBCWBCCount;
    data['CBC_Neutrophil'] = this.cBCNeutrophil;
    data['CBC_Lymphocyte'] = this.cBCLymphocyte;
    data['CBC_Monocyte'] = this.cBCMonocyte;
    data['CBC_Eosinophil'] = this.cBCEosinophil;
    data['CBC_Basophil'] = this.cBCBasophil;
    data['CBC_RBC_Count'] = this.cBCRBCCount;
    data['CBC_Hemoglobin'] = this.cBCHemoglobin;
    data['CBC_Hematocrit'] = this.cBCHematocrit;
    data['CBC_MCV'] = this.cBCMCV;
    data['CBC_Platelet_Count'] = this.cBCPlateletCount;
    data['FBS'] = this.fBS;
    data['Cholesterol'] = this.cholesterol;
    data['Triglyceride'] = this.triglyceride;
    data['HDL'] = this.hDL;
    data['LDL'] = this.lDL;
    data['BUN'] = this.bUN;
    data['Creatinine'] = this.creatinine;
    data['SGOT'] = this.sGOT;
    data['SGPT'] = this.sGPT;
    data['Alkaline_Phosphatse'] = this.alkalinePhosphatse;
    data['Uric_Acid'] = this.uricAcid;
    return data;
  }
}
