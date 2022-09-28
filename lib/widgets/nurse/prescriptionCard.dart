import 'package:doctor/repository/nurse_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:doctor/utils/responsive.dart';
import 'package:get/get.dart';

class PrescriptionCard extends StatefulWidget {
  final int Index;
  const PrescriptionCard({required this.Index, Key? key}) : super(key: key);

  @override
  State<PrescriptionCard> createState() => _PrescriptionCardState();
}

class _PrescriptionCardState extends State<PrescriptionCard> {
  NursesRepository _nursesRepository = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          height: 15.0.hp,
          width: 90.0.wp,
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(blurRadius: 0.5, spreadRadius: -1)]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 20,
                width: 20,
                margin: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: Text((widget.Index + 1).toString())),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.0.wp, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Drug",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Route",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Unit",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Frequency",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.0.wp, vertical: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${_nursesRepository.patientDiagnosisPrescription.value[widget.Index].drugs}",
                    ),
                    Text(
                      "${_nursesRepository.patientDiagnosisPrescription.value[widget.Index].routes}",
                    ),
                    Text(
                      "${_nursesRepository.patientDiagnosisPrescription.value[widget.Index].units}",
                    ),
                    Text(
                      "${_nursesRepository.patientDiagnosisPrescription.value[widget.Index].frequency}",
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.0.wp, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Dosage form",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Injection count",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Times administered",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "duration",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.0.wp, vertical: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${_nursesRepository.patientDiagnosisPrescription.value[widget.Index].dosageForm}",
                    ),
                    Text(
                      "${_nursesRepository.patientDiagnosisPrescription.value[widget.Index].injectionCount}",
                    ),
                    Text(
                      "${_nursesRepository.patientDiagnosisPrescription.value[widget.Index].times}",
                    ),
                    Text(
                      "${_nursesRepository.patientDiagnosisPrescription.value[widget.Index].duration}",
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
