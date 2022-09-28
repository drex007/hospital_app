import 'package:doctor/model/patient_diagnosis_model.dart';
import 'package:get/get.dart';
import 'package:doctor/constants/color_constant.dart';
import 'package:doctor/widgets/doctor/DiagnosisTitleDescriptionPage.dart';
import 'package:doctor/widgets/doctor/PatientFilesPage.dart';
import 'package:doctor/widgets/doctor/PatientLabTestsPage.dart';
import 'package:doctor/widgets/doctor/PatientPresctionsPage.dart';
import 'package:doctor/widgets/doctor/PatientRadiologyTestsPage.dart';
import 'package:flutter/material.dart';
import 'package:doctor/utils/responsive.dart';

class PatientDiagnosisDetail extends StatefulWidget {
  final PatientDiagnosisModel diagnosisData;

  const PatientDiagnosisDetail({
    Key? key,
    required this.diagnosisData,
  }) : super(key: key);

  @override
  State<PatientDiagnosisDetail> createState() => _PatientDiagnosisDetailState();
}

class _PatientDiagnosisDetailState extends State<PatientDiagnosisDetail>
    with TickerProviderStateMixin {
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
                DiagnosisTitleDescriptionPage(data: widget.diagnosisData),
                PatientPrescriptionsPage(data: widget.diagnosisData),
                PatientLabTestsPage(data: widget.diagnosisData),
                PatientRadiologyTestsPage(data: widget.diagnosisData),
                PatientFilesPage(data: widget.diagnosisData),
              ],
            ),
          )
        ],
      ),
    );
  }
}
