// ignore_for_file: must_be_immutable

import 'package:doctor/model/drug_model.dart';
import 'package:doctor/repository/doctor_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrugDropdownButton extends StatefulWidget {
  String label;
  // List<DrugModel> items;
  String dropdownValue;
  Function? handleChange;

  CustomDrugDropdownButton({
    Key? key,
    required this.label,
    // required this.items,
    required this.dropdownValue,
    this.handleChange,
  }) : super(key: key);

  @override
  State<CustomDrugDropdownButton> createState() =>
      _CustomDrugDropdownButtonState();
}

class _CustomDrugDropdownButtonState extends State<CustomDrugDropdownButton> {
  DoctorRepository _doctorRepository = Get.find();

  @override
  Widget build(BuildContext context) {
    print("${_doctorRepository.drugs.length} drugs len");

    return Obx(
      () => Column(
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
              // value: widget.dropdownValue,
              value: widget.dropdownValue,
              icon: Icon(Icons.keyboard_arrow_down),
              items: _doctorRepository.drugs.map((item) {
                return DropdownMenuItem<String>(
                  value: "${item!.pkid}",
                  child: Text("${item!.name}"),
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
      ),
    );
  }
}
