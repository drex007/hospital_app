import 'package:doctor/repository/doctor_repository.dart';
import 'package:doctor/widgets/doctor/utils/doctor_patientcard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorsPatients extends StatelessWidget {
  const DoctorsPatients({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DoctorRepository _doctorRepository = Get.find();

    return Obx(
      () => ListView.builder(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        itemCount: _doctorRepository.doctorPatients.length,
        shrinkWrap: false,
        primary: false,
        itemBuilder: (_, index) {
          return DoctorPatientCard(
            patient: _doctorRepository.doctorPatients[index],
          );
        },
      ),
    );
  }
}
