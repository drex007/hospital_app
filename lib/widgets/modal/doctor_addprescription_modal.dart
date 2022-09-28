import 'package:doctor/Services/doctorController/doctor_services.dart';
import 'package:doctor/data/doctor_pramas.dart';
import 'package:doctor/model/patient_diagnosis_model.dart';
import 'package:doctor/repository/doctor_repository.dart';
import 'package:doctor/widgets/doctor/tab_button.dart';
import 'package:doctor/widgets/doctor/utils/custom_dropdown_button.dart';
import 'package:doctor/widgets/doctor/utils/custom_drug_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:doctor/utils/responsive.dart';
import 'package:doctor/widgets/doctor/utils/input_container.dart';
import 'package:get/get.dart';

class AddPrescriptionModal extends StatefulWidget {
  final PatientDiagnosisModel diagnosis;
  const AddPrescriptionModal({
    Key? key,
    required this.diagnosis,
  }) : super(key: key);

  @override
  State<AddPrescriptionModal> createState() => _AddPrescriptionModalState();
}

class _AddPrescriptionModalState extends State<AddPrescriptionModal> {
  DoctorServices _doctorServices = Get.find();
  DoctorRepository _doctorRepository = Get.find();

  TextEditingController _duration = TextEditingController();
  TextEditingController _times = TextEditingController();

  int drug = 0;
  String routes = '';
  String units = '';
  String frequency = '';

  String routesDropdownValue = drugRoutes[0];
  String drugUnitDropdownValue = drugUnits[0];
  String drugFrequencyDropdownValue = prescriptionFrequency[0];
  int drugIndex = 0;
  // String drugsDropdownValue = _doctorRepository.drugs[0]!.pkid.toString();

  void handleDrugChange(int value) {
    setState(() {
      drug = value;

      drugIndex =
          _doctorRepository.drugs.indexWhere((drug) => drug.pkid == value);
    });
    print("${value} :: onchange val \nnew drug value ${drug}");
  }

  void handleRouteChange(String value) {
    setState(() {
      routes = value;
      routesDropdownValue = value;
    });
    print("${value} :: onchange val \nnew route value ${routes}");
  }

  void handleUnitChange(String value) {
    setState(() {
      units = value;
      drugUnitDropdownValue = value;
    });
    print("${value} :: onchange val \nnew unit value ${units}");
  }

  void handleFrequencyChange(String value) {
    setState(() {
      frequency = value;
      drugFrequencyDropdownValue = value;
    });
    print("${value} :: onchange val \nnew frequency value ${frequency}");
  }

  @override
  Widget build(BuildContext context) {
    Future submitHandler() {
      Map data = {
        "drug": drug.toString(),
        'routes': routes,
        'units': units,
        'frequency': frequency.toLowerCase(),
        'duration': _duration.text.trim(),
        'duration_time': _times.text.trim(),
        'diagnosis': widget.diagnosis.pkid.toString(),
        "patient": widget.diagnosis.diagnosedPatient!.pkid.toString(),
        'other_prescription': "False",
      };
      // print(data);
      return _doctorServices.addPrescription(data);
    }

    void modalHandler() async {
      await submitHandler();
      if (_doctorServices.showModal == false) {
        Navigator.pop(context);
      }
    }

    return AlertDialog(
      content: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.80,
          height: MediaQuery.of(context).size.height * 0.60,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Prescription',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 2.0.hp,
              ),
              CustomDrugDropdownButton(
                label: 'Drug',
                dropdownValue:
                    _doctorRepository.drugs[drugIndex]!.pkid.toString(),
                handleChange: handleDrugChange,
              ),
              CustomDropdownButton(
                label: 'Route',
                items: drugRoutes,
                dropdownValue: routesDropdownValue,
                handleChange: handleRouteChange,
              ),
              CustomDropdownButton(
                label: 'Unit',
                items: drugUnits,
                dropdownValue: drugUnitDropdownValue,
                handleChange: handleUnitChange,
              ),
              CustomDropdownButton(
                label: 'Frequency',
                items: prescriptionFrequency,
                dropdownValue: drugFrequencyDropdownValue,
                handleChange: handleFrequencyChange,
              ),
              SizedBox(
                height: 1.0.hp,
              ),
              InputContainer(
                label: 'Duration',
                inputType: 'number',
                borderType: 'bottom',
                valueController: _duration,
              ),
              SizedBox(
                height: 1.0.hp,
              ),
              InputContainer(
                label: 'Times',
                inputType: 'number',
                borderType: 'bottom',
                valueController: _times,
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
