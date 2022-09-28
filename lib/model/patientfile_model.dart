class PatientFileModel {
  String? id;
  int? pkid;
  String? file;
  String? fileUrl;
  String? title;
  int? fileDiagnosis;
  int? filePatient;
  int? fileDoctor;
  String? createdAt;

  PatientFileModel(
      {this.id,
      this.pkid,
      this.file,
      this.fileUrl,
      this.title,
      this.fileDiagnosis,
      this.filePatient,
      this.fileDoctor,
      this.createdAt});

  PatientFileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pkid = json['pkid'];
    file = json['file'];
    fileUrl = json['file_url'];
    title = json['title'];
    fileDiagnosis = json['file_diagnosis'];
    filePatient = json['file_patient'];
    fileDoctor = json['file_doctor'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pkid'] = this.pkid;
    data['file'] = this.file;
    data['file_url'] = this.fileUrl;
    data['title'] = this.title;
    data['file_diagnosis'] = this.fileDiagnosis;
    data['file_patient'] = this.filePatient;
    data['file_doctor'] = this.fileDoctor;
    data['created_at'] = this.createdAt;
    return data;
  }
}
