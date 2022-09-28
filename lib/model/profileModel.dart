class ProfileModel {
  Profile? profile;

  ProfileModel({this.profile});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    return data;
  }
}

class Profile {
  int? pkid;
  String? firstName;
  String? lastName;
  String? email;
  String? userId;
  String? fullName;
  PatientDoctor? patientDoctor;
  String? country;
  PatientDoctor? userDetails;
  String? id;
  String? patientNumber;
  String? patientPhone;
  String? staffNumber;
  String? profilePhoto;
  String? patientWorkHistory;
  String? allergiesAndReactions;
  String? familyMedicalRecords;
  String? nhisNumber;
  String? state;
  String? lgaOrProvince;
  String? occupation;
  String? maritalStatus;
  String? nextKinName;
  String? nextKinAddress;
  String? nextKinPhoneNumber;
  String? relationshipWithNextOfKin;
  String? phone;
  String? address;
  String? genotype;
  String? vdrl;
  String? dateOfBirth;
  String? bloodGroup;
  String? highestEducationDegree;
  String? ethnicGroup;
  String? aboutMe;
  String? gender;
  String? city;
  bool? isProfileUpdated;
  String? createdAt;
  String? updatedAt;
  int? user;
  List<int>? dependant;

  Profile(
      {this.pkid,
      this.firstName,
      this.lastName,
      this.email,
      this.userId,
      this.fullName,
      this.patientDoctor,
      this.country,
      this.userDetails,
      this.id,
      this.patientNumber,
      this.patientPhone,
      this.staffNumber,
      this.profilePhoto,
      this.patientWorkHistory,
      this.allergiesAndReactions,
      this.familyMedicalRecords,
      this.nhisNumber,
      this.state,
      this.lgaOrProvince,
      this.occupation,
      this.maritalStatus,
      this.nextKinName,
      this.nextKinAddress,
      this.nextKinPhoneNumber,
      this.relationshipWithNextOfKin,
      this.phone,
      this.address,
      this.genotype,
      this.vdrl,
      this.dateOfBirth,
      this.bloodGroup,
      this.highestEducationDegree,
      this.ethnicGroup,
      this.aboutMe,
      this.gender,
      this.city,
      this.isProfileUpdated,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.dependant});

  Profile.fromJson(Map<String, dynamic> json) {
    pkid = json['pkid'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    userId = json['user_id'];
    fullName = json['full_name'];
    patientDoctor = json['patient_doctor'] != null
        ? new PatientDoctor.fromJson(json['patient_doctor'])
        : null;
    country = json['country'];
    userDetails = json['user_details'] != null
        ? new PatientDoctor.fromJson(json['user_details'])
        : null;
    id = json['id'];
    patientNumber = json['patient_number'];
    patientPhone = json['patient_phone'];
    staffNumber = json['staff_number'];
    profilePhoto = json['profile_photo'];
    patientWorkHistory = json['patient_work_history'];
    allergiesAndReactions = json['allergies_and_reactions'];
    familyMedicalRecords = json['family_medical_records'];
    nhisNumber = json['nhis_number'];
    state = json['state'];
    lgaOrProvince = json['lga_or_province'];
    occupation = json['occupation'];
    maritalStatus = json['marital_status'];
    nextKinName = json['next_kin_name'];
    nextKinAddress = json['next_kin_address'];
    nextKinPhoneNumber = json['next_kin_phone_number'];
    relationshipWithNextOfKin = json['relationship_with_next_of_kin'];
    phone = json['phone'];
    address = json['address'];
    genotype = json['genotype'];
    vdrl = json['vdrl'];
    dateOfBirth = json['date_of_birth'];
    bloodGroup = json['blood_group'];
    highestEducationDegree = json['highest_education_degree'];
    ethnicGroup = json['ethnic_group'];
    aboutMe = json['about_me'];
    gender = json['gender'];
    city = json['city'];
    isProfileUpdated = json['is_profile_updated'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'];
    dependant = json['dependant'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pkid'] = this.pkid;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['user_id'] = this.userId;
    data['full_name'] = this.fullName;
    data['id'] = this.id;
    data['patient_number'] = this.patientNumber;
    data['patient_phone'] = this.patientPhone;
    data['staff_number'] = this.staffNumber;
    data['profile_photo'] = this.profilePhoto;
    data['patient_work_history'] = this.patientWorkHistory;
    data['allergies_and_reactions'] = this.allergiesAndReactions;
    data['family_medical_records'] = this.familyMedicalRecords;
    data['nhis_number'] = this.nhisNumber;
    data['state'] = this.state;
    data['lga_or_province'] = this.lgaOrProvince;
    data['occupation'] = this.occupation;
    data['marital_status'] = this.maritalStatus;
    data['next_kin_name'] = this.nextKinName;
    data['next_kin_address'] = this.nextKinAddress;
    data['next_kin_phone_number'] = this.nextKinPhoneNumber;
    data['relationship_with_next_of_kin'] = this.relationshipWithNextOfKin;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['genotype'] = this.genotype;
    data['vdrl'] = this.vdrl;
    data['date_of_birth'] = this.dateOfBirth;
    data['blood_group'] = this.bloodGroup;
    data['highest_education_degree'] = this.highestEducationDegree;
    data['ethnic_group'] = this.ethnicGroup;
    data['about_me'] = this.aboutMe;
    data['gender'] = this.gender;
    data['city'] = this.city;
    data['is_profile_updated'] = this.isProfileUpdated;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['user'] = this.user;
    data['dependant'] = this.dependant;
    return data;
  }
}

class PatientDoctor {
  int? pkid;
  String? lastLogin;
  bool? isSuperuser;
  String? id;
  String? firstName;
  String? lastName;
  Null? otherName;
  String? email;
  Null? directorate;
  Null? department;
  Null? specialization;
  Null? designation;
  Null? accountActivationToken;
  bool? isDepartmentHead;
  bool? isPasswordReset;
  bool? isStaff;
  bool? isAdministrator;
  bool? isHead;
  bool? isDoctor;
  bool? isRecords;
  bool? isRadiologist;
  bool? isLaboratorist;
  bool? isNurse;
  bool? isPharmacist;
  bool? isAccountant;
  bool? isCollections;
  bool? isSecretory;
  bool? isAudit;
  bool? isPatient;
  bool? isDentist;
  bool? isOphthalmologists;
  bool? isOtolaryngologists;
  bool? isMidWife;
  bool? isPhysiotherapists;
  bool? isActive;
  bool? isAdmitted;
  bool? isAdmittedRequest;
  bool? isOnline;
  String? dateJoined;
  Null? createdBy;
  String? socketId;
  Null? assignedSupplypoint;
  List<Null>? groups;
  List<Null>? userPermissions;

  PatientDoctor(
      {this.pkid,
      this.lastLogin,
      this.isSuperuser,
      this.id,
      this.firstName,
      this.lastName,
      this.otherName,
      this.email,
      this.directorate,
      this.department,
      this.specialization,
      this.designation,
      this.accountActivationToken,
      this.isDepartmentHead,
      this.isPasswordReset,
      this.isStaff,
      this.isAdministrator,
      this.isHead,
      this.isDoctor,
      this.isRecords,
      this.isRadiologist,
      this.isLaboratorist,
      this.isNurse,
      this.isPharmacist,
      this.isAccountant,
      this.isCollections,
      this.isSecretory,
      this.isAudit,
      this.isPatient,
      this.isDentist,
      this.isOphthalmologists,
      this.isOtolaryngologists,
      this.isMidWife,
      this.isPhysiotherapists,
      this.isActive,
      this.isAdmitted,
      this.isAdmittedRequest,
      this.isOnline,
      this.dateJoined,
      this.createdBy,
      this.socketId,
      this.assignedSupplypoint,
      this.groups,
      this.userPermissions});

  PatientDoctor.fromJson(Map<String, dynamic> json) {
    pkid = json['pkid'];
    lastLogin = json['last_login'];
    isSuperuser = json['is_superuser'];
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    otherName = json['other_name'];
    email = json['email'];
    directorate = json['directorate'];
    department = json['department'];
    specialization = json['specialization'];
    designation = json['designation'];
    accountActivationToken = json['account_activation_token'];
    isDepartmentHead = json['is_department_head'];
    isPasswordReset = json['is_password_reset'];
    isStaff = json['is_staff'];
    isAdministrator = json['is_administrator'];
    isHead = json['is_head'];
    isDoctor = json['is_doctor'];
    isRecords = json['is_records'];
    isRadiologist = json['is_radiologist'];
    isLaboratorist = json['is_laboratorist'];
    isNurse = json['is_nurse'];
    isPharmacist = json['is_pharmacist'];
    isAccountant = json['is_accountant'];
    isCollections = json['is_collections'];
    isSecretory = json['is_secretory'];
    isAudit = json['is_audit'];
    isPatient = json['is_patient'];
    isDentist = json['is_dentist'];
    isOphthalmologists = json['is_ophthalmologists'];
    isOtolaryngologists = json['is_otolaryngologists'];
    isMidWife = json['is_mid_wife'];
    isPhysiotherapists = json['is_physiotherapists'];
    isActive = json['is_active'];
    isAdmitted = json['is_admitted'];
    isAdmittedRequest = json['is_admitted_request'];
    isOnline = json['is_online'];
    dateJoined = json['date_joined'];
    createdBy = json['created_by'];
    socketId = json['socket_id'];
    assignedSupplypoint = json['assigned_supplypoint'];

    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pkid'] = this.pkid;
    data['last_login'] = this.lastLogin;
    data['is_superuser'] = this.isSuperuser;
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['other_name'] = this.otherName;
    data['email'] = this.email;
    data['directorate'] = this.directorate;
    data['department'] = this.department;
    data['specialization'] = this.specialization;
    data['designation'] = this.designation;
    data['account_activation_token'] = this.accountActivationToken;
    data['is_department_head'] = this.isDepartmentHead;
    data['is_password_reset'] = this.isPasswordReset;
    data['is_staff'] = this.isStaff;
    data['is_administrator'] = this.isAdministrator;
    data['is_head'] = this.isHead;
    data['is_doctor'] = this.isDoctor;
    data['is_records'] = this.isRecords;
    data['is_radiologist'] = this.isRadiologist;
    data['is_laboratorist'] = this.isLaboratorist;
    data['is_nurse'] = this.isNurse;
    data['is_pharmacist'] = this.isPharmacist;
    data['is_accountant'] = this.isAccountant;
    data['is_collections'] = this.isCollections;
    data['is_secretory'] = this.isSecretory;
    data['is_audit'] = this.isAudit;
    data['is_patient'] = this.isPatient;
    data['is_dentist'] = this.isDentist;
    data['is_ophthalmologists'] = this.isOphthalmologists;
    data['is_otolaryngologists'] = this.isOtolaryngologists;
    data['is_mid_wife'] = this.isMidWife;
    data['is_physiotherapists'] = this.isPhysiotherapists;
    data['is_active'] = this.isActive;
    data['is_admitted'] = this.isAdmitted;
    data['is_admitted_request'] = this.isAdmittedRequest;
    data['is_online'] = this.isOnline;
    data['date_joined'] = this.dateJoined;
    data['created_by'] = this.createdBy;
    data['socket_id'] = this.socketId;
    data['assigned_supplypoint'] = this.assignedSupplypoint;
  }
}
