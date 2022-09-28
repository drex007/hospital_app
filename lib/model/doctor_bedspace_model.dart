class DoctorBedSpaceModel {
  String? id;
  int? pkid;
  int? ward;
  String? wardName;
  String? bedNumber;
  bool? allocated;

  DoctorBedSpaceModel(
      {this.id,
      this.pkid,
      this.ward,
      this.wardName,
      this.bedNumber,
      this.allocated});

  DoctorBedSpaceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pkid = json['pkid'];
    ward = json['ward'];
    wardName = json['ward_name'];
    bedNumber = json['bed_number'];
    allocated = json['allocated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pkid'] = this.pkid;
    data['ward'] = this.ward;
    data['ward_name'] = this.wardName;
    data['bed_number'] = this.bedNumber;
    data['allocated'] = this.allocated;
    return data;
  }
}
