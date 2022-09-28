import 'package:doctor/Services/nursesController/nurse_services.dart';
import 'package:doctor/constants/color_constant.dart';
import 'package:doctor/repository/nurse_repo.dart';
import 'package:doctor/widgets/customSemiBoldTextWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/responsive.dart';

class AddPatientDiagnosisModal extends StatefulWidget {
  const AddPatientDiagnosisModal({Key? key}) : super(key: key);

  @override
  AddPatientDiagnosisModalState createState() =>
      AddPatientDiagnosisModalState();
}

class AddPatientDiagnosisModalState extends State<AddPatientDiagnosisModal> {
  NurseServices _nurseServices = Get.find();
  NursesRepository _nursesRepository = Get.find();

  List periods = [
    "2.00 AM",
    "6.00 AM",
    "10.00 AM",
    "2.00 PM",
    "6.00 PM",
    "10.00 PM"
  ];
  TextEditingController _temperaturetextController = TextEditingController();
  TextEditingController _pulsetextController = TextEditingController();
  TextEditingController _systolicPulseController = TextEditingController();
  TextEditingController _diastolicPulsetextController = TextEditingController();
  TextEditingController _respiratorytextController = TextEditingController();
  String _dropDownValue = "";

  @override
  Widget build(BuildContext context) {
    Future submitHandler() {
      Navigator navigator = Navigator();
      Map data = {
        "temperature": _temperaturetextController.text,
        "respiration": _respiratorytextController.text,
        "pulse": _pulsetextController.text,
        "blood_pressure_sys": _systolicPulseController.text,
        "blood_pressure_dia": _diastolicPulsetextController.text,
        "period": _dropDownValue,
        "remark": "None"
      };
      // print(data);
      return _nurseServices.addPerformanceData(
          data, _nursesRepository.patientPrescribedId.value);
    }

    return AlertDialog(
      elevation: 0,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      content: Container(
          height: 60.0.hp,
          width: 90.0.wp,
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customSemiBoldTextWidget(
                  text: "Add performance data",
                  textColor: Colors.black,
                  textSize: 10.0.sp),
              SizedBox(
                height: 5,
              ),
              PerformanceInputWidget(
                labelText: "Temperature",
                textController: _temperaturetextController,
              ),
              PerformanceInputWidget(
                labelText: "Pulse",
                textController: _pulsetextController,
              ),
              PerformanceInputWidget(
                labelText: "Blood Pressure(sys)",
                textController: _systolicPulseController,
              ),
              PerformanceInputWidget(
                labelText: "Blood Pressure(dia)",
                textController: _diastolicPulsetextController,
              ),
              PerformanceInputWidget(
                labelText: "Respiratory",
                textController: _respiratorytextController,
              ),
              SizedBox(
                height: 10,
              ),
              Text("Select period below"),
              DropdownButton(
                hint: _dropDownValue == null
                    ? Text('Dropdown')
                    : Text(
                        _dropDownValue,
                        style: TextStyle(color: Colors.black),
                      ),
                isExpanded: true,
                iconSize: 30.0,
                style: TextStyle(color: Colors.black),
                items: periods.map(
                  (val) {
                    return DropdownMenuItem<String>(
                      value: val,
                      child: Text(val),
                    );
                  },
                ).toList(),
                onChanged: (val) {
                  setState(
                    () {
                      _dropDownValue = val as String;
                    },
                  );
                },
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ConstrainedBox(
                    constraints:
                        BoxConstraints.tightFor(width: 100, height: 35),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.orange)),
                        onPressed: () => {Navigator.pop(context)},
                        child: Text("Cancel")),
                  ),
                  ConstrainedBox(
                    constraints:
                        BoxConstraints.tightFor(width: 100, height: 35),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(customblue)),
                        onPressed: () async {
                          await submitHandler();
                          if (_nurseServices.showModal == false) {
                            Navigator.pop(context);
                          }
                        },
                        child: Text("Submit")),
                  )
                ],
              )
            ],
          )),
    );
  }
}

class PerformanceInputWidget extends StatelessWidget {
  final String labelText;

  const PerformanceInputWidget({
    Key? key,
    required TextEditingController textController,
    required this.labelText,
  })  : _textController = textController,
        super(key: key);

  final TextEditingController _textController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: _textController,
      decoration: InputDecoration(
        labelText: labelText,
      ),
    );
  }
}
