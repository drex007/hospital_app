import 'package:doctor/Services/doctorController/doctor_services.dart';
import 'package:doctor/data/doctor_pramas.dart';
import 'package:doctor/model/labtest_category_model.dart';
import 'package:doctor/model/patient_diagnosis_model.dart';
import 'package:doctor/repository/doctor_repository.dart';
import 'package:doctor/widgets/doctor/tab_button.dart';
import 'package:doctor/widgets/doctor/utils/custom_dropdown_button.dart';
import 'package:doctor/widgets/doctor/utils/custom_labtestcategory_dropdown.dart';
import 'package:doctor/widgets/doctor/utils/custom_labtestsample_dropdown.dart';
import 'package:doctor/widgets/doctor/utils/custom_labtestype_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:doctor/utils/responsive.dart';
import 'package:get/get.dart';

class AddOtherLabTestModal extends StatefulWidget {
  final PatientDiagnosisModel diagnosis;
  const AddOtherLabTestModal({Key? key, required this.diagnosis})
      : super(key: key);

  @override
  State<AddOtherLabTestModal> createState() => _AddOtherLabTestModalState();
}

class _AddOtherLabTestModalState extends State<AddOtherLabTestModal> {
  DoctorServices _doctorServices = Get.find();
  DoctorRepository _doctorRepository = Get.find();

  String testTypeDropdownValue = labTestTypes[0];
  String testSampleDropdownValue = labTestSamples[0];
  String testCategoryDropdownValue = labTestCategories[0];

  int testTypeIndex = 0;
  int testSampleIndex = 0;
  int testCategoryIndex = 0;

  int testType = 0;
  int testSample = 0;
  int testCategory = 0;

  List samples = [];
  List categories = [];

  void handleTestTypeChange(int value) {
    setState(() {
      testType = value;
      print('${value} ::::::: ');
      testTypeIndex = _doctorRepository.laboratoryTestTypes
          .indexWhere((testType) => testType.pkid == value);

      categories = _doctorRepository.laboratoryTestCategories
          .where((cat) => cat.investigationType == value)
          .toList();

      print("${categories.length} :: cat length");
    });
    // print("${value} :: onchange val \nnew drug value ${drug}");
  }

  void handleTestCategoryChange(int value) {
    setState(() {
      testCategory = value;
      // print(value.toString());
      testCategoryIndex =
          categories.indexWhere((category) => category.pkid == value);

      samples = _doctorRepository.laboratoryTestSamples
          .where((sample) => sample.investigationCategory == value)
          .toList();
    });
    // print("${value} :: onchange val \nnew drug value ${drug}");
  }

  void handleTestSampleChange(int value) {
    setState(() {
      testSample = value;
      // print(value.toString());
      testSampleIndex = samples.indexWhere((sample) => sample.pkid == value);
    });
    // print("${value} :: onchange val \nnew drug value ${drug}");
  }

  Future submitHandler() {
    // navigator?.pop(context);

    Map data = {
      'diagnosis': widget.diagnosis.pkid.toString(),
      'patient': widget.diagnosis.diagnosedPatient!.pkid.toString(),
      'investigation_sample': testSample.toString(),
      'is_local': 'False',
    };

    return _doctorServices.addLaboratoryTest(data, '${data['patient']}/');
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
          height: MediaQuery.of(context).size.height * 0.35,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Other Laboratory Test',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 2.0.hp,
              ),
              CustomLabTestTypeButton(
                label: 'Test Type',
                dropdownValue: _doctorRepository
                    .laboratoryTestTypes[testTypeIndex].pkid
                    .toString(),
                handleChange: handleTestTypeChange,
              ),
              CustomLabTestCategoryButton(
                categories: categories,
                label: 'Category',
                dropdownValue: categories.length > 0
                    ? categories[testCategoryIndex].pkid.toString()
                    : '',
                handleChange: handleTestCategoryChange,
              ),
              CustomLabTestSampleButton(
                label: 'Sample',
                samples: samples,
                dropdownValue: samples.length > 0
                    ? samples[testSampleIndex].pkid.toString()
                    : '',
                handleChange: handleTestSampleChange,
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
