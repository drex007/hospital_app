import 'package:doctor/Services/doctorController/doctor_services.dart';
import 'package:doctor/repository/doctor_repository.dart';
import 'package:doctor/widgets/doctor/patient_file_card.dart';
import 'package:doctor/widgets/doctor/tab_button.dart';
import 'package:doctor/widgets/modal/doctor_upload_patientfile_modal.dart';
import 'package:flutter/material.dart';
import 'package:doctor/utils/responsive.dart';
import 'package:get/get.dart';

class NewPatientFilesPage extends StatefulWidget {
  const NewPatientFilesPage({
    Key? key,
  }) : super(key: key);

  @override
  State<NewPatientFilesPage> createState() => _NewPatientFilesPageState();
}

class _NewPatientFilesPageState extends State<NewPatientFilesPage> {
  DoctorServices _doctorServices = Get.find();
  DoctorRepository _doctorRepository = Get.find();

  @override
  Widget build(BuildContext context) {
    _doctorServices.getPatientFiles(
      '${_doctorRepository.newDiagnosis.length > 0 ? _doctorRepository.newDiagnosis[0].diagnosedPatient!.pkid : 0}/${_doctorRepository.newDiagnosis.length > 0 ? _doctorRepository.newDiagnosis[0].pkid : 0}/',
    );

    addTestHandler() {
      return showDialog(
        context: context,
        builder: (context) {
          return UploadPatientFileModal(
            diagnosis: _doctorRepository.newDiagnosis.length > 0
                ? _doctorRepository.newDiagnosis[0]
                : {},
          );
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
          _doctorRepository.newDiagnosis.length > 0
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TabButton(
                      label: 'Add',
                      bgColor: Colors.deepPurpleAccent,
                      onPressHandler: addTestHandler,
                    ),
                  ],
                )
              : Text(''),
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
