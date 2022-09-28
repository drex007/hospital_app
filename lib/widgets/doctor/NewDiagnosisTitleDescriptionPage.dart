import 'package:doctor/Services/doctorController/doctor_services.dart';
import 'package:doctor/model/doctor_patient_model.dart';
import 'package:doctor/repository/doctor_repository.dart';
import 'package:doctor/widgets/doctor/tab_button.dart';
import 'package:flutter/material.dart';
import 'package:doctor/utils/responsive.dart';
import 'package:get/get.dart';

class NewDiagnosisTitleDescriptionPage extends StatefulWidget {
  final DoctorPatientsModel patientData;

  const NewDiagnosisTitleDescriptionPage({Key? key, required this.patientData})
      : super(key: key);

  @override
  State<NewDiagnosisTitleDescriptionPage> createState() =>
      _NewDiagnosisTitleDescriptionPageState();
}

class _NewDiagnosisTitleDescriptionPageState
    extends State<NewDiagnosisTitleDescriptionPage> {
  DoctorServices _doctorServices = Get.find();
  DoctorRepository _doctorRepository = Get.find();

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController(
      text: _doctorRepository.newDiagnosis.length > 0
          ? _doctorRepository.newDiagnosis[0]!.diagnosisName
          : '',
    );
    TextEditingController descriptionController = TextEditingController(
      text: _doctorRepository.newDiagnosis.length > 0
          ? _doctorRepository.newDiagnosis[0]!.description
          : '',
    );

    Future newDiagnosisHandler() {
      print('handling...');

      if (titleController.text.trim().length == 0) {
        Get.snackbar(
          'Error',
          'Diagnosis title is required',
          colorText: Colors.black,
          backgroundColor: Colors.amber.withOpacity(0.2),
        );
      }
      if (descriptionController.text.trim().length == 0) {
        Get.snackbar(
          'Error',
          'Diagnosis description is required',
          colorText: Colors.black,
          backgroundColor: Colors.amber.withOpacity(0.2),
        );
      }

      Map data = {
        'patient': widget.patientData.details!.pkid.toString(),
        'diagnosis_name': titleController.text.trim().toString(),
        'description': descriptionController.text.trim().toString(),
      };

      return _doctorServices.addNewDiagnosis(data);
    }

    print("${_doctorRepository.newDiagnosis.length} :: len");
    return Obx(
      () => Container(
        height: 60.0.hp,
        width: 100.0.wp,
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(
            left: 5.0.wp,
            right: 5.0.wp,
            bottom: 5.0.hp,
          ),
          children: [
            SizedBox(
              height: 1.0.hp,
            ),
            _doctorRepository.newDiagnosis.length <= 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TabButton(
                        label: 'Save',
                        bgColor: Colors.deepPurpleAccent,
                        onPressHandler: newDiagnosisHandler,
                      ),
                    ],
                  )
                : Text(''),
            Container(
              height: 5.0.hp,
              width: 100.0.wp,
              // margin: EdgeInsets.symmetric(horizontal: 2.0.wp),
              padding: EdgeInsets.symmetric(
                horizontal: 5.0.wp,
              ),
              child: TextField(
                readOnly:
                    _doctorRepository.newDiagnosis.length > 0 ? true : false,
                controller: titleController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Diagnosis title',
                  hintStyle: TextStyle(fontSize: 14),
                ),
              ),
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
            ),
            SizedBox(
              height: 1.0.hp,
            ),
            Container(
              height: 78.0.hp,
              width: 100.0.wp,
              // margin: EdgeInsets.symmetric(horizontal: 2.0.wp),
              padding:
                  EdgeInsets.symmetric(horizontal: 5.0.wp, vertical: 0.5.hp),
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
              child: TextField(
                readOnly:
                    _doctorRepository.newDiagnosis.length > 0 ? true : false,
                // readOnly: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Diagnosis description',
                  hintStyle: TextStyle(
                    fontSize: 14,
                  ),
                ),
                controller: descriptionController,
                maxLines: 100,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
