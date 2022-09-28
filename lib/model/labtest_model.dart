class LaboratoryTestModel {
  String? id;
  int? pkid;
  int? investigationSample;
  String? testSample;
  String? testType;
  String? testCategory;
  bool? isLocal;
  String? imageReport;
  String? otherScannedTestResults;
  String? textReport;
  bool? investigationConducted;
  String? createdAt;

  LaboratoryTestModel(
      {this.id,
      this.pkid,
      this.investigationSample,
      this.testSample,
      this.testType,
      this.testCategory,
      this.isLocal,
      this.imageReport,
      this.otherScannedTestResults,
      this.textReport,
      this.investigationConducted,
      this.createdAt});

  LaboratoryTestModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pkid = json['pkid'];
    investigationSample = json['investigation_sample'];
    testSample = json['test_sample'];
    testType = json['test_type'];
    testCategory = json['test_category'];
    isLocal = json['is_local'];
    imageReport = json['image_report'];
    otherScannedTestResults = json['other_scanned_test_results'];
    textReport = json['text_report'];
    investigationConducted = json['investigation_conducted'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pkid'] = this.pkid;
    data['investigation_sample'] = this.investigationSample;
    data['test_sample'] = this.testSample;
    data['test_type'] = this.testType;
    data['test_category'] = this.testCategory;
    data['is_local'] = this.isLocal;
    data['image_report'] = this.imageReport;
    data['other_scanned_test_results'] = this.otherScannedTestResults;
    data['text_report'] = this.textReport;
    data['investigation_conducted'] = this.investigationConducted;
    data['created_at'] = this.createdAt;
    return data;
  }
}
