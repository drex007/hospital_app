class LabTestSampleModel {
  String? id;
  int? pkid;
  int? investigationCategory;
  String? sampleType;

  LabTestSampleModel(
      {this.id, this.pkid, this.investigationCategory, this.sampleType});

  LabTestSampleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pkid = json['pkid'];
    investigationCategory = json['investigation_category'];
    sampleType = json['sample_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pkid'] = this.pkid;
    data['investigation_category'] = this.investigationCategory;
    data['sample_type'] = this.sampleType;
    return data;
  }
}
