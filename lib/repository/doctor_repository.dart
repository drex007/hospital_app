import 'package:doctor/model/patient_diagnosis_model.dart';
import 'package:get/state_manager.dart';

class DoctorRepository extends GetxController {
  RxList<dynamic> _doctorPatients = [].obs;
  RxList get doctorPatients => _doctorPatients;

  RxList<dynamic> _doctorOtherPatients = [].obs;
  RxList get doctorOtherPatients => _doctorOtherPatients;

  RxList<dynamic> _newDiagnosis = [].obs;
  RxList get newDiagnosis => _newDiagnosis;

  RxList<dynamic> _patientDiagnosis = [].obs;
  RxList get patientDiagnosis => _patientDiagnosis;

  RxList<dynamic> _patientPrescriptions = [].obs;
  RxList get patientPrescriptions => _patientPrescriptions;

  RxList<dynamic> _patientOtherPrescriptions = [].obs;
  RxList get patientOtherPrescriptions => _patientOtherPrescriptions;

  RxList<dynamic> _drugs = [].obs;
  RxList get drugs => _drugs;

  RxList<dynamic> _labTests = [].obs;
  RxList get laboratoryTests => _labTests;

  RxList<dynamic> _otherLabTests = [].obs;
  RxList get otherLaboratoryTests => _otherLabTests;

  RxList<dynamic> _labTestTypes = [].obs;
  RxList get laboratoryTestTypes => _labTestTypes;

  RxList<dynamic> _labTestCategories = [].obs;
  RxList get laboratoryTestCategories => _labTestCategories;

  RxList<dynamic> _labTestSamples = [].obs;
  RxList get laboratoryTestSamples => _labTestSamples;

  RxList<dynamic> _radiologyTests = [].obs;
  RxList get radiologyTests => _radiologyTests;

  RxList<dynamic> _otherRadiologyTests = [].obs;
  RxList get otherRadiologyTests => _otherRadiologyTests;

  RxList<dynamic> _radiologyTestTypes = [].obs;
  RxList get radiologyTestTypes => _radiologyTestTypes;

  RxList<dynamic> _radiologyTestCategories = [].obs;
  RxList get radiologyTestCategories => _radiologyTestCategories;

  RxList<dynamic> _patientFiles = [].obs;
  RxList get patientFiles => _patientFiles;

  RxList<dynamic> _wardBedSpaces = [].obs;
  RxList get wardBedSpaces => _wardBedSpaces;

  RxList<dynamic> _appointments = [].obs;
  RxList get appointments => _appointments;
}
