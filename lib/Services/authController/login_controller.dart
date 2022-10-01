// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:async';
import 'dart:convert';
import 'package:doctor/Services/nursesController/nurse_services.dart';
import 'package:doctor/Services/socket_service.dart';
import 'package:doctor/ui/Dashboard/doctorsDashboard/doctor_dashboard.dart';
import 'package:doctor/ui/Dashboard/nurseDashboard/nurses_dashboard.dart';
import 'package:doctor/ui/LoginPage/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../constants/url_paths.dart';

class AuthController extends GetxController {
  LoginRedirectController _redirectUser = Get.find();
  // SocketServices _socketServices = Get.find();
  RxString loginState = "start".obs;
  final auth_storage = GetStorage();

  final loginUrl = Uri.parse("${backendUrl}api/v1/user/login/");

  Future login(String email, String password) async {
    try {
      loginState.value = "Loading";
      var response = await http
          .post(loginUrl, body: {"email": email, "password": password});
      var response_body = json.decode(response.body);
      var token = response_body["access"];
      auth_storage.write("token", token);
      auth_storage.write("refresh", response_body['refresh']);

      if (response_body["data"]["is_doctor"] == true) {
        _redirectUser.userStatus.value = "doctor";
        auth_storage.write("usersRole", "doctor");
        Get.offAllNamed("/doctorsDashboard");
      } else if (response_body["data"]["is_nurse"] == true) {
        Get.offAllNamed("/nursesDashboard");
        auth_storage.write("usersRole", "nurse");
      } else {
        auth_storage.write("usersRole", "");
        LoginPage();
      }
      // print(response_body);
      Get.snackbar("Login Mesage", "Login successful",
          backgroundColor: Colors.blue.withOpacity(0.3));
      return response;
    } catch (e) {
      // print(e);
      // loginState.value = "start";
      Get.snackbar("An Error occurred",
          "Please check your email and password and try again later",
          backgroundColor: Colors.orange.withOpacity(0.3));
    }
  }

  void logout() {
    auth_storage.erase();
    _redirectUser.userStatus.value = "";
    // _socketServices.socket.destroy();
    Get.offAllNamed("/login");
  }
}

class LoginRedirectController extends GetxController {
  RxString userStatus = "".obs;
}
