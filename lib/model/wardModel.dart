class WardModel {
  String? id;
  int? pkid;
  String? publisher;
  String? name;
  int? totalBedSpace;
  String? report;

  WardModel(
      {this.id,
      this.pkid,
      this.publisher,
      this.name,
      this.totalBedSpace,
      this.report});

  WardModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pkid = json['pkid'];
    publisher = json['publisher'];
    name = json['name'];
    totalBedSpace = json['total_bed_space'];
    report = json['report'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pkid'] = this.pkid;
    data['publisher'] = this.publisher;
    data['name'] = this.name;
    data['total_bed_space'] = this.totalBedSpace;
    data['report'] = this.report;
    return data;
  }
}
    