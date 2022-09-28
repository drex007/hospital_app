// ignore_for_file: must_be_immutable

import 'package:doctor/repository/doctor_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomLabTestTypeButton extends StatefulWidget {
  String label;
  String dropdownValue;
  Function? handleChange;

  CustomLabTestTypeButton({
    Key? key,
    required this.label,
    required this.dropdownValue,
    this.handleChange,
  }) : super(key: key);

  @override
  State<CustomLabTestTypeButton> createState() =>
      _CustomLabTestTypeButtonState();
}

class _CustomLabTestTypeButtonState extends State<CustomLabTestTypeButton> {
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
            items: _doctorRepository.laboratoryTestTypes.map((item) {
              return DropdownMenuItem<String>(
                value: "${item!.pkid}",
                child: Text("${item!.typeTitle}"),
              );
            }).toList(),
            // onChanged: (newValue) {
            //   setState(() {
            //     widget.dropdownValue = newValue as String;
            //     print(newValue.toString());
            //     print("${widget.dropdownValue} ::  new dp val");
            //   });
            // },
            onChanged: (value) {
              widget.handleChange!(int.parse(value.toString()));
            }),
      ],
    );
  }
}
