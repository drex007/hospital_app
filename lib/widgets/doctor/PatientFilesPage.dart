import 'package:doctor/Services/doctorController/doctor_services.dart';
import 'package:doctor/data/doctor_pramas.dart';
import 'package:doctor/model/patient_diagnosis_model.dart';
import 'package:doctor/repository/doctor_repository.dart';
import 'package:doctor/widgets/doctor/patient_file_card.dart';
import 'package:doctor/widgets/doctor/tab_button.dart';
import 'package:doctor/widgets/modal/doctor_upload_patientfile_modal.dart';
import 'package:flutter/material.dart';
import 'package:doctor/utils/responsive.dart';
import 'package:get/get.dart';

class PatientFilesPage extends StatefulWidget {
  final PatientDiagnosisModel data;
  const PatientFilesPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<PatientFilesPage> createState() => _PatientFilesPageState();
}

class _PatientFilesPageState extends State<PatientFilesPage> {
  DoctorServices _doctorServices = Get.find();
  DoctorRepository _doctorRepository = Get.find();

  @override
  Widget build(BuildContext context) {
    _doctorServices.getPatientFiles(
        '${widget.data.diagnosedPatient!.pkid}/${widget.data.pkid}/');

    addTestHandler() {
      return showDialog(
        context: context,
        builder: (context) {
          return UploadPatientFileModal(diagnosis: widget.data);
        },
      );
    }

    return Obx(
      () => ListView(
        shrinkWrap: true,
        // physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(
          left: 5.0.wp,
          right: 5.0.wp,
          bottom: 5.0.hp,
        ),
        children: [
          SizedBox(
            height: 1.0.hp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TabButton(
                label: 'Add',
                bgColor: Colors.deepPurpleAccent,
                onPressHandler: addTestHandler,
              ),
            ],
          ),
          SizedBox(
            height: 1.0.hp,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.92,
            padding: EdgeInsets.only(bottom: 10.0.hp),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: _doctorRepository.patientFiles.length,
              physics: ScrollPhysics(),
              itemBuilder: (_, index) {
                return PatientFileCard(
                  fileData: _doctorRepository.patientFiles[index],
                  testIndex: index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
