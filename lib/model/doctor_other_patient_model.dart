class DoctorOtherPatientsModel {
  String? id;
  int? pkid;
  int? user;
  String? gender;
  String? dateOfBirth;
  String? patientNumber;
  int? patientDoctor;
  String? profilePhoto;
  Details? details;

  DoctorOtherPatientsModel(
      {this.id,
      this.pkid,
      this.user,
      this.gender,
      this.dateOfBirth,
      this.patientNumber,
      this.patientDoctor,
      this.profilePhoto,
      this.details});

  DoctorOtherPatientsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pkid = json['pkid'];
    user = json['user'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    patientNumber = json['patient_number'];
    patientDoctor = json['patient_doctor'];
    profilePhoto = json['profile_photo'];
    details =
        json['details'] != null ? new Details.fromJson(json['details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pkid'] = this.pkid;
    data['user'] = this.user;
    data['gender'] = this.gender;
    data['date_of_birth'] = this.dateOfBirth;
    data['patient_number'] = this.patientNumber;
    data['patient_doctor'] = this.patientDoctor;
    data['profile_photo'] = this.profilePhoto;
    if (this.details != null) {
      data['details'] = this.details!.toJson();
    }
    return data;
  }
}

class Details {
  String? id;
  int? pkid;
  String? firstName;
  String? lastName;
  bool? isPatient;
  bool? isAdmitted;
  bool? isAdmittedRequest;

  Details(
      {this.id,
      this.pkid,
      this.firstName,
      this.lastName,
      this.isPatient,
      this.isAdmitted,
      this.isAdmittedRequest});

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pkid = json['pkid'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    isPatient = json['is_patient'];
    isAdmitted = json['is_admitted'];
    isAdmittedRequest = json['is_admitted_request'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pkid'] = this.pkid;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['is_patient'] = this.isPatient;
    data['is_admitted'] = this.isAdmitted;
    data['is_admitted_request'] = this.isAdmittedRequest;
    return data;
  }
}
