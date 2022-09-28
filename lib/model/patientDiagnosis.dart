class PatientDiagnosisModel {
  String? id;
  int? pkid;
  String? diagnosisName;
  String? description;
  DiagnosedPatient? diagnosedPatient;
  DiagnosedPatient? diagnosedBy;
  String? createdAt;

  PatientDiagnosisModel(
      {this.id,
      this.pkid,
      this.diagnosisName,
      this.description,
      this.diagnosedPatient,
      this.diagnosedBy,
      this.createdAt});

  PatientDiagnosisModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pkid = json['pkid'];
    diagnosisName = json['diagnosis_name'];
    description = json['description'];
    diagnosedPatient = json['diagnosed_patient'] != null
        ? new DiagnosedPatient.fromJson(json['diagnosed_patient'])
        : null;
    diagnosedBy = json['diagnosed_by'] != null
        ? new DiagnosedPatient.fromJson(json['diagnosed_by'])
        : null;
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pkid'] = this.pkid;
    data['diagnosis_name'] = this.diagnosisName;
    data['description'] = this.description;
    if (this.diagnosedPatient != null) {
      data['diagnosed_patient'] = this.diagnosedPatient!.toJson();
    }
    if (this.diagnosedBy != null) {
      data['diagnosed_by'] = this.diagnosedBy!.toJson();
    }
    data['created_at'] = this.createdAt;
    return data;
  }
}

class DiagnosedPatient {
  String? firstName;
  String? lastName;
  String? email;
  int? pkid;

  DiagnosedPatient({this.firstName, this.lastName, this.email, this.pkid});

  DiagnosedPatient.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    pkid = json['pkid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['pkid'] = this.pkid;
    return data;
  }
}
