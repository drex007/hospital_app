class RadiologyTestModel {
  String? id;
  int? pkid;
  int? diagnosis;
  int? patient;
  int? investigationCategory;
  String? imageReport;
  String? otherScannedTestResults;
  String? textReport;
  String? testType;
  String? testCategory;
  int? requestDoctor;
  bool? isLocal;
  String? createdAt;

  RadiologyTestModel(
      {this.id,
      this.pkid,
      this.diagnosis,
      this.patient,
      this.investigationCategory,
      this.imageReport,
      this.otherScannedTestResults,
      this.textReport,
      this.testType,
      this.testCategory,
      this.requestDoctor,
      this.isLocal,
      this.createdAt});

  RadiologyTestModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pkid = json['pkid'];
    diagnosis = json['diagnosis'];
    patient = json['patient'];
    investigationCategory = json['investigation_category'];
    imageReport = json['image_report'];
    otherScannedTestResults = json['other_scanned_test_results'];
    textReport = json['text_report'];
    testType = json['test_type'];
    testCategory = json['test_category'];
    requestDoctor = json['request_doctor'];
    isLocal = json['is_local'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pkid'] = this.pkid;
    data['diagnosis'] = this.diagnosis;
    data['patient'] = this.patient;
    data['investigation_category'] = this.investigationCategory;
    data['image_report'] = this.imageReport;
    data['other_scanned_test_results'] = this.otherScannedTestResults;
    data['text_report'] = this.textReport;
    data['test_type'] = this.testType;
    data['test_category'] = this.testCategory;
    data['request_doctor'] = this.requestDoctor;
    data['is_local'] = this.isLocal;
    data['created_at'] = this.createdAt;
    return data;
  }
}
