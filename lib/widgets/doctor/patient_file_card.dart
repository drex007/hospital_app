import 'package:doctor/model/patientfile_model.dart';
import 'package:doctor/widgets/doctor/text_column.dart';
import 'package:flutter/material.dart';
import 'package:doctor/utils/responsive.dart';

class PatientFileCard extends StatelessWidget {
  final PatientFileModel fileData;
  final int testIndex;

  const PatientFileCard({
    Key? key,
    required this.fileData,
    required this.testIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0.wp,
      height: 10.0.hp,
      padding: EdgeInsets.symmetric(horizontal: 5.0.wp, vertical: 3.0.hp),
      margin: EdgeInsets.only(bottom: 2.0.hp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade200, blurRadius: 1, spreadRadius: 1)
        ],
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text((testIndex + 1).toString()),
          SizedBox(width: 10.0.wp),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextColumn(
                    textTop: 'Title',
                    textBottom: "${fileData.title}",
                  ),
                  SizedBox(width: 15.0.wp),
                  TextColumn(
                    textTop: 'Date',
                    textBottom: "${fileData.createdAt}",
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
