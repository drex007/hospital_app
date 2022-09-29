import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:doctor/model/profileModel.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import '../../constants/url_paths.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ProfileController extends GetxController {
  var userProfile = ProfileModel.fromJson({
    "pkid": 0,
    "firstName": "",
    "lastName": "",
    "profilePhoto": "",
    "fullName": "",
    "email": "",
    "address": "",
    "patientPhone": "",
    "dateOfBirth": "",
    "gender": ""
  }).obs;

  final tokenStorage = GetStorage();

  final getProfileUrl = Uri.parse("${backendUrl}api/v1/profile/me/");

  Future getUserProfile() async {
    try {
      var response = await http.get(getProfileUrl,
          headers: {"authorization": "Bearer ${tokenStorage.read("token")}"});
      var jsonData = jsonDecode(response.body);
      // print(jsonData);

      userProfile.value = ProfileModel.fromJson(jsonData);

      // print('testing::  ');
      // print("dataaaaaaaaa ${jsonData}");

    } catch (e) {
      // print(e);
    }
  }

  Future updateProfileImage(Map data) async {
    final updateProfilePhotoUrl =
        Uri.parse("${backendUrl}api/v1/profile/update/photo/");

    try {
      var request = new http.MultipartRequest('PATCH', updateProfilePhotoUrl);
      var image = await http.MultipartFile.fromPath(
          'profile_photo', data['profile_photo']);
      request.headers['authorization'] = "Bearer ${tokenStorage.read("token")}";
      request.files.add(image);

      var _data = await request.send();
      var res = await _data.stream.toBytes();
      var response = String.fromCharCodes(res);
      print(response);
      if (response != null) {
        var jsonData = jsonDecode(response);

        Get.snackbar(
          'Message',
          'Profile photo updated successfully',
          colorText: Colors.black,
          backgroundColor: Colors.blue.withOpacity(0.3),
        );
      }
    } catch (e) {}
  }
}
