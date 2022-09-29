class EmployeeModel {
  String? id;
  int? pkid;
  String? firstName;
  String? lastName;
  bool? isAccountant;
  bool? isCollections;
  bool? isDoctor;
  bool? isNurse;
  bool? isAdministrator;
  bool? isLaboratorist;
  bool? isPatient;
  bool? isPharmacist;
  bool? isRecords;
  bool? isOnline;
  Profile? profile;

  EmployeeModel(
      {this.id,
      this.pkid,
      this.firstName,
      this.lastName,
      this.isAccountant,
      this.isCollections,
      this.isDoctor,
      this.isNurse,
      this.isAdministrator,
      this.isLaboratorist,
      this.isPatient,
      this.isPharmacist,
      this.isRecords,
      this.isOnline,
      this.profile});

  EmployeeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pkid = json['pkid'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    isAccountant = json['is_accountant'];
    isCollections = json['is_collections'];
    isDoctor = json['is_doctor'];
    isNurse = json['is_nurse'];
    isAdministrator = json['is_administrator'];
    isLaboratorist = json['is_laboratorist'];
    isPatient = json['is_patient'];
    isPharmacist = json['is_pharmacist'];
    isRecords = json['is_records'];
    isOnline = json['is_online'];
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pkid'] = this.pkid;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['is_accountant'] = this.isAccountant;
    data['is_collections'] = this.isCollections;
    data['is_doctor'] = this.isDoctor;
    data['is_nurse'] = this.isNurse;
    data['is_administrator'] = this.isAdministrator;
    data['is_laboratorist'] = this.isLaboratorist;
    data['is_patient'] = this.isPatient;
    data['is_pharmacist'] = this.isPharmacist;
    data['is_records'] = this.isRecords;
    data['is_online'] = this.isOnline;
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    return data;
  }
}

class Profile {
  String? id;
  int? pkid;
  int? user;
  String? gender;
  String? profilePhoto;

  Profile({this.id, this.pkid, this.user, this.gender, this.profilePhoto});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pkid = json['pkid'];
    user = json['user'];
    gender = json['gender'];
    profilePhoto = json['profile_photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pkid'] = this.pkid;
    data['user'] = this.user;
    data['gender'] = this.gender;
    data['profile_photo'] = this.profilePhoto;
    return data;
  }
}
