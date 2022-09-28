import 'package:doctor/model/patient_prescription_model.dart';
import 'package:doctor/widgets/doctor/text_column.dart';
import 'package:flutter/material.dart';
import 'package:doctor/utils/responsive.dart';

class PrescriptionCard extends StatelessWidget {
  final PrescriptionModel prescription;
  final int prescriptionIndex;

  const PrescriptionCard({
    Key? key,
    required this.prescription,
    required this.prescriptionIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0.wp,
      height: 15.0.hp,
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
        children: [
          Text((prescriptionIndex + 1).toString()),
          SizedBox(width: 8.0.wp),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextColumn(
                    textTop: 'Drug',
                    textBottom: "${prescription.drugs}",
                  ),
                  SizedBox(width: 15.0.wp),
                  TextColumn(
                    textTop: 'Route',
                    textBottom: "${prescription.routes}",
                  ),
                  SizedBox(width: 15.0.wp),
                  TextColumn(
                    textTop: 'Units',
                    textBottom: "${prescription.units}",
                  ),
                ],
              ),
              SizedBox(height: 2.0.hp),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextColumn(
                    textTop: 'Frequency',
                    textBottom: "${prescription.frequency}",
                  ),
                  SizedBox(width: 10.0.wp),
                  TextColumn(
                    textTop: 'Duration',
                    textBottom: "${prescription.duration}",
                  ),
                  SizedBox(width: 15.0.wp),
                  TextColumn(
                    textTop: 'Times',
                    textBottom: "${prescription.durationTime}",
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
