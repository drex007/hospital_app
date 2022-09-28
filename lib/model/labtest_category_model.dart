class LabTestCategoryModel {
  String? id;
  int? pkid;
  String? title;
  int? investigationType;

  LabTestCategoryModel(
      {this.id, this.pkid, this.title, this.investigationType});

  LabTestCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pkid = json['pkid'];
    title = json['title'];
    investigationType = json['investigation_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pkid'] = this.pkid;
    data['title'] = this.title;
    data['investigation_type'] = this.investigationType;
    return data;
  }
}
