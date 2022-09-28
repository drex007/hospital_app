import 'package:doctor/repository/nurse_repo.dart';
import 'package:doctor/ui/Dashboard/nurseDashboard/nurse_DiagnosisPrescription.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../utils/responsive.dart';
import 'package:get/get.dart';

class PatientDiagnosisList extends StatelessWidget {
  const PatientDiagnosisList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NursesRepository _nurseRepo = Get.find();
    return Obx(() => ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: _nurseRepo.patientDiagnosisList.length,
        itemBuilder: (_, index) {
          return InkWell(
            onTap: () {
              _nurseRepo.diagnosisId =
                  _nurseRepo.patientDiagnosisList.value[index].id;
              Get.to(() => DiagnosisPrescriptionPage(
                    DiagnosisName: _nurseRepo
                        .patientDiagnosisList.value[index].diagnosisName,
                    DiagnosisId:
                        _nurseRepo.patientDiagnosisList.value[index].id,
                  ));
            },
            child: Container(
              height: 6.0.hp,
              width: 90.0.wp,
              padding: EdgeInsets.only(left: 10, top: 5),
              margin:
                  EdgeInsets.symmetric(horizontal: 2.0.wp, vertical: 0.5.hp),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(spreadRadius: -1, blurRadius: 0.5)]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "Diagnosis: ${_nurseRepo.patientDiagnosisList.value[index].diagnosisName}"),
                  SizedBox(height: 5),
                  Text(
                      "Date diagnosed: ${_nurseRepo.patientDiagnosisList.value[index].createdAt}")
                ],
              ),
            ),
          );
        }));
  }
}
