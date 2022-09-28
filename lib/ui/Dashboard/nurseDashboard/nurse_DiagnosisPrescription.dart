import 'package:doctor/Services/nursesController/nurse_services.dart';
import 'package:doctor/constants/color_constant.dart';
import 'package:doctor/repository/nurse_repo.dart';
import 'package:doctor/widgets/customBoldTextWidget.dart';
import 'package:doctor/widgets/modal/adminsterInjectionModal.dart';
import 'package:doctor/widgets/nurse/prescriptionCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:doctor/utils/responsive.dart';

class DiagnosisPrescriptionPage extends StatefulWidget {
  final String DiagnosisName;
  final String DiagnosisId;
  const DiagnosisPrescriptionPage(
      {required this.DiagnosisName, required this.DiagnosisId, Key? key})
      : super(key: key);

  @override
  State<DiagnosisPrescriptionPage> createState() =>
      _DiagnosisPrescriptionPageState();
}

class _DiagnosisPrescriptionPageState extends State<DiagnosisPrescriptionPage> {
  NurseServices _nurseServices = Get.find();
  NursesRepository _nursesRepository = Get.find();
  @override
  void initState() {
    setState(() {
      _nurseServices.getDiagnosisPrescriptions(widget.DiagnosisId);
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customWhiteBackground,
      body: ListView(
        children: [
          SizedBox(
            height: 3.0.hp,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back)),
              Padding(
                padding: EdgeInsets.only(left: 2.0.wp),
                child: customBoldTextWidget(
                    text: widget.DiagnosisName,
                    textColor: Colors.black,
                    textSize: 20.0.sp),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 2.0.wp),
            child: customBoldTextWidget(
                text: "Prescriptions",
                textColor: Colors.grey,
                textSize: 10.0.sp),
          ),
          Obx(() => ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _nursesRepository.patientDiagnosisPrescription.length,
              itemBuilder: (_, index) {
                return InkWell(
                  onTap: () {
                    if (_nursesRepository.patientDiagnosisPrescription
                            .value[index].injectionCount ==
                        _nursesRepository
                            .patientDiagnosisPrescription.value[index].times) {
                      Get.snackbar("Alert notice",
                          "The injection has been fully administered",
                          backgroundColor: Colors.blueAccent.withOpacity(0.3));
                    } else {
                      _nurseServices.showAdministerDrugModal.value == true;
                      print(
                          "Modal===========>${_nurseServices.showAdministerDrugModal.value}");
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return AdministerInjectionModal(
                              PrescriptionId: _nursesRepository
                                  .patientDiagnosisPrescription.value[index].id,
                              DosageForm: _nursesRepository
                                  .patientDiagnosisPrescription
                                  .value[index]
                                  .dosageForm,
                              DrugName: _nursesRepository
                                  .patientDiagnosisPrescription
                                  .value[index]
                                  .drugs,
                              DrugRoute: _nursesRepository
                                  .patientDiagnosisPrescription
                                  .value[index]
                                  .routes,
                              Duration: _nursesRepository
                                  .patientDiagnosisPrescription
                                  .value[index]
                                  .duration,
                              InjectionCount: _nursesRepository
                                  .patientDiagnosisPrescription
                                  .value[index]
                                  .injectionCount,
                              TimesAdministered: _nursesRepository
                                  .patientDiagnosisPrescription
                                  .value[index]
                                  .times,
                              Unit: _nursesRepository
                                  .patientDiagnosisPrescription
                                  .value[index]
                                  .units,
                              Frequency: _nursesRepository
                                  .patientDiagnosisPrescription
                                  .value[index]
                                  .frequency,
                            );
                          });
                    }
                  },
                  child: PrescriptionCard(
                    Index: index,
                  ),
                );
              }))
        ],
      ),
    );
  }
}
