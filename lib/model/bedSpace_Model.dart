class BedSpaceModel {
  String? id;
  int? pkid;
  String? bedNumber;
  bool? allocated;
  Ward? ward;
  int? patient;

  BedSpaceModel(
      {this.id,
      this.pkid,
      this.bedNumber,
      this.allocated,
      this.ward,
      this.patient});

  BedSpaceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pkid = json['pkid'];
    bedNumber = json['bed_number'];
    allocated = json['allocated'];
    ward = json['ward'] != null ? new Ward.fromJson(json['ward']) : null;
    patient = json['patient'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pkid'] = this.pkid;
    data['bed_number'] = this.bedNumber;
    data['allocated'] = this.allocated;
    if (this.ward != null) {
      data['ward'] = this.ward!.toJson();
    }
    data['patient'] = this.patient;
    return data;
  }
}

class Ward {
  String? id;
  int? pkid;
  String? publisher;
  String? name;
  int? totalBedSpace;
  String? report;

  Ward(
      {this.id,
      this.pkid,
      this.publisher,
      this.name,
      this.totalBedSpace,
      this.report});

  Ward.fromJson(Map<String, dynamic> json) {
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
