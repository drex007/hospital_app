import 'dart:io';

import 'package:doctor/Services/authController/login_controller.dart';
import 'package:doctor/Services/profile_controller/profile_controller.dart';
import 'package:doctor/Services/socket_service.dart';
import 'package:doctor/constants/asset_path.dart';
import 'package:doctor/constants/url_paths.dart';
import 'package:doctor/model/profileModel.dart';
import 'package:doctor/widgets/LineWidget.dart';
import 'package:doctor/widgets/customBoldTextWidget.dart';
import 'package:doctor/widgets/customIconInputTextWidget.dart';
import 'package:doctor/widgets/customSemiBoldTextWidget.dart';
import 'package:doctor/widgets/customTitledInputWidget.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../../../utils/responsive.dart';
import '../../../constants/color_constant.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DoctorsProfile extends StatefulWidget {
  const DoctorsProfile({Key? key}) : super(key: key);

  @override
  State<DoctorsProfile> createState() => _DoctorsProfileState();
}

class _DoctorsProfileState extends State<DoctorsProfile> {
  ProfileController _profileController = Get.find();
  final ImagePicker _picker = ImagePicker();
  File? _profileImage;

  @override
  void initState() {
    _profileController.getUserProfile();
    super.initState();
  }

  Widget build(BuildContext context) {
    List<String> url = backendUrl.split(" ");
    var newUrl = url.removeLast();
    var assetUrl = url.join();

    final authStorage = GetStorage();
    AuthController authController = Get.find();
    SocketServices _socketServices = Get.find();
    LoginRedirectController _redirectUser = Get.find();

    void logout() {
      authStorage.erase();
      _redirectUser.userStatus.value = "";
      _socketServices.socket.disconnect();
      Get.offAllNamed("/login");
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SizedBox(
            height: 5.0.hp,
          ),
          Stack(
            children: [
              Container(
                  height: 30.0.hp,
                  width: 50.0.wp,
                  margin: EdgeInsets.only(left: 24.0.wp),
                  // padding: EdgeInsets.all(20),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(40)),
                  child: _profileImage == null
                      ? CircleAvatar(
                          backgroundColor: Colors.grey,
                          backgroundImage: NetworkImage(
                            "${assetUrl}${_profileController.userProfile.value.profile?.profilePhoto}",
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              _profileImage = null;
                            });
                          },
                          child: CircleAvatar(
                            backgroundImage: FileImage(_profileImage!),
                          ),
                        )),
              Container(
                  margin: EdgeInsets.only(top: 20.0.hp, left: 56.0.wp),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: customblue,
                  ),
                  child: _profileImage == null
                      ? IconButton(
                          onPressed: () async {
                            XFile? _pickedImage = await _picker.pickImage(
                                source: ImageSource.gallery);
                            setState(() {
                              if (_pickedImage != null) {
                                _profileImage = File(_pickedImage.path);
                                print(_profileImage!.path);
                              }
                            });
                          },
                          icon: Icon(Icons.edit),
                          color: Colors.white,
                        )
                      : IconButton(
                          onPressed: () async {
                            await _profileController.updateProfileImage(
                                {"profile_photo": _profileImage!.path});
                            await _profileController.getUserProfile();
                            setState(() {
                              _profileImage = null;
                              _profileController.getUserProfile();
                            });
                          },
                          icon: Icon(
                            Icons.upload_file,
                            color: Colors.white,
                          )))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customSemiBoldTextWidget(
                  text:
                      _profileController.userProfile.value.profile?.fullName ??
                          "",
                  textColor: Colors.black.withOpacity(0.6),
                  textSize: 25.0.sp)
            ],
          ),
          SizedBox(height: 2.0.hp),
          Container(
            width: 90.0.wp,
            height: 36.0.hp,
            margin: EdgeInsets.symmetric(horizontal: 5.0.wp),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: customWhiteBackground,
                boxShadow: [BoxShadow(spreadRadius: -1, blurRadius: 0.8)]),
            child: Column(
              children: [
                CustomIconInputWidget(
                    icon: Icon(
                      Icons.email,
                      color: Colors.grey,
                    ),
                    textTitle:
                        _profileController.userProfile.value.profile?.email ??
                            ""),
                LineWidget(),
                CustomIconInputWidget(
                    icon: Icon(
                      Icons.phone,
                      color: Colors.grey,
                    ),
                    textTitle: _profileController
                            .userProfile.value.profile?.patientPhone ??
                        ""),
                LineWidget(),
                CustomIconInputWidget(
                    icon: Icon(
                      Icons.calendar_month,
                      color: Colors.grey,
                    ),
                    textTitle: _profileController
                            .userProfile.value.profile?.dateOfBirth ??
                        ""),
                LineWidget(),
                CustomIconInputWidget(
                    icon: Icon(
                      Icons.location_on,
                      color: Colors.grey,
                    ),
                    textTitle:
                        _profileController.userProfile.value.profile?.address ??
                            "")
              ],
            ),
          ),
          SizedBox(height: 4.0.hp),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
            child: ConstrainedBox(
              constraints:
                  BoxConstraints.tightFor(width: 100.0.wp, height: 6.0.hp),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(customblue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ))),
                onPressed: logout,
                child: Text(
                  "Log out",
                  style: TextStyle(fontFamily: "Poppins", fontSize: 20.0.sp),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
