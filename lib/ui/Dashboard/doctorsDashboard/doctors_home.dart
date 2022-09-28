import 'package:doctor/Services/profile_controller/profile_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:doctor/utils/responsive.dart';
import 'package:doctor/repository/doctor_repository.dart';
import 'package:doctor/widgets/doctor/utils/patient_card.dart';
import 'package:doctor/widgets/doctor/utils/doctor_patientcard.dart';
import 'package:doctor/Services/doctorController/doctor_services.dart';

class DoctorsHome extends StatefulWidget {
  const DoctorsHome({Key? key}) : super(key: key);

  @override
  State<DoctorsHome> createState() => _DoctorsHomeState();
}

class _DoctorsHomeState extends State<DoctorsHome> {
  DoctorServices _doctorServices = Get.find();
  DoctorRepository _doctorRepository = Get.find();
  ProfileController _profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    _doctorServices.getAppointments();

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.25),
        child: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(40),
            ),
          ),
          backgroundColor: Colors.blue.withOpacity(0.6),
          shadowColor: Colors.white.withOpacity(0),
          flexibleSpace: Container(
            height: screenHeight * 0.25,
            width: screenWidth,
            padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
            decoration: BoxDecoration(
              // color: Colors.blue.withOpacity(0.6),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      'Doctor ${_profileController.userProfile.value.profile?.firstName ?? ''} ${_profileController.userProfile.value.profile?.lastName ?? ''}',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.0.hp),
                Container(
                  width: screenWidth * 0.7,
                  child: Text(
                    'Let\'s help you manage your patients.',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Obx(
          () => ListView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              Column(
                children: [
                  SizedBox(height: 2.0.hp),
                  Container(
                    width: screenWidth,
                    height: screenHeight * 0.18,
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.0.wp,
                      // vertical: 2.0.hp,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Categories',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 2.0.hp),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _doctorServices.showAppointments.value =
                                          true;
                                    });
                                  },
                                  child: Container(
                                    width:
                                        _doctorServices.showAppointments == true
                                            ? 75
                                            : 60,
                                    height:
                                        _doctorServices.showAppointments == true
                                            ? 75
                                            : 60,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.shade200,
                                          blurRadius: 1,
                                          spreadRadius: 1,
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Image.asset(
                                       'assets/icons/icon__award.png',
                                    ),
                                  ),
                                ),
                                SizedBox(height: 1.0.hp),
                                Text(
                                  'Appointments',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            // SizedBox(width: 10.0.hp),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _doctorServices.showAppointments.value =
                                          false;
                                    });
                                  },
                                  child: Container(
                                    width: _doctorServices.showAppointments ==
                                            false
                                        ? 75
                                        : 60,
                                    height: _doctorServices.showAppointments ==
                                            false
                                        ? 75
                                        : 60,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.shade200,
                                          blurRadius: 1,
                                          spreadRadius: 1,
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Image.asset(
                                      'assets/icons/icon__process.png',
                                    ),
                                  ),
                                ),
                                SizedBox(height: 1.0.hp),
                                Text(
                                  'Patients',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              _doctorServices.showAppointments == true
                  ? Container(
                      height: screenHeight * 0.55,
                      width: screenWidth,
                      color: Colors.white,
                      padding: EdgeInsets.only(
                        left: 4.0.wp,
                        right: 4.0.wp,
                        bottom: 12.0.wp,
                        // vertical: 2.0.hp,
                      ),
                      child: ListView.builder(
                        itemCount: _doctorRepository.appointments.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: ScrollPhysics(),
                        itemBuilder: (_, index) {
                          return PatientCard(
                            data: _doctorRepository.appointments[index],
                          );
                        },
                      ),
                    )
                  : Container(
                      height: screenHeight * 0.55,
                      width: screenWidth,
                      color: Colors.white,
                      padding: EdgeInsets.only(
                        left: 4.0.wp,
                        right: 4.0.wp,
                        bottom: 12.0.wp,
                        // vertical: 2.0.hp,
                      ),
                      child: ListView.builder(
                        itemCount: _doctorRepository.doctorPatients.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: ScrollPhysics(),
                        itemBuilder: (_, index) {
                          return DoctorPatientCard(
                            patient: _doctorRepository.doctorPatients[index],
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
