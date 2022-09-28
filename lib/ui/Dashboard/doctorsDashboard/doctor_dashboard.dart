import 'package:doctor/Services/doctorController/doctor_services.dart';
import 'package:doctor/Services/profile_controller/profile_controller.dart';
import 'package:doctor/constants/color_constant.dart';
import 'package:doctor/model/profileModel.dart';
import 'package:doctor/ui/Dashboard/doctorsDashboard/doctor_Diagnosis.dart';
import 'package:doctor/ui/Dashboard/doctorsDashboard/doctorsProfile.dart';
import 'package:doctor/ui/Dashboard/doctorsDashboard/doctors_call.dart';
import 'package:doctor/ui/Dashboard/doctorsDashboard/doctors_home.dart';
import 'package:doctor/ui/Dashboard/doctorsDashboard/doctors_ward.dart';
import 'package:doctor/widgets/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class DoctorsDashboard extends StatefulWidget {
  const DoctorsDashboard({Key? key}) : super(key: key);

  @override
  State<DoctorsDashboard> createState() => _DoctorsDashboardState();
}

class _DoctorsDashboardState extends State<DoctorsDashboard> {
  final boxStorage = GetStorage();
  var _currentPageIndex = 0;

  ProfileController _profile = Get.find();
  DoctorServices _doctorController = Get.find();

  @override
  void initState() {
    super.initState();
    _profile.getUserProfile();
  }

  Widget build(BuildContext context) {
    _doctorController.getDrugs();
    _doctorController.getDoctorPatients();
    _doctorController.getDoctorOtherPatients();

    List pages = [
      DoctorsHome(),
      DoctorsDiagnosis(),
      DoctorsWard(),
      // DoctorsCall(),
      DoctorsProfile(),
    ];

    return Scaffold(
      body: pages[_currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (int value) {
            setState(() {
              _currentPageIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentPageIndex,
          selectedItemColor: customblue,
          unselectedItemColor: Colors.grey.shade400,
          elevation: 10.0,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.medical_services),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bedroom_child),
              label: "",
            ),
            // BottomNavigationBarItem(icon: Icon(Icons.call), label: "Call"),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "",
            ),
          ]),
    );
  }
}
