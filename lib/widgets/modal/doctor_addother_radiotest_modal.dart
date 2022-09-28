import 'package:doctor/Services/doctorController/doctor_services.dart';
import 'package:doctor/model/patient_diagnosis_model.dart';
import 'package:doctor/repository/doctor_repository.dart';
import 'package:doctor/widgets/doctor/tab_button.dart';
import 'package:doctor/widgets/doctor/utils/custom_radiologytest_category_dropdown.dart';
import 'package:doctor/widgets/doctor/utils/custom_radiologytest_type_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:doctor/utils/responsive.dart';
import 'package:get/get.dart';

class AddOtherRadiologyTestModal extends StatefulWidget {
  final PatientDiagnosisModel diagnosis;

  const AddOtherRadiologyTestModal({
    Key? key,
    required this.diagnosis,
  }) : super(key: key);

  @override
  State<AddOtherRadiologyTestModal> createState() =>
      _AddOtherRadiologyTestModalState();
}

class _AddOtherRadiologyTestModalState
    extends State<AddOtherRadiologyTestModal> {
  DoctorServices _doctorServices = Get.find();
  DoctorRepository _doctorRepository = Get.find();

  int testTypeIndex = 0;
  int testCategoryIndex = 0;

  int testType = 0;
  int testCategory = 0;

  List categories = [];

  void handleTestTypeChange(int value) {
    setState(() {
      testType = value;

      print('${value} ::::::: ');

      testTypeIndex = _doctorRepository.radiologyTestTypes
          .indexWhere((testType) => testType.pkid == value);

      categories = _doctorRepository.radiologyTestCategories
          .where((cat) => cat.investigationType == value)
          .toList();

      print("${categories.length} :: cat length");
    });
    // print("${value} :: onchange val \nnew drug value ${drug}");
  }

  void handleTestCategoryChange(int value) {
    setState(() {
      testCategory = value;

      testCategoryIndex =
          categories.indexWhere((category) => category.pkid == value);
    });
    // print("${value} :: onchange val \nnew drug value ${drug}");
  }

  Future submitHandler() {
    Map data = {
      'diagnosis': widget.diagnosis.pkid.toString(),
      'investigation_category': testCategory.toString(),
      'is_local': 'False',
    };

    return _doctorServices.addRadiologyTest(
        data, "${widget.diagnosis.diagnosedPatient!.pkid}/");
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
          height: MediaQuery.of(context).size.height * 0.30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Other Radiology Test',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 2.0.hp,
              ),
              CustomRadiologyTestTypeDropdownButton(
                label: 'Test Type',
                dropdownValue: _doctorRepository
                    .radiologyTestTypes[testTypeIndex]!.pkid
                    .toString(),
                handleChange: handleTestTypeChange,
              ),
              CustomRadiologyTestCategoryDropdownButton(
                label: 'Category',
                categories: categories,
                dropdownValue: categories.length > 0
                    ? categories[testCategoryIndex]!.pkid.toString()
                    : '',
                handleChange: handleTestCategoryChange,
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
