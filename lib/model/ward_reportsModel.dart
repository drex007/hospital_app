class BedSpaces {
  int? pkid;
  Ward? ward;
  ReportedBy? reportedBy;
  String? id;
  String? createdAt;
  String? updatedAt;
  String? report;

  BedSpaces(
      {this.pkid,
      this.ward,
      this.reportedBy,
      this.id,
      this.createdAt,
      this.updatedAt,
      this.report});

  BedSpaces.fromJson(Map<String, dynamic> json) {
    pkid = json['pkid'];
    ward = json['ward'] != null ? new Ward.fromJson(json['ward']) : null;
    reportedBy = json['reported_by'] != null
        ? new ReportedBy.fromJson(json['reported_by'])
        : null;
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    report = json['report'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pkid'] = this.pkid;
    if (this.ward != null) {
      data['ward'] = this.ward!.toJson();
    }
    if (this.reportedBy != null) {
      data['reported_by'] = this.reportedBy!.toJson();
    }
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['report'] = this.report;
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

class ReportedBy {
  String? firstName;
  String? lastName;
  String? email;
  int? pkid;

  ReportedBy({this.firstName, this.lastName, this.email, this.pkid});

  ReportedBy.fromJson(Map<String, dynamic> json) {
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
