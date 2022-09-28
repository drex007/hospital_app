import 'package:doctor/repository/nurse_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../utils/responsive.dart';
import 'package:get/get.dart';

class PerformanceDataDetailWiget extends StatelessWidget {
  final int index;
  const PerformanceDataDetailWiget({required this.index, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    NursesRepository _nurseRepo = Get.find();
    return Column(
      children: [
        SizedBox(
          height: 1.0.hp,
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Temperature",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 10.0.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 15.0.wp,
                ),
                Text(
                  "B.p(systolic)",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 10.0.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 13.0.wp,
                ),
                Text(
                  "B.p(diastolic)",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 10.0.sp,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                    "${_nurseRepo.patientPerformanceData.value[index].temperature}°C"),
                SizedBox(
                  width: 22.0.wp,
                ),
                Text(
                    "${_nurseRepo.patientPerformanceData.value[index].bloodPressureSys}mmHg"),
                SizedBox(
                  width: 13.0.wp,
                ),
                Text(
                    "${_nurseRepo.patientPerformanceData.value[index].bloodPressureDia}mmHg"),
              ],
            ),
          ],
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Pulse",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 10.0.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 15.0.wp,
                ),
                Text(
                  "Respiratory",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 10.0.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 15.0.wp,
                ),
                Text(
                  "Period",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 10.0.sp,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // SizedBox(
                //   width: 5.0.wp,
                // ),
                Text(
                    "${_nurseRepo.patientPerformanceData.value[index].pulse}(bpm)"),
                SizedBox(
                  width: 16.0.wp,
                ),
                Text(
                    "${_nurseRepo.patientPerformanceData.value[index].respiration}(bpm)"),
                SizedBox(
                  width: 15.0.wp,
                ),
                Text(
                    "${_nurseRepo.patientPerformanceData.value[index].period}"),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
