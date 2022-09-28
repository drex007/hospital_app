import 'package:doctor/Services/profile_controller/profile_controller.dart';
import 'package:doctor/constants/color_constant.dart';
import 'package:doctor/widgets/doctor/DoctorOtherPatient.dart';
import 'package:doctor/widgets/doctor/DoctorsPatients.dart';
import 'package:flutter/material.dart';
import 'package:doctor/utils/responsive.dart';
import 'package:get/get.dart';

class DoctorsDiagnosis extends StatefulWidget {
  const DoctorsDiagnosis({Key? key}) : super(key: key);

  @override
  State<DoctorsDiagnosis> createState() => _DoctorsDiagnosisState();
}

class _DoctorsDiagnosisState extends State<DoctorsDiagnosis>
    with TickerProviderStateMixin {
  ProfileController _profile = Get.find();

  @override
  Widget build(BuildContext context) {
    _profile.getUserProfile();

    TabController _tabController = TabController(length: 2, vsync: this);

    return Scaffold(
      backgroundColor: customWhiteBackground,
      body: ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: [
          SizedBox(height: 2.0.hp),
          Center(
            child: TabBar(
              unselectedLabelStyle: TextStyle(
                color: customblue,
              ),
              isScrollable: true,
              indicatorPadding: EdgeInsets.symmetric(
                horizontal: 2.0.wp,
              ),
              unselectedLabelColor: Colors.black,
              labelPadding: EdgeInsets.symmetric(
                horizontal: 12.0.wp,
                vertical: 10,
              ),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: customblue,
              ),
              controller: _tabController,
              tabs: [
                Text(
                  "Patients",
                  style: TextStyle(fontSize: 14.0.sp),
                ),
                Text(
                  "Other patients",
                  style: TextStyle(fontSize: 14.0.sp),
                ),
              ],
            ),
          ),
          // Text("${_profile.userProfile.value.profile?.firstName}"),
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            width: 100.0.wp,
            child: TabBarView(
              controller: _tabController,
              children: [
                DoctorsPatients(),
                DoctorsOtherPatients(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
