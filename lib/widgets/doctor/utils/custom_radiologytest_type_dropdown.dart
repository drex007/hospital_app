// ignore_for_file: must_be_immutable

import 'package:doctor/repository/doctor_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomRadiologyTestTypeDropdownButton extends StatefulWidget {
  String label;
  String dropdownValue;
  Function? handleChange;

  CustomRadiologyTestTypeDropdownButton({
    Key? key,
    required this.label,
    required this.dropdownValue,
    this.handleChange,
  }) : super(key: key);

  @override
  State<CustomRadiologyTestTypeDropdownButton> createState() =>
      _CustomRadiologyTestTypeDropdownButtonState();
}

class _CustomRadiologyTestTypeDropdownButtonState
    extends State<CustomRadiologyTestTypeDropdownButton> {
  DoctorRepository _doctorRepository = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        DropdownButton(
            isExpanded: true,
            value: widget.dropdownValue,
            icon: Icon(Icons.keyboard_arrow_down),
            items: _doctorRepository.radiologyTestTypes.map((item) {
              return DropdownMenuItem<String>(
                value: "${item!.pkid}",
                child: Text("${item!.title}"),
              );
            }).toList(),
            onChanged: (value) {
              widget.handleChange!(int.parse(value.toString()));
            }),
      ],
    );
  }
}
