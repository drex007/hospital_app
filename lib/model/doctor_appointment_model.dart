class DoctorAppointmentModel {
  String? id;
  int? pkid;
  Patient? patient;
  int? patientDoctor;
  String? date;
  String? time;
  int? appointmentAuthor;

  DoctorAppointmentModel(
      {this.id,
      this.pkid,
      this.patient,
      this.patientDoctor,
      this.date,
      this.time,
      this.appointmentAuthor});

  DoctorAppointmentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pkid = json['pkid'];
    patient =
        json['patient'] != null ? new Patient.fromJson(json['patient']) : null;
    patientDoctor = json['patient_doctor'];
    date = json['date'];
    time = json['time'];
    appointmentAuthor = json['appointment_author'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pkid'] = this.pkid;
    if (this.patient != null) {
      data['patient'] = this.patient!.toJson();
    }
    data['patient_doctor'] = this.patientDoctor;
    data['date'] = this.date;
    data['time'] = this.time;
    data['appointment_author'] = this.appointmentAuthor;
    return data;
  }
}

class Patient {
  String? id;
  int? pkid;
  String? firstName;
  String? lastName;
  String? patientNumber;
  String? profilePhoto;
  String? gender;

  Patient(
      {this.id,
      this.pkid,
      this.firstName,
      this.lastName,
      this.patientNumber,
      this.profilePhoto,
      this.gender});

  Patient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pkid = json['pkid'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    patientNumber = json['patient_number'];
    profilePhoto = json['profile_photo'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pkid'] = this.pkid;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['patient_number'] = this.patientNumber;
    data['profile_photo'] = this.profilePhoto;
    data['gender'] = this.gender;
    return data;
  }
}
