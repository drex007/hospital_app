import 'package:doctor/Services/doctorController/doctor_services.dart';
import 'package:doctor/constants/color_constant.dart';
import 'package:doctor/repository/doctor_repository.dart';
import 'package:doctor/widgets/customBoldTextWidget.dart';
import 'package:doctor/widgets/doctor/utils/ward_card.dart';
import 'package:flutter/material.dart';
import 'package:doctor/utils/responsive.dart';
import 'package:get/get.dart';

class DoctorsWard extends StatefulWidget {
  const DoctorsWard({Key? key}) : super(key: key);

  @override
  State<DoctorsWard> createState() => _DoctorsWardState();
}

class _DoctorsWardState extends State<DoctorsWard> {
  DoctorServices _doctorServices = Get.find();
  DoctorRepository _doctorRepository = Get.find();

  @override
  Widget build(BuildContext context) {
    _doctorServices.getWardBedSpaces();

    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            elevation: 0,
            backgroundColor: customWhiteBackground,
          ),
          preferredSize: Size.fromHeight(0.0.hp)),
      backgroundColor: customWhiteBackground,
      body: Obx(
        () => ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            SizedBox(
              height: 2.0.hp,
            ),
            Padding(
              padding: EdgeInsets.only(left: 4.0.wp),
              child: customBoldTextWidget(
                text: "Wards",
                textColor: Colors.black,
                textSize: 15.0.sp,
              ),
            ),
            SizedBox(
              height: 1.5.wp,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: _doctorRepository.wardBedSpaces.length,
              itemBuilder: (_, index) {
                return BedspaceCard(
                    data: _doctorRepository.wardBedSpaces[index],
                    wardIndex: index);
              },
            ),
          ],
        ),
      ),
    );
  }
}
