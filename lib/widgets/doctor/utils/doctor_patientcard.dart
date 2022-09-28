import 'package:doctor/model/doctor_patient_model.dart';
import 'package:doctor/widgets/doctor/PatientDiagnosisHistory.dart';
import 'package:flutter/material.dart';
import 'package:doctor/utils/responsive.dart';
import 'package:doctor/constants/url_paths.dart';
import 'package:get/get.dart';

class DoctorPatientCard extends StatefulWidget {
  final DoctorPatientsModel patient;
  const DoctorPatientCard({
    Key? key,
    required this.patient,
  }) : super(key: key);

  @override
  State<DoctorPatientCard> createState() => _DoctorPatientCardState();
}

class _DoctorPatientCardState extends State<DoctorPatientCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => PatientDiagnosisHistory(patientData: widget.patient));
      },
      child: Container(
        width: 90.0.wp,
        height: 12.0.hp,
        margin: EdgeInsets.symmetric(horizontal: 2.0.wp, vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade100,
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(top: 0.5.hp, left: 2.0.wp),
              height: 8.0.hp,
              width: 8.0.hp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
              ),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  "${backendUrl2}${widget.patient.profilePhoto}",
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
                    "${widget.patient.details!.firstName} ${widget.patient.details!.lastName}",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "${widget.patient.gender}",
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
