import 'package:doctor/Services/doctorController/doctor_services.dart';
import 'package:doctor/constants/color_constant.dart';
import 'package:doctor/model/doctor_patient_model.dart';
import 'package:doctor/repository/doctor_repository.dart';
import 'package:doctor/ui/Dashboard/doctorsDashboard/patientDiagnosisDetail.dart';
import 'package:doctor/widgets/customSemiBoldTextWidget.dart';
import 'package:doctor/widgets/doctor/NewDiagnosisPage.dart';
import 'package:doctor/widgets/modal/addPatientDiagnosisModal.dart';
import 'package:flutter/material.dart';
import 'package:doctor/utils/responsive.dart';
import 'package:get/get.dart';

class PatientDiagnosisHistory extends StatefulWidget {
  final DoctorPatientsModel patientData;

  const PatientDiagnosisHistory({
    Key? key,
    required this.patientData,
  }) : super(key: key);

  @override
  State<PatientDiagnosisHistory> createState() =>
      _PatientDiagnosisHistoryState();
}

class _PatientDiagnosisHistoryState extends State<PatientDiagnosisHistory> {
  DoctorServices _doctorController = Get.find();
  DoctorRepository _doctorRepository = Get.find();

  @override
  Widget build(BuildContext context) {
    _doctorRepository.newDiagnosis.clear();
    _doctorController
        .getPatientDiagnosis("${this.widget.patientData.details!.pkid}");

    return Scaffold(
      backgroundColor: customWhiteBackground,
      body: ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: [
          SizedBox(
            height: 1.0.hp,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4.5.wp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customSemiBoldTextWidget(
                    text: "Diagnosis",
                    textColor: Colors.black,
                    textSize: 14.0.sp),
                InkWell(
                  onTap: () {
                    // showDialog(
                    //   context: context,
                    //   builder: (BuildContext context) {
                    //     return AddPatientDiagnosisModal();
                    //   },
                    // )
                    Get.to(
                      () => NewDiagnosisPage(
                        patientData: widget.patientData,
                      ),
                    );
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blueAccent,
                    ),
                    child: Icon(
                      Icons.add,
                      color: customWhiteBackground,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 2.0.hp),
          Padding(
            padding: EdgeInsets.only(left: 5.0.wp),
            child: Row(
              children: [
                Text(
                  "${widget.patientData.details!.firstName} ${widget.patientData.details!.lastName}",
                  style: TextStyle(
                    fontSize: 10.0.sp,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(" - "),
                Text(
                  "${widget.patientData.patientNumber}",
                  style: TextStyle(fontSize: 10.0.sp, fontFamily: "Poppins"),
                )
              ],
            ),
          ),
          Obx(
            () => ListView.builder(
              itemCount: _doctorRepository.patientDiagnosis.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) {
                return InkWell(
                  onTap: () {
                    Get.to(
                      () => PatientDiagnosisDetail(
                        diagnosisData:
                            _doctorRepository.patientDiagnosis[index],
                      ),
                    );
                  },
                  child: Container(
                    width: 90.0.wp,
                    height: 10.0.hp,
                    margin: EdgeInsets.symmetric(
                      horizontal: 5.0.wp,
                      vertical: 5,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 8.0.wp,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        _doctorRepository
                                            .patientDiagnosis[index]
                                            .diagnosisName,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        _doctorRepository
                                            .patientDiagnosis[index].createdAt,
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 0.5,
                          spreadRadius: -1.5,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
