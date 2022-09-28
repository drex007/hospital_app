class LabTestTypeModel {
  String? id;
  int? pkid;
  String? typeTitle;

  LabTestTypeModel({this.id, this.pkid, this.typeTitle});

  LabTestTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pkid = json['pkid'];
    typeTitle = json['type_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pkid'] = this.pkid;
    data['type_title'] = this.typeTitle;
    return data;
  }
}
