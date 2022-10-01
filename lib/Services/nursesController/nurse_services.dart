import 'dart:convert';
import 'package:doctor/constants/url_paths.dart';
import 'package:doctor/model/bedSpace_Model.dart';
import 'package:doctor/model/opdListModel.dart';
import 'package:doctor/model/patientDiagnosis.dart';
import 'package:doctor/model/patientPerformanceData.dart';
import 'package:doctor/model/patientdiagnosisPrescriptionModel.dart';
import 'package:doctor/model/wardModel.dart';
import 'package:doctor/repository/nurse_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class NurseServices extends GetxController {
  NursesRepository _nurseRepo = Get.find();
  final tokenStorage = GetStorage();
  var showModal = true.obs;
  RxBool _showAdministerDrugModal = true.obs;
  RxBool get showAdministerDrugModal => _showAdministerDrugModal;

  Future getWardList() async {
    final wardUrl = Uri.parse("${backendRequestUrl}administrator/ward_list/");
    try {
      var response = await http.get(wardUrl,
          headers: {"authorization": "Bearer ${tokenStorage.read("token")}"});
      var jsonData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        _nurseRepo.wardList.clear();

        for (var item in jsonData) {
          _nurseRepo.wardList.add(WardModel.fromJson(item));
        }
      }

      if (response.statusCode == 401) {
        var response = await http.post(
          Uri.parse('${backendRequestUrl}auth/jwt/refresh/'),
          headers: {"authorization": "Bearer ${tokenStorage.read("token")}"},
          body: {"refresh": tokenStorage.read('refresh')},
        );

        if (response.statusCode == 200) {
          var jsonData = jsonDecode(response.body);
          tokenStorage.write('access', jsonData['access']);

          var response2 = await http.get(
            wardUrl,
            headers: {"authorization": "Bearer ${jsonData['access']}"},
          );

          var jsonData2 = jsonDecode(response2.body);
          debugPrint("${jsonData2} :: ward res");

          _nurseRepo.wardList.clear();
          if (response2.statusCode == 200) {
            for (var item in jsonData2) {
              _nurseRepo.wardList.add(WardModel.fromJson(item));
            }
          }
        }
      }

      return _nurseRepo.wardList;
    } catch (e) {}
  }

  getWardBespaces(String wardName) async {
    final wardBedSpacesUrl =
        Uri.parse("${backendRequestUrl}administrator/bed_space/${wardName}/");
    try {
      var response = await http.get(wardBedSpacesUrl,
          headers: {"authorization": "Bearer ${tokenStorage.read("token")}"});
      var jsonData = jsonDecode(response.body);

      _nurseRepo.bedSpaceList.clear();

      if (response.statusCode == 200) {
        for (var item in jsonData) {
          _nurseRepo.bedSpaceList.add(BedSpaceModel.fromJson(item));
        }
      }

      if (response.statusCode == 401) {
        var response = await http.post(
          Uri.parse('${backendRequestUrl}auth/jwt/refresh/'),
          headers: {"authorization": "Bearer ${tokenStorage.read("token")}"},
          body: {"refresh": tokenStorage.read('refresh')},
        );

        if (response.statusCode == 200) {
          var jsonData = jsonDecode(response.body);
          tokenStorage.write('access', jsonData['access']);

          var response2 = await http.get(
            wardBedSpacesUrl,
            headers: {"authorization": "Bearer ${jsonData['access']}"},
          );
          var jsonData2 = jsonDecode(response2.body);
          _nurseRepo.bedSpaceList.clear();
          for (var item in jsonData2) {
            _nurseRepo.bedSpaceList.add(BedSpaceModel.fromJson(item));
          }
        }
      }

      _nurseRepo.bedSpaceList.refresh();
    } catch (e) {}
  }

  getWardReport(String id) async {
    final wardBedSpacesUrl =
        Uri.parse("${backendRequestUrl}records/add_ward_reports/${id}/");

    try {
      var response = await http.get(wardBedSpacesUrl,
          headers: {"authorization": "Bearer ${tokenStorage.read("token")}"});
      var jsonData = jsonDecode(response.body);

      _nurseRepo.WardReport.clear();
      if (response.statusCode == 200) {
        for (var item in jsonData) {
          _nurseRepo.WardReport.add(WardModel.fromJson(item));
        }
      }

      if (response.statusCode == 401) {
        var response = await http.post(
          Uri.parse('${backendRequestUrl}auth/jwt/refresh/'),
          headers: {"authorization": "Bearer ${tokenStorage.read("token")}"},
          body: {"refresh": tokenStorage.read('refresh')},
        );

        if (response.statusCode == 200) {
          var jsonData = jsonDecode(response.body);
          tokenStorage.write('access', jsonData['access']);

          var response2 = await http.get(
            wardBedSpacesUrl,
            headers: {"authorization": "Bearer ${jsonData['access']}"},
          );
          var jsonData2 = jsonDecode(response2.body);
          _nurseRepo.WardReport.clear();
          for (var item in jsonData2) {
            _nurseRepo.WardReport.add(WardModel.fromJson(item));
          }
        }
      }
      _nurseRepo.WardReport.refresh();
    } catch (e) {}
  }

  Future opdPatients() async {
    final opdUrl =
        Uri.parse("${backendRequestUrl}nurse/see_injection_request/");

    try {
      var response = await http.get(opdUrl,
          headers: {"authorization": "Bearer ${tokenStorage.read("token")}"});
      var jsonData = jsonDecode(response.body);
      // print("${jsonData}");

      _nurseRepo.opdList.clear();
      if (response.statusCode == 200) {
        // print("printed");
        for (var item in jsonData) {
          _nurseRepo.opdList.add(OpdModel.fromJson(item));
        }
      }

      if (response.statusCode == 401) {
        var response = await http.post(
          Uri.parse('${backendRequestUrl}auth/jwt/refresh/'),
          headers: {"authorization": "Bearer ${tokenStorage.read("token")}"},
          body: {"refresh": tokenStorage.read('refresh')},
        );

        if (response.statusCode == 200) {
          var jsonData = jsonDecode(response.body);
          tokenStorage.write('access', jsonData['access']);

          var response2 = await http.get(
            opdUrl,
            headers: {"authorization": "Bearer ${jsonData['access']}"},
          );
          var jsonData2 = jsonDecode(response2.body);
          _nurseRepo.opdList.clear();
          for (var item in jsonData2) {
            _nurseRepo.opdList.add(OpdModel.fromJson(item));
          }
        }
      }
    } catch (e) {}
  }

//Opds
  void getInjectionsRequest(int pkid) async {
    final injectionRequestUrl =
        Uri.parse("${backendRequestUrl}nurse/get_patient_diagnosis/${pkid}/");

    try {
      var response = await http.get(injectionRequestUrl,
          headers: {"authorization": "Bearer ${tokenStorage.read("token")}"});
      var jsonData = jsonDecode(response.body);

      _nurseRepo.patientDiagnosisList.clear();
      if (response.statusCode == 200) {
        for (var item in jsonData) {
          _nurseRepo.patientDiagnosisList
              .add(PatientDiagnosisModel.fromJson(item));
        }
      }

      if (response.statusCode == 401) {
        var response = await http.post(
          Uri.parse('${backendRequestUrl}auth/jwt/refresh/'),
          headers: {"authorization": "Bearer ${tokenStorage.read("token")}"},
          body: {"refresh": tokenStorage.read('refresh')},
        );

        if (response.statusCode == 200) {
          var jsonData = jsonDecode(response.body);
          tokenStorage.write('access', jsonData['access']);

          var response2 = await http.get(
            injectionRequestUrl,
            headers: {"authorization": "Bearer ${jsonData['access']}"},
          );
          var jsonData2 = jsonDecode(response2.body);
          _nurseRepo.patientDiagnosisList.clear();
          for (var item in jsonData2) {
            _nurseRepo.patientDiagnosisList
                .add(PatientDiagnosisModel.fromJson(item));
          }
        }
      }
      _nurseRepo.patientDiagnosisList.refresh();
    } catch (e) {}
  }

  void getpatientPerformaceData(String id) async {
    final injectionRequestUrl =
        Uri.parse("${backendRequestUrl}nurse/patient_performance/${id}/");
    try {
      var response = await http.get(injectionRequestUrl,
          headers: {"authorization": "Bearer ${tokenStorage.read("token")}"});
      var jsonData = jsonDecode(response.body);

      _nurseRepo.patientPerformanceData.clear();

      if (response.statusCode == 200) {
        for (var item in jsonData) {
          _nurseRepo.patientPerformanceData
              .add(PatientPerformanceData.fromJson(item));
        }
      }
      //Check for expired token
      if (response.statusCode == 401) {
        var response = await http.post(
          Uri.parse('${backendRequestUrl}auth/jwt/refresh/'),
          headers: {"authorization": "Bearer ${tokenStorage.read("token")}"},
          body: {"refresh": tokenStorage.read('refresh')},
        );

        if (response.statusCode == 200) {
          var jsonData = jsonDecode(response.body);
          tokenStorage.write('access', jsonData['access']);

          var response2 = await http.get(
            injectionRequestUrl,
            headers: {"authorization": "Bearer ${jsonData['access']}"},
          );
          var jsonData2 = jsonDecode(response2.body);
          _nurseRepo.patientPerformanceData.clear();
          for (var item in jsonData2) {
            _nurseRepo.patientPerformanceData
                .add(PatientPerformanceData.fromJson(item));
          }
        }
      }

      _nurseRepo.patientPerformanceData.refresh();
    } catch (e) {}
  }

  Future addPerformanceData(Map data, String id) async {
    final addPerformanceDataUrl =
        Uri.parse("${backendRequestUrl}nurse/patient_performance/${id}/");
    try {
      var response = await http.post(addPerformanceDataUrl,
          body: data,
          headers: {"authorization": "Bearer ${tokenStorage.read("token")}"});
      var jsonData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        showModal.value = false;
        _nurseRepo.patientPerformanceData
            .insert(0, PatientPerformanceData.fromJson(jsonData));
        _nurseRepo.patientPerformanceData.refresh();

        Get.snackbar("Success", "Data added successfully",
            backgroundColor: Colors.blueAccent.withOpacity(0.3));
      }
      // Check for expire token
      if (response.statusCode == 401) {
        var response = await http.post(
          Uri.parse('${backendRequestUrl}auth/jwt/refresh/'),
          headers: {"authorization": "Bearer ${tokenStorage.read("token")}"},
          body: {"refresh": tokenStorage.read('refresh')},
        );

        if (response.statusCode == 200) {
          var jsonData = jsonDecode(response.body);
          tokenStorage.write('access', jsonData['access']);

          var response2 = await http.post(
            addPerformanceDataUrl,
            body: data,
            headers: {"authorization": "Bearer ${jsonData['access']}"},
          );
          var jsonData2 = jsonDecode(response2.body);
          _nurseRepo.patientPerformanceData
              .insert(0, PatientPerformanceData.fromJson(jsonData2));
          _nurseRepo.patientPerformanceData.refresh();

          Get.snackbar("Success", "Data added successfully",
              backgroundColor: Colors.blueAccent.withOpacity(0.3));
        }
      }
    } catch (e) {
      Get.snackbar("Error Message", "Error occured while adding data",
          backgroundColor: Colors.orange.withOpacity(0.3));
    }
  }

  getDiagnosisPrescriptions(String id) async {
    final diagnosisPrescriptionUrl = Uri.parse(
        "${backendRequestUrl}nurse/get_patient_diagnosis_prescriptions/${id}/");

    try {
      var response = await http.get(diagnosisPrescriptionUrl,
          headers: {"authorization": "Bearer ${tokenStorage.read("token")}"});
      var jsonData = jsonDecode(response.body);

      _nurseRepo.patientDiagnosisPrescription.clear();
      if (response.statusCode == 200) {
        for (var item in jsonData) {
          _nurseRepo.patientDiagnosisPrescription
              .add(DiagnosisPrescriptionModel.fromJson(item));
        }
      }
      if (response.statusCode == 401) {
        var response = await http.post(
          Uri.parse('${backendRequestUrl}auth/jwt/refresh/'),
          headers: {"authorization": "Bearer ${tokenStorage.read("token")}"},
          body: {"refresh": tokenStorage.read('refresh')},
        );

        if (response.statusCode == 200) {
          var jsonData = jsonDecode(response.body);
          tokenStorage.write('access', jsonData['access']);

          var response2 = await http.get(
            diagnosisPrescriptionUrl,
            headers: {"authorization": "Bearer ${jsonData['access']}"},
          );
          var jsonData2 = jsonDecode(response2.body);
          _nurseRepo.patientDiagnosisPrescription.clear();
          for (var item in jsonData2) {
            _nurseRepo.patientDiagnosisPrescription
                .add(DiagnosisPrescriptionModel.fromJson(item));
          }
        }
      }

      _nurseRepo.patientDiagnosisPrescription.refresh();
    } catch (e) {}
  }

  administerOpd(
    String id,
  ) async {
    final diagnosisPrescriptionUrl =
        Uri.parse("${backendRequestUrl}nurse/see_injection_request/${id}/");

    try {
      var response = await http.put(diagnosisPrescriptionUrl,
          body: {},
          headers: {"authorization": "Bearer ${tokenStorage.read("token")}"});
      if (response.statusCode == 200) {
        showAdministerDrugModal.value = false;
        Get.snackbar("Succcess", "Injection has been successfully Administered",
            backgroundColor: Colors.blueAccent.withOpacity(0.3));
      }

      if (response.statusCode == 401) {
        var response = await http.post(
          Uri.parse('${backendRequestUrl}auth/jwt/refresh/'),
          headers: {"authorization": "Bearer ${tokenStorage.read("token")}"},
          body: {"refresh": tokenStorage.read('refresh')},
        );

        if (response.statusCode == 200) {
          var jsonData = jsonDecode(response.body);
          tokenStorage.write('access', jsonData['access']);

          var response2 = await http.put(diagnosisPrescriptionUrl,
              headers: {"authorization": "Bearer ${jsonData['access']}"},
              body: {});
          if (response2.statusCode == 200) {
            showAdministerDrugModal.value = false;
            Get.snackbar(
                "Succcess", "Injection has been successfully Administered",
                backgroundColor: Colors.blueAccent.withOpacity(0.3));
          }
        }
      }
    } catch (e) {
      Get.snackbar("Error Message", "Injection not administered",
          backgroundColor: Colors.orange.withOpacity(0.3));
    }
  }

  getWardBedspaceCount() {
    _nurseRepo.bedSpaceCount = 0;
    _nurseRepo.wardList.forEach((element) {
      _nurseRepo.bedSpaceCount += element.totalBedSpace;
    });
  }
}
