import 'package:doctor/Services/nursesController/nurse_services.dart';
import 'package:doctor/Services/profile_controller/profile_controller.dart';
import 'package:doctor/Services/socket_service.dart';
import 'package:doctor/constants/asset_path.dart';
import 'package:doctor/constants/color_constant.dart';
import 'package:doctor/constants/url_paths.dart';
import 'package:doctor/repository/nurse_repo.dart';
import 'package:doctor/widgets/customSemiBoldTextWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:doctor/utils/responsive.dart';

class NursesHome extends StatefulWidget {
  const NursesHome({Key? key}) : super(key: key);

  @override
  State<NursesHome> createState() => _NursesHomeState();
}

class _NursesHomeState extends State<NursesHome> {
  ProfileController _profile = Get.find();
  NurseServices _nurseServices = Get.find();
  SocketServices _socketServices = Get.find();
  NursesRepository _nursesRepository = Get.find();
  List homeImages = [injection, ward, bed, inpatient];
  List imageTitles = ["Opd Count", "Ward Count", "Bed spaces", "Inpatients"];

  @override
  void initState() {
    setState(() {
      _profile.getUserProfile();
      _nurseServices.opdPatients();
      _nurseServices.getWardList();
      _nurseServices.getWardBedspaceCount();
      _socketServices.initializeSocket();
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    List<String> url = backendUrl.split("");
    var newUrl = url.removeLast();
    var assetUrl = url.join();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.0.hp),
        child: AppBar(
          backgroundColor: customblue,
          elevation: 0,
        ),
      ),
      backgroundColor: customWhiteBackground,
      body: Obx(() => ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: customblue,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 0.5,
                      spreadRadius: -1,
                    )
                  ],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      height: 40,
                      width: 40,
                      child: _profile.userProfile.value.profile == null
                          ? Text("")
                          : CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "${_profile.userProfile.value.profile?.profilePhoto}"),
                            ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 15, top: 35),
                      child: _profile.userProfile.value.profile == null
                          ? Text("")
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${_profile.userProfile.value.profile?.fullName}",
                                  style: TextStyle(
                                      fontSize: 15.0.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "Nurse",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0.sp,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: customSemiBoldTextWidget(
                    text: "Patients",
                    textColor: Colors.black,
                    textSize: 10.0.sp),
              ),
              Container(
                height: 60.0.hp,
                child: ListView.builder(
                    itemCount: _nursesRepository.opdList.length,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (_, index) {
                      return Container(
                        width: 90.0.wp,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.symmetric(
                            vertical: 2, horizontal: 2.0.wp),
                        height: 10.0.hp,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "${assetUrl}${_nursesRepository.opdList.value[index].patientPrescribed.profilePhoto}")),
                              SizedBox(
                                width: 3.0.wp,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 3.0.hp),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "${_nursesRepository.opdList.value[index].diagnosis.diagnosedPatient.firstName} ${_nursesRepository.opdList.value[index].diagnosis.diagnosedPatient.lastName}"),
                                    Text(
                                        "${_nursesRepository.opdList.value[index].patientPrescribed.gender}"),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 2.0.wp, vertical: 2.0.hp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HomeCards(
                        imagePath: homeImages[0],
                        text: "Opds",
                        textCount: _nursesRepository.opdList.length.toString(),
                      ),
                      HomeCards(
                        imagePath: homeImages[2],
                        text: "Wards",
                        textCount: _nursesRepository.wardList.length.toString(),
                      ),
                      HomeCards(
                        imagePath: homeImages[3],
                        text: "Bed spaces",
                        textCount: _nursesRepository.bedSpaceCount >= 1000
                            ? "${(_nursesRepository.bedSpaceCount / 1000).toString()}k"
                            : _nursesRepository.bedSpaceCount.toString(),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class HomeCards extends StatelessWidget {
  const HomeCards(
      {Key? key,
      required this.imagePath,
      required this.text,
      required this.textCount})
      : super(key: key);

  final String imagePath;
  final String text;
  final String textCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.0.hp,
      width: 30.0.wp,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.lightBlue),
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [BoxShadow(blurRadius: 0.5, spreadRadius: -1)]),
      child: Column(
        children: [
          Container(
            height: 5.0.hp,
            margin: EdgeInsets.only(top: 10),
            width: 100.0.wp,
            child: Image.asset(
              imagePath,
              scale: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: TextStyle(fontSize: 10.0.sp),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey),
                  child: Center(
                      child: Text(
                    textCount,
                    style: TextStyle(fontSize: 8.0.sp),
                  )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
