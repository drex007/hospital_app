import 'package:doctor/model/labtest_model.dart';
import 'package:doctor/widgets/doctor/text_column.dart';
import 'package:flutter/material.dart';
import 'package:doctor/utils/responsive.dart';

class LaboratoryTestCard extends StatelessWidget {
  final LaboratoryTestModel labtest;
  final int testIndex;

  const LaboratoryTestCard({
    Key? key,
    required this.labtest,
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
          SizedBox(width: 5.0.wp),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextColumn(
                    textTop: 'Test Type',
                    textBottom: "${labtest.testType}",
                  ),
                  SizedBox(width: 8.0.wp),
                  TextColumn(
                    textTop: 'Category',
                    textBottom: "${labtest.testCategory}",
                  ),
                  SizedBox(width: 2.0.wp),
                  TextColumn(
                    textTop: 'Sample',
                    textBottom: "${labtest.testSample}",
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
