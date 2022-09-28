import 'package:doctor/constants/color_constant.dart';
import 'package:doctor/widgets/customSemiBoldTextWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../utils/responsive.dart';

class AddPatientPerformanceModal extends StatefulWidget {
  const AddPatientPerformanceModal({Key? key}) : super(key: key);

  @override
  State<AddPatientPerformanceModal> createState() =>
      _AddPatientPerformanceModalState();
}

class _AddPatientPerformanceModalState
    extends State<AddPatientPerformanceModal> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      content: Container(
          height: 180,
          width: 90.0.wp,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customSemiBoldTextWidget(
                  text: "Add Diagnosis",
                  textColor: Colors.black,
                  textSize: 15.0.sp),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 45,
                  width: 80.0.wp,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all()),
                  child: Text("hiii")),
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
                        onPressed: () => {},
                        child: Text("Submit")),
                  )
                ],
              )
            ],
          )),
    );
  }
}
