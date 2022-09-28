class DiagnosisPrescriptionModel {
  String? id;
  int? pkid;
  Diagnosis? diagnosis;
  String? routes;
  String? drugs;
  String? dosageForm;
  String? units;
  String? frequency;
  int? duration;
  int? times;
  bool? otherPrescription;
  bool? invoicePaid;
  bool? invoiceGenerated;
  bool? isDispensed;
  int? drugQuantity;
  PatientPrescribed? patientPrescribed;
  String? prescriptionType;
  int? injectionCount;
  PatientPrescribed? author;
  String? patientId;
  String? durationTime;
  PatientProfile? patientProfile;

  DiagnosisPrescriptionModel(
      {this.id,
      this.pkid,
      this.diagnosis,
      this.routes,
      this.drugs,
      this.dosageForm,
      this.units,
      this.frequency,
      this.duration,
      this.times,
      this.otherPrescription,
      this.invoicePaid,
      this.invoiceGenerated,
      this.isDispensed,
      this.drugQuantity,
      this.patientPrescribed,
      this.prescriptionType,
      this.injectionCount,
      this.author,
      this.patientId,
      this.durationTime,
      this.patientProfile});

  DiagnosisPrescriptionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pkid = json['pkid'];
    diagnosis = json['diagnosis'] != null
        ? new Diagnosis.fromJson(json['diagnosis'])
        : null;
    routes = json['routes'];
    drugs = json['drugs'];
    dosageForm = json['dosage_form'];
    units = json['units'];
    frequency = json['frequency'];
    duration = json['duration'];
    times = json['times'];
    otherPrescription = json['other_prescription'];
    invoicePaid = json['invoice_paid'];
    invoiceGenerated = json['invoice_generated'];
    isDispensed = json['is_dispensed'];
    drugQuantity = json['drug_quantity'];
    patientPrescribed = json['patient_prescribed'] != null
        ? new PatientPrescribed.fromJson(json['patient_prescribed'])
        : null;
    prescriptionType = json['prescription_type'];
    injectionCount = json['injection_count'];
    author = json['author'] != null
        ? new PatientPrescribed.fromJson(json['author'])
        : null;
    patientId = json['patient_id'];
    durationTime = json['duration_time'];
    patientProfile = json['patient_profile'] != null
        ? new PatientProfile.fromJson(json['patient_profile'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pkid'] = this.pkid;
    if (this.diagnosis != null) {
      data['diagnosis'] = this.diagnosis!.toJson();
    }
    data['routes'] = this.routes;
    data['drugs'] = this.drugs;
    data['dosage_form'] = this.dosageForm;
    data['units'] = this.units;
    data['frequency'] = this.frequency;
    data['duration'] = this.duration;
    data['times'] = this.times;
    data['other_prescription'] = this.otherPrescription;
    data['invoice_paid'] = this.invoicePaid;
    data['invoice_generated'] = this.invoiceGenerated;
    data['is_dispensed'] = this.isDispensed;
    data['drug_quantity'] = this.drugQuantity;
    if (this.patientPrescribed != null) {
      data['patient_prescribed'] = this.patientPrescribed!.toJson();
    }
    data['prescription_type'] = this.prescriptionType;
    data['injection_count'] = this.injectionCount;
    if (this.author != null) {
      data['author'] = this.author!.toJson();
    }
    data['patient_id'] = this.patientId;
    data['duration_time'] = this.durationTime;
    if (this.patientProfile != null) {
      data['patient_profile'] = this.patientProfile!.toJson();
    }
    return data;
  }
}

class Diagnosis {
  String? id;
  int? pkid;
  String? diagnosisName;
  String? description;
  DiagnosedPatient? diagnosedPatient;
  DiagnosedPatient? diagnosedBy;
  String? createdAt;

  Diagnosis(
      {this.id,
      this.pkid,
      this.diagnosisName,
      this.description,
      this.diagnosedPatient,
      this.diagnosedBy,
      this.createdAt});

  Diagnosis.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pkid = json['pkid'];
    diagnosisName = json['diagnosis_name'];
    description = json['description'];
    diagnosedPatient = json['diagnosed_patient'] != null
        ? new DiagnosedPatient.fromJson(json['diagnosed_patient'])
        : null;
    diagnosedBy = json['diagnosed_by'] != null
        ? new DiagnosedPatient.fromJson(json['diagnosed_by'])
        : null;
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pkid'] = this.pkid;
    data['diagnosis_name'] = this.diagnosisName;
    data['description'] = this.description;
    if (this.diagnosedPatient != null) {
      data['diagnosed_patient'] = this.diagnosedPatient!.toJson();
    }
    if (this.diagnosedBy != null) {
      data['diagnosed_by'] = this.diagnosedBy!.toJson();
    }
    data['created_at'] = this.createdAt;
    return data;
  }
}

class DiagnosedPatient {
  String? firstName;
  String? lastName;
  String? email;
  int? pkid;

  DiagnosedPatient({this.firstName, this.lastName, this.email, this.pkid});

  DiagnosedPatient.fromJson(Map<String, dynamic> json) {
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

class PatientPrescribed {
  String? id;
  int? pkid;
  String? email;
  String? firstName;
  String? lastName;
  String? fullName;
  String? otherName;
  String? gender;
  String? profilePhoto;
  String? country;
  String? city;

  PatientPrescribed(
      {this.id,
      this.pkid,
      this.email,
      this.firstName,
      this.lastName,
      this.fullName,
      this.otherName,
      this.gender,
      this.profilePhoto,
      this.country,
      this.city});

  PatientPrescribed.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pkid = json['pkid'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fullName = json['full_name'];
    otherName = json['other_name'];
    gender = json['gender'];
    profilePhoto = json['profile_photo'];
    country = json['country'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pkid'] = this.pkid;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['full_name'] = this.fullName;
    data['other_name'] = this.otherName;
    data['gender'] = this.gender;
    data['profile_photo'] = this.profilePhoto;
    data['country'] = this.country;
    data['city'] = this.city;
    return data;
  }
}

class PatientProfile {
  String? number;
  String? gender;
  String? phone;
  String? bloodGroup;
  String? genotype;
  String? photo;
  String? dob;

  PatientProfile(
      {this.number,
      this.gender,
      this.phone,
      this.bloodGroup,
      this.genotype,
      this.photo,
      this.dob});

  PatientProfile.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    gender = json['gender'];
    phone = json['phone'];
    bloodGroup = json['blood_group'];
    genotype = json['genotype'];
    photo = json['photo'];
    dob = json['dob'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['gender'] = this.gender;
    data['phone'] = this.phone;
    data['blood_group'] = this.bloodGroup;
    data['genotype'] = this.genotype;
    data['photo'] = this.photo;
    data['dob'] = this.dob;
    return data;
  }
}
