// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomLabTestCategoryButton extends StatefulWidget {
  String label;
  String dropdownValue;
  List categories;
  Function? handleChange;

  CustomLabTestCategoryButton({
    Key? key,
    this.handleChange,
    required this.label,
    required this.dropdownValue,
    required this.categories,
  }) : super(key: key);

  @override
  State<CustomLabTestCategoryButton> createState() =>
      _CustomLabTestCategoryButtonState();
}

class _CustomLabTestCategoryButtonState
    extends State<CustomLabTestCategoryButton> {
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
            items: widget.categories.map((item) {
              return DropdownMenuItem<String>(
                value: "${item.pkid}",
                child: Text("${item.title}"),
              );
            }).toList(),
            onChanged: (value) {
              widget.handleChange!(int.parse(value.toString()));
            }),
      ],
    );
  }
}
