import 'dart:convert';

import 'package:doctor/model/employee_model.dart';
import 'package:doctor/repository/generic_repo.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:doctor/constants/url_paths.dart';

class GenericApiServices extends GetxController {
  final tokenStorage = GetStorage();
  GenericRepository _genericRepository = Get.find();
  var showModal = true.obs;

  Future fetchEmployees() async {
    final employeesUrl = Uri.parse("${backendRequestUrl}user/employees/");
    try {
      var response = await http.get(employeesUrl,
          headers: {"authorization": "Bearer ${tokenStorage.read("token")}"});
      var jsonData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        _genericRepository.employeesList.clear();

        for (var item in jsonData) {
          _genericRepository.employeesList.add(EmployeeModel.fromJson(item));
        }
      }
    } catch (e) {}
  }
}
