import 'package:doctor/Services/nursesController/nurse_services.dart';
import 'package:doctor/constants/color_constant.dart';
import 'package:doctor/repository/nurse_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:doctor/utils/responsive.dart';

class WardReport extends StatefulWidget {
  final String wardId;
  const WardReport({required this.wardId, Key? key}) : super(key: key);

  @override
  State<WardReport> createState() => _WardReportState();
}

class _WardReportState extends State<WardReport> {
  NursesRepository _nurseRepo = Get.find();
  NurseServices _nurseServices = Get.find();
  @override
  void initState() {
    setState(() {
      _nurseServices.getWardReport(this.widget.wardId);
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
        itemCount: _nurseRepo.WardReport.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        itemBuilder: (_, index) {
          return Container(
            height: 10.0.hp,
            width: 90.0.wp,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 2.0.wp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Row(
              children: [
                SizedBox(width: 15),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  child: Center(child: Text((index + 1).toString())),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(
                          "${_nurseRepo.WardReport.value[index].report}",
                          maxLines: 5,
                        )),
                  ),
                )
              ],
            ),
          );
        }));
  }
}
