// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'package:doctor/constants/url_paths.dart';
import 'package:doctor/model/doctor_appointment_model.dart';
import 'package:doctor/model/doctor_bedspace_model.dart';
import 'package:doctor/model/doctor_patient_model.dart';
import 'package:doctor/model/drug_model.dart';
import 'package:doctor/model/labtest_category_model.dart';
import 'package:doctor/model/labtest_model.dart';
import 'package:doctor/model/labtest_sample_model.dart';
import 'package:doctor/model/labtest_type_model.dart';
import 'package:doctor/model/patient_diagnosis_model.dart';
import 'package:doctor/model/patient_prescription_model.dart';
import 'package:doctor/model/patientfile_model.dart';
import 'package:doctor/model/radiologytest_category_model.dart';
import 'package:doctor/model/radiologytest_model.dart';
import 'package:doctor/model/radiologytest_type_model.dart';
import 'package:doctor/repository/doctor_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class DoctorServices extends GetxController {
  final tokenStorage = GetStorage();
  DoctorRepository _doctorRepo = Get.find();

  var showModal = true.obs;
  var showAppointments = true.obs;

  final patientsUrl1 =
      Uri.parse("${backendRequestUrl2}doctor/mobile_patients/");
  final patientsUrl2 =
      Uri.parse("${backendRequestUrl2}doctor/mobile_otherpatients/");

  Future getDoctorPatients() async {
    try {
      var response = await http.get(patientsUrl1,
          headers: {"authorization": "Bearer ${tokenStorage.read("token")}"});

      var jsonData = jsonDecode(response.body);

      _doctorRepo.doctorPatients.clear();

      for (var item in jsonData) {
        _doctorRepo.doctorPatients.add(DoctorPatientsModel.fromJson(item));
      }

      _doctorRepo.doctorPatients.refresh();
    } catch (e) {
      print(e);
    }
  }

  Future getDoctorOtherPatients() async {
    try {
      var response = await http.get(patientsUrl2,
          headers: {"authorization": "Bearer ${tokenStorage.read("token")}"});
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        _doctorRepo.doctorOtherPatients.clear();

        for (var item in jsonData) {
          _doctorRepo.doctorOtherPatients
              .add(DoctorPatientsModel.fromJson(item));
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future getPatientDiagnosis(String params) async {
    try {
      var response = await http.get(
        Uri.parse("${backendRequestUrl2}doctor/diagnoses/${params}"),
        headers: {"authorization": "Bearer ${tokenStorage.read("token")}"},
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        _doctorRepo.patientDiagnosis.clear();

        for (var item in jsonData) {
          _doctorRepo.patientDiagnosis
              .add(PatientDiagnosisModel.fromJson(item));
        }
        // print('fetched diagnoses');
      }
    } catch (e) {
      print(e);
    }
  }

  Future getPatientPrescriptions(String params) async {
    try {
      var response = await http.get(
        Uri.parse(
            "${backendRequestUrl2}doctor/patient_prescriptions/${params}"),
        headers: {"authorization": "Bearer ${tokenStorage.read("token")}"},
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        _doctorRepo.patientPrescriptions.clear();

        for (var item in jsonData) {
          _doctorRepo.patientPrescriptions
              .add(PrescriptionModel.fromJson(item));
        }
        // print('fetched prescriptions');
      }
    } catch (e) {
      print(e);
    }
  }

  Future getPatientOtherPrescriptions(String params) async {
    try {
      var response = await http.get(
        Uri.parse(
            "${backendRequestUrl2}doctor/patient_prescriptions_other/${params}"),
        headers: {"authorization": "Bearer ${tokenStorage.read("token")}"},
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        _doctorRepo.patientOtherPrescriptions.clear();

        for (var item in jsonData) {
          _doctorRepo.patientOtherPrescriptions
              .add(PrescriptionModel.fromJson(item));
        }
        // print('fetched other prescriptions');
      }
    } catch (e) {
      print(e);
    }
  }

  Future getDrugs() async {
    try {
      var response = await http.get(
        Uri.parse("${backendRequestUrl2}pharmacist/drugs/"),
        headers: {"authorization": "Bearer ${tokenStorage.read("token")}"},
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        _doctorRepo.drugs.clear();

        for (var item in jsonData) {
          _doctorRepo.drugs.add(DrugModel.fromJson(item));
        }
        print('fetched drugs');
      }
    } catch (e) {
      print(e);
    }
  }

  Future addPrescription(Map data) async {
    try {
      var response = await http.post(
        Uri.parse("${backendRequestUrl2}pharmacist/mobile_prescription/"),
        headers: {"authorization": "Bearer ${tokenStorage.read("token")}"},
        body: data,
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        _doctorRepo.patientPrescriptions
            .insert(0, PrescriptionModel.fromJson(jsonData));

        Get.snackbar(
          'Message',
          'Prescription added successfully',
          colorText: Colors.black,
          backgroundColor: Colors.greenAccent.withOpacity(0.2),
        );
        showModal.value = false;

        print('added prescription');
      }
    } catch (e) {
      print("${e} :: an error occured");
    }
  }

  Future addOtherPrescription(Map data) async {
    try {
      var response = await http.post(
        Uri.parse("${backendRequestUrl2}pharmacist/mobile_prescription/"),
        headers: {"authorization": "Bearer ${tokenStorage.read("token")}"},
        body: data,
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        _doctorRepo.patientOtherPrescriptions
            .insert(0, PrescriptionModel.fromJson(jsonData));

        Get.snackbar(
          'Message',
          'Other prescription added successfully',
          colorText: Colors.black,
          backgroundColor: Colors.greenAccent.withOpacity(0.2),
        );

        showModal.value = false;

        print('added other prescription');
      }
    } catch (e) {
      print("${e} :: an error occured");
    }
  }

  Future getPatientLabTests(String params) async {
    try {
      var response = await http.get(
        Uri.parse("${backendRequestUrl2}doctor/diagnosis_labtests/${params}"),
        headers: {"authorization": "Bearer ${tokenStorage.read("token")}"},
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        _doctorRepo.laboratoryTests.clear();
        _doctorRepo.otherLaboratoryTests.clear();

        for (var item in jsonData) {
          if (item['is_local'] == true) {
            _doctorRepo.laboratoryTests.add(LaboratoryTestModel.fromJson(item));
          }

          if (item['is_local'] == false) {
            _doctorRepo.otherLaboratoryTests
                .add(LaboratoryTestModel.fromJson(item));
          }
        }
        print('fetched lab tests');
      }
    } catch (e) {
      print(e);
    }
  }

  Future getLabTestTypes() async {
    try {
      var response = await http.get(
        Uri.parse("${backendRequestUrl2}doctor/lab_investigation_types/"),
        headers: {"authorization": "Bearer ${tokenStorage.read("token")}"},
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        _doctorRepo.laboratoryTestTypes.clear();

        for (var item in jsonData) {
          _doctorRepo.laboratoryTestTypes.add(LabTestTypeModel.fromJson(item));
        }
        print('fetched labtest types');
      }
    } catch (e) {
      print(e);
    }
  }

  Future getLabTestCategories() async {
    try {
      var response = await http.get(
        Uri.parse("${backendRequestUrl2}doctor/lab_investigation_categories/"),
        headers: {"authorization": "Bearer ${tokenStorage.read("token")}"},
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        _doctorRepo.laboratoryTestCategories.clear();

        for (var item in jsonData) {
          _doctorRepo.laboratoryTestCategories
              .add(LabTestCategoryModel.fromJson(item));
        }
        print('fetched labtest categories');
      }
    } catch (e) {
      print(e);
    }
  }

  Future getLabTestSamples() async {
    try {
      var response = await http.get(
        Uri.parse("${backendRequestUrl2}doctor/lab_investigation_samples/"),
        headers: {"authorization": "Bearer ${tokenStorage.read("token")}"},
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        _doctorRepo.laboratoryTestSamples.clear();

        for (var item in jsonData) {
          _doctorRepo.laboratoryTestSamples
              .add(LabTestSampleModel.fromJson(item));
        }
        print('fetched labtest categories');
      }
    } catch (e) {
      print(e);
    }
  }

  Future addLaboratoryTest(Map data, String params) async {
    try {
      var response = await http.post(
          Uri.parse("${backendRequestUrl2}doctor/diagnosis_labtest/${params}"),
          headers: {"authorization": "Bearer ${tokenStorage.read("token")}"},
          body: data);

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        if (jsonData['is_local'] == true) {
          _doctorRepo.laboratoryTests
              .insert(0, LaboratoryTestModel.fromJson(jsonData));
        }

        if (jsonData['is_local'] == false) {
          _doctorRepo.otherLaboratoryTests
              .insert(0, LaboratoryTestModel.fromJson(jsonData));
        }

        Get.snackbar(
          'Message',
          'Laboratory test added successfully',
          colorText: Colors.black,
          backgroundColor: Colors.blue.withOpacity(0.2),
        );

        showModal.value = false;
        print('created labtest');
      }
    } catch (e) {
      print(e);
    }
  }

  Future getRadiologyTests(String params) async {
    try {
      var response = await http.get(
        Uri.parse("${backendRequestUrl2}doctor/patient_radiotests/${params}"),
        headers: {"authorization": "Bearer ${tokenStorage.read("token")}"},
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        _doctorRepo.radiologyTests.clear();
        _doctorRepo.otherRadiologyTests.clear();

        for (var item in jsonData) {
          if (item['is_local'] == true) {
            _doctorRepo.radiologyTests.add(RadiologyTestModel.fromJson(item));
          }

          if (item['is_local'] == false) {
            _doctorRepo.otherRadiologyTests
                .add(RadiologyTestModel.fromJson(item));
          }
        }

        print('fetched radiology tests');
      }
    } catch (e) {
      print(e);
    }
  }

  Future getRadiologyTestTypes() async {
    try {
      var response = await http.get(
        Uri.parse("${backendRequestUrl2}doctor/radiology_investigation_types/"),
        headers: {"authorization": "Bearer ${tokenStorage.read("token")}"},
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        _doctorRepo.radiologyTestTypes.clear();

        for (var item in jsonData) {
          _doctorRepo.radiologyTestTypes
              .add(RadiologyTestTypeModel.fromJson(item));
        }

        print('fetched radiology test_types');
      }
    } catch (e) {
      print(e);
    }
  }

  Future getRadiologyTestCategories() async {
    try {
      var response = await http.get(
        Uri.parse(
            "${backendRequestUrl2}doctor/radiology_investigation_categories/"),
        headers: {"authorization": "Bearer ${tokenStorage.read("token")}"},
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        _doctorRepo.radiologyTestCategories.clear();

        for (var item in jsonData) {
          _doctorRepo.radiologyTestCategories
              .add(RadiologyTestCategoryModel.fromJson(item));
        }

        print('fetched radiology test_categories');
      }
    } catch (e) {
      print(e);
    }
  }

  Future addRadiologyTest(Map data, String params) async {
    try {
      var response = await http.post(
        Uri.parse("${backendRequestUrl2}doctor/diagnosis_radiotest/${params}"),
        headers: {"authorization": "Bearer ${tokenStorage.read("token")}"},
        body: data,
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        if (jsonData['is_local'] == true) {
          _doctorRepo.radiologyTests
              .insert(0, RadiologyTestModel.fromJson(jsonData));
        }

        if (jsonData['is_local'] == false) {
          _doctorRepo.otherRadiologyTests
              .insert(0, RadiologyTestModel.fromJson(jsonData));
        }

        Get.snackbar(
          'Message',
          'Radiology test added successfully',
          colorText: Colors.black,
          backgroundColor: Colors.blue.withOpacity(0.2),
        );

        showModal.value = false;
        print('created radiotest');
      }
    } catch (e) {
      print(e);
    }
  }

  Future getPatientFiles(String params) async {
    try {
      var response = await http.get(
        Uri.parse("${backendRequestUrl2}doctor/patient_files/${params}"),
        headers: {"authorization": "Bearer ${tokenStorage.read("token")}"},
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        _doctorRepo.patientFiles.clear();

        for (var item in jsonData) {
          _doctorRepo.patientFiles.add(PatientFileModel.fromJson(item));
        }

        print('fetched patient files');
      }
    } catch (e) {
      print(e);
    }
  }

  Future addPatientFile(Map data, String params) async {
    try {
      var request = new http.MultipartRequest(
        'POST',
        Uri.parse("${backendRequestUrl2}doctor/upload_patient_files/${params}"),
      );

      var image = await http.MultipartFile.fromPath('file', data['image']);
      request.headers['authorization'] = "Bearer ${tokenStorage.read("token")}";
      request.files.add(image);
      request.fields['title'] = data['title'];

      var _data = await request.send();
      var res = await _data.stream.toBytes();
      var response = String.fromCharCodes(res);

      print(response);

      if (response != null) {
        var jsonData = jsonDecode(response);

        _doctorRepo.patientFiles.insert(0, PatientFileModel.fromJson(jsonData));

        Get.snackbar(
          'Message',
          'Patient file added successfully',
          colorText: Colors.black,
          backgroundColor: Colors.blue.withOpacity(0.2),
        );

        showModal.value = false;
        print('uploaded patient file');
      }
    } catch (e) {
      print(e);
    }
  }

  Future addNewDiagnosis(Map data) async {
    try {
      var response = await http.post(
        Uri.parse("${backendRequestUrl2}doctor/diagnosis/"),
        headers: {"authorization": "Bearer ${tokenStorage.read("token")}"},
        body: data,
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        _doctorRepo.newDiagnosis.clear();

        _doctorRepo.patientDiagnosis
            .insert(0, PatientDiagnosisModel.fromJson(jsonData));

        _doctorRepo.newDiagnosis.add(PatientDiagnosisModel.fromJson(jsonData));

        Get.snackbar(
          'Message',
          'New diagnosis added successfully',
          colorText: Colors.black,
          backgroundColor: Colors.blue.withOpacity(0.2),
        );

        print('created diagnosis');
      }
    } catch (e) {
      print(e);
    }
  }

  Future getWardBedSpaces() async {
    try {
      var response = await http.get(
        Uri.parse("${backendRequestUrl2}doctor/bedspaces/"),
        headers: {"authorization": "Bearer ${tokenStorage.read("token")}"},
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        _doctorRepo.wardBedSpaces.clear();

        for (var item in jsonData) {
          _doctorRepo.wardBedSpaces.add(DoctorBedSpaceModel.fromJson(item));
        }

        print('fetched ward bedspaces');
      }
    } catch (e) {
      print(e);
    }
  }

  Future getAppointments() async {
    try {
      var response = await http.get(
        Uri.parse("${backendRequestUrl2}doctor/appointments_records/"),
        headers: {"authorization": "Bearer ${tokenStorage.read("token")}"},
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        _doctorRepo.appointments.clear();

        for (var item in jsonData) {
          _doctorRepo.appointments.add(DoctorAppointmentModel.fromJson(item));
        }

        print('fetched doctor appointments');
      }
    } catch (e) {
      print(e);
    }
  }
}
