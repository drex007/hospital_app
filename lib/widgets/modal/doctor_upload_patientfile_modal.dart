import 'package:doctor/Services/doctorController/doctor_services.dart';
import 'package:doctor/data/doctor_pramas.dart';
import 'package:doctor/model/patient_diagnosis_model.dart';
import 'package:doctor/widgets/doctor/tab_button.dart';
import 'package:doctor/widgets/doctor/utils/input_container.dart';
import 'package:flutter/material.dart';
import 'package:doctor/utils/responsive.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadPatientFileModal extends StatefulWidget {
  final PatientDiagnosisModel diagnosis;
  const UploadPatientFileModal({
    Key? key,
    required this.diagnosis,
  }) : super(key: key);

  @override
  State<UploadPatientFileModal> createState() => _UploadPatientFileModalState();
}

class _UploadPatientFileModalState extends State<UploadPatientFileModal> {
  XFile? image;
  final ImagePicker _picker = ImagePicker();

  DoctorServices _doctorServices = Get.find();

  TextEditingController titleController = TextEditingController();

  String testTypeDropdownValue = radiologyTestTypes[0];
  String testCategoryDropdownValue = radiologyTestCategories[0];

  Future submitHandler() {
    // navigator?.pop(context);
    Map<String, dynamic> data = {
      'title': titleController.text.trim().toString(),
      'image': image!.path.toString(),
    };

    return _doctorServices.addPatientFile(data,
        "${widget.diagnosis.diagnosedPatient!.pkid}/${widget.diagnosis.pkid}/");
  }

  void modalHandler() async {
    await submitHandler();
    if (_doctorServices.showModal == false) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.80,
          height: MediaQuery.of(context).size.height * 0.32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Upload Patient File',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 2.0.hp,
              ),
              InputContainer(
                label: 'Title',
                inputType: 'text',
                borderType: 'all',
                valueController: titleController,
              ),
              SizedBox(
                height: 1.5.hp,
              ),
              InkWell(
                onTap: () async {
                  debugPrint('hello');

                  image = await _picker.pickImage(
                    source: ImageSource.gallery,
                    maxWidth: 100,
                    maxHeight: 100,
                  );

                  if (image == null) return;

                  debugPrint("${image!.name} :: file");
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 10.0.hp,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade200,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.cloud_circle_rounded,
                    size: 10.0.wp,
                    color: Colors.blue.shade300,
                  ),
                ),
              ),
              SizedBox(
                height: 1.5.hp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TabButton(
                    label: 'Submit',
                    bgColor: Colors.deepPurple,
                    onPressHandler: modalHandler,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
