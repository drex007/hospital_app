import 'package:doctor/model/radiologytest_model.dart';
import 'package:doctor/widgets/doctor/text_column.dart';
import 'package:flutter/material.dart';
import 'package:doctor/utils/responsive.dart';

class RadiologyTestCard extends StatelessWidget {
  final RadiologyTestModel radiologytest;
  final int testIndex;

  const RadiologyTestCard({
    Key? key,
    required this.radiologytest,
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
                    textTop: 'Test Type',
                    textBottom: "${radiologytest.testType}",
                  ),
                  SizedBox(width: 10.0.wp),
                  TextColumn(
                    textTop: 'Category',
                    textBottom: "${radiologytest.testCategory}",
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
