import 'package:doctor/Services/nursesController/nurse_services.dart';
import 'package:doctor/constants/color_constant.dart';
import 'package:doctor/repository/nurse_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:doctor/utils/responsive.dart';

class BedSpaces extends StatefulWidget {
  const BedSpaces({Key? key}) : super(key: key);

  @override
  State<BedSpaces> createState() => _BedSpacesState();
}

class _BedSpacesState extends State<BedSpaces> {
  NursesRepository _nursesRepository = Get.find();
  NurseServices _nurseServices = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        itemCount: _nursesRepository.bedSpaceList.length,
        itemBuilder: (_, index) {
          return Container(
            height: 8.0.hp,
            width: 90.0.wp,
            margin: EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [BoxShadow(spreadRadius: -1, blurRadius: 0.5)]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
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
                    Text(
                        "Bed space number ${_nursesRepository.bedSpaceList[index].bedNumber}")
                  ],
                ),
                Container(
                  height: 20,
                  width: 80,
                  margin: EdgeInsets.only(right: 2.0.wp),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: _nursesRepository.bedSpaceList[index].allocated ==
                              true
                          ? customblue.withOpacity(0.4)
                          : Colors.grey.withOpacity(0.4)),
                  child: _nursesRepository.bedSpaceList[index].allocated == true
                      ? Center(child: Text("Occupied"))
                      : Center(child: Text("Available")),
                )
              ],
            ),
          );
        }));
  }
}
