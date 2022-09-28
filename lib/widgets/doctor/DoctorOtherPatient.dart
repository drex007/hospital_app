import 'package:doctor/repository/doctor_repository.dart';
import 'package:doctor/widgets/doctor/PatientDiagnosisHistory.dart';
import 'package:flutter/material.dart';
import '../../utils/responsive.dart';
import 'package:get/get.dart';
import 'package:doctor/constants/url_paths.dart';

class DoctorsOtherPatients extends StatelessWidget {
  const DoctorsOtherPatients({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DoctorRepository _doctorRepository = Get.find();
    // print(patients[0].profilePhoto);

    return Obx(
      () => ListView.builder(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        itemCount: _doctorRepository.doctorOtherPatients.length,
        shrinkWrap: false,
        primary: false,
        itemBuilder: (_, index) {
          return InkWell(
            onTap: () => {
              Get.to(
                () => PatientDiagnosisHistory(
                  patientData: _doctorRepository.doctorOtherPatients[index],
                ),
              )
            },
            child: Container(
              height: 10.0.hp,
              width: 90.0.wp,
              margin: EdgeInsets.symmetric(horizontal: 2.0.wp, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 0.5,
                    spreadRadius: -1,
                  )
                ],
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 0.5.hp,
                      left: 2.0.wp,
                    ),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                    ),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        "${backendUrl2}${_doctorRepository.doctorOtherPatients[index].profilePhoto}",
                      ),
                    ),
                  ),
                  SizedBox(width: 5.0.wp),
                  Padding(
                    padding: EdgeInsets.only(left: 15, top: 27),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${_doctorRepository.doctorOtherPatients[index].details.firstName} ${_doctorRepository.doctorOtherPatients[index].details.lastName}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "${_doctorRepository.doctorOtherPatients[index].gender}",
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
