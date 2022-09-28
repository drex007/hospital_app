import 'package:doctor/model/doctor_patient_model.dart';
import 'package:doctor/model/patient_diagnosis_model.dart';
import 'package:doctor/repository/doctor_repository.dart';
import 'package:doctor/widgets/doctor/NewDiagnosisTitleDescriptionPage.dart';
import 'package:doctor/widgets/doctor/NewPatientFilesPage.dart';
import 'package:doctor/widgets/doctor/NewPatientLabTestsPage.dart';
import 'package:doctor/widgets/doctor/NewPatientPresctionsPage.dart';
import 'package:doctor/widgets/doctor/NewPatientRadiologyTestsPage.dart';
import 'package:get/get.dart';
import 'package:doctor/constants/color_constant.dart';
import 'package:doctor/widgets/doctor/DiagnosisTitleDescriptionPage.dart';
import 'package:doctor/widgets/doctor/PatientFilesPage.dart';
import 'package:doctor/widgets/doctor/PatientLabTestsPage.dart';
import 'package:doctor/widgets/doctor/PatientPresctionsPage.dart';
import 'package:doctor/widgets/doctor/PatientRadiologyTestsPage.dart';
import 'package:flutter/material.dart';
import 'package:doctor/utils/responsive.dart';

class NewDiagnosisPage extends StatefulWidget {
  final DoctorPatientsModel patientData;

  const NewDiagnosisPage({
    Key? key,
    required this.patientData,
  }) : super(key: key);

  @override
  State<NewDiagnosisPage> createState() => _NewDiagnosisPageState();
}

class _NewDiagnosisPageState extends State<NewDiagnosisPage>
    with TickerProviderStateMixin {
  DoctorRepository _doctorRepository = Get.find();

  @override
  Widget build(BuildContext context) {
    
    TabController _tabController = TabController(length: 5, vsync: this);

    return Scaffold(
      backgroundColor: customWhiteBackground,
      body: ListView(
        children: [
          SizedBox(
            height: 1.0.hp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TabBar(
                unselectedLabelStyle: TextStyle(
                  color: customblue,
                ),
                isScrollable: true,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 4),
                unselectedLabelColor: Colors.black,
                labelPadding:
                    EdgeInsets.symmetric(horizontal: 2.0.wp, vertical: 5),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(25), // Creates border
                  color: customblue,
                ),
                controller: _tabController,
                tabs: [
                  Text("Diagnosis"),
                  Text("Prescriptions"),
                  Text("Lab Tests"),
                  Text("Radio Tests"),
                  Text("Patient Files"),
                ],
              ),
            ],
          ),
          Container(
            width: 100.0.wp,
            height: 100.0.hp,
            child: TabBarView(
              controller: _tabController,
              children: [
                NewDiagnosisTitleDescriptionPage(
                  patientData: widget.patientData,
                ),
                NewPatientPrescriptionsPage(),
                NewPatientLabTestsPage(),
                NewPatientRadiologyTestsPage(),
                NewPatientFilesPage()
              ],
            ),
          )
        ],
      ),
    );
  }
}
