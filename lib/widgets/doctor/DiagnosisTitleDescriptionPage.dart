import 'package:doctor/model/patient_diagnosis_model.dart';
import 'package:doctor/widgets/doctor/tab_button.dart';
import 'package:flutter/material.dart';
import '../../utils/responsive.dart';

class DiagnosisTitleDescriptionPage extends StatelessWidget {
  final PatientDiagnosisModel data;

  const DiagnosisTitleDescriptionPage({Key? key, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController =
        TextEditingController(text: data.diagnosisName);
    TextEditingController descriptionController =
        TextEditingController(text: data.description);

    return Container(
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
            height: 2.0.hp,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     TabButton(
          //       label: 'Save',
          //       bgColor: Colors.deepPurpleAccent,
          //     ),
          //   ],
          // ),
          Container(
            height: 5.0.hp,
            width: 100.0.wp,
            // margin: EdgeInsets.symmetric(horizontal: 2.0.wp),
            padding: EdgeInsets.symmetric(
              horizontal: 5.0.wp,
            ),
            child: TextField(
              readOnly: true,
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
            height: 83.0.hp,
            width: 100.0.wp,
            // margin: EdgeInsets.symmetric(horizontal: 2.0.wp),
            padding: EdgeInsets.symmetric(horizontal: 5.0.wp, vertical: 0.5.hp),
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
              readOnly: true,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Diagnosis description',
                  hintStyle: TextStyle(fontSize: 14)
                  // labelStyle: TextStyle(
                  //   fontSize: 50,
                  // ),
                  // labelText: descriptionController.text.trim(),
                  ),
              controller: descriptionController,
              maxLines: 100,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
