import 'package:doctor/repository/nurse_repo.dart';
import 'package:doctor/widgets/nurse/performanceDataDetailWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import '../../utils/responsive.dart';
import 'package:get/get.dart';

class PerformanceDataPage extends StatelessWidget {
  const PerformanceDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NursesRepository _nurseRepo = Get.find();
    return Obx(() => ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: _nurseRepo.patientPerformanceData.length,
          itemBuilder: (_, index) {
            return Container(
              height: 10.0.hp,
              width: 90.0.wp,
              margin: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(spreadRadius: -1, blurRadius: 0.5)],
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 2.0.wp, top: 1.5.hp),
                    child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey),
                        child: Center(child: Text((index + 1).toString()))),
                  ),
                  SizedBox(
                    width: 8.0.wp,
                  ),
                  PerformanceDataDetailWiget(index: index)
                ],
              ),
            );
          },
        ));
  }
}
