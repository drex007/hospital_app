import 'package:doctor/Services/profile_controller/profile_controller.dart';
import 'package:doctor/constants/asset_path.dart';
import 'package:doctor/ui/Dashboard/doctorsDashboard/doctorsProfile.dart';
import 'package:doctor/ui/Dashboard/nurseDashboard/nurse_home.dart';
import 'package:doctor/ui/Dashboard/nurseDashboard/nurse_profile.dart';
import 'package:doctor/ui/Dashboard/nurseDashboard/nurses_Opd.dart';
import 'package:doctor/ui/Dashboard/nurseDashboard/nurses_ward.dart';
import 'package:doctor/widgets/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_storage/get_storage.dart';
import '../../../utils/responsive.dart';
import 'package:get/get.dart';

class NursesDashboard extends StatefulWidget {
  const NursesDashboard({Key? key}) : super(key: key);

  @override
  State<NursesDashboard> createState() => _NursesDashboardState();
}

class _NursesDashboardState extends State<NursesDashboard> {
  ProfileController _profile = Get.find();
  final boxStorage = GetStorage();
  var _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _profile.getUserProfile();
  }

  Widget build(BuildContext context) {
    List pages = [
      NursesHome(),
      NursesOpd(),
      NursesWard(),
      DoctorsProfile()
      //  NursesProfile()
    ];

    return Scaffold(
      body: pages[_currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (int value) {
            setState(() {
              _currentPageIndex = value;
            });
          },
          currentIndex: _currentPageIndex,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.black,
          elevation: 10.0,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          selectedIconTheme: IconThemeData(color: Colors.blueAccent),
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  // color: Colors.black,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.local_hospital,
                  // color: Colors.black,
                ),
                label: "Opd"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.bedroom_child,
                  // color: Colors.black,
                ),
                label: "Ward"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  // color: Colors.black,
                ),
                label: "Profile"),
          ]),
    );
  }
}
