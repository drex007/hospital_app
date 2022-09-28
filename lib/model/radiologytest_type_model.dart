class RadiologyTestTypeModel {
  String? id;
  int? pkid;
  String? title;

  RadiologyTestTypeModel({this.id, this.pkid, this.title});

  RadiologyTestTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pkid = json['pkid'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pkid'] = this.pkid;
    data['title'] = this.title;
    return data;
  }
}
