// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomLabTestSampleButton extends StatefulWidget {
  String label;
  String dropdownValue;
  Function? handleChange;
  List samples;

  CustomLabTestSampleButton({
    Key? key,
    this.handleChange,
    required this.label,
    required this.dropdownValue,
    required this.samples,
  }) : super(key: key);

  @override
  State<CustomLabTestSampleButton> createState() =>
      _CustomLabTestSampleButtonState();
}

class _CustomLabTestSampleButtonState extends State<CustomLabTestSampleButton> {
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
            items: widget.samples.map((item) {
              return DropdownMenuItem<String>(
                value: "${item!.pkid}",
                child: Text("${item!.sampleType}"),
              );
            }).toList(),
            onChanged: (value) {
              widget.handleChange!(int.parse(value.toString()));
            }),
      ],
    );
  }
}
