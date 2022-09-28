import 'package:doctor/Services/nursesController/nurse_services.dart';
import 'package:doctor/constants/color_constant.dart';
import 'package:doctor/repository/nurse_repo.dart';
import 'package:doctor/widgets/customSemiBoldTextWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:doctor/utils/responsive.dart';
import 'package:get/get.dart';

class AdministerInjectionModal extends StatelessWidget {
  final String PrescriptionId;
  final String DrugName;
  final String DrugRoute;
  final String Unit;
  final String DosageForm;
  final int InjectionCount;
  final int TimesAdministered;
  final int Duration;
  final String Frequency;
  const AdministerInjectionModal(
      {required this.PrescriptionId,
      required this.DrugName,
      required this.DrugRoute,
      required this.Unit,
      required this.DosageForm,
      required this.InjectionCount,
      required this.TimesAdministered,
      required this.Frequency,
      required this.Duration,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    NurseServices _nurseServices = Get.find();
    NursesRepository _nurseRepo = Get.find();
    print(PrescriptionId);
    return AlertDialog(
      content: Container(
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customSemiBoldTextWidget(
                text: "Administer this drug",
                textColor: Colors.black,
                textSize: 10.0.sp),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.0.wp, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Drug",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 9.0.sp),
                  ),
                  Text(
                    "Route",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 9.0.sp),
                  ),
                  Text(
                    "Unit",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 9.0.sp),
                  ),
                ],
              ),
            ),
            Container(
              width: 90.0.wp,
              height: 20,
              color: Colors.greenAccent,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DrugName,
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 9.0.sp),
                    ),
                    Text(
                      DrugRoute,
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 9.0.sp),
                    ),
                    Text(
                      Unit,
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 9.0.sp),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.0.wp, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Dosage form",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 9.0.sp),
                  ),
                  Text(
                    "Injection count",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 9.0.sp),
                  ),
                  Text(
                    "Times administered",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 9.0.sp),
                  ),
                ],
              ),
            ),
            Container(
              width: 90.0.wp,
              height: 20,
              color: Colors.greenAccent,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0.wp, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DosageForm,
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 9.0.sp),
                    ),
                    Text(
                      InjectionCount.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 9.0.sp),
                    ),
                    Text(
                      TimesAdministered.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 9.0.sp),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.0.wp, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Duration",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 9.0.sp),
                  ),
                  Text(
                    "Frequency",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 9.0.sp),
                  ),
                ],
              ),
            ),
            Container(
              width: 90.0.wp,
              height: 20,
              color: Colors.greenAccent,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.0.wp, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Duration.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 9.0.sp),
                    ),
                    Text(
                      Frequency,
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 9.0.sp),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ConstrainedBox(
                  constraints:
                      BoxConstraints.tightFor(width: 25.0.wp, height: 40),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.orange)),
                      onPressed: () => {
                            Navigator.pop(context),
                          },
                      child: Text("Cancel")),
                ),
                ConstrainedBox(
                  constraints:
                      BoxConstraints.tightFor(width: 25.0.wp, height: 40),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(customblue)),
                      onPressed: () async {
                        await _nurseServices.administerOpd(PrescriptionId);
                        await _nurseServices
                            .getDiagnosisPrescriptions(_nurseRepo.diagnosisId);
                        if (_nurseServices.showAdministerDrugModal.value ==
                            false) {
                          Navigator.pop(context);
                        }
                      },
                      child: Text("Administer")),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
