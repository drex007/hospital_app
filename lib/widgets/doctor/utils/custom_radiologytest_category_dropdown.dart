// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

class CustomRadiologyTestCategoryDropdownButton extends StatefulWidget {
  String label;
  String dropdownValue;
  List categories;
  Function? handleChange;

  CustomRadiologyTestCategoryDropdownButton({
    Key? key,
    this.handleChange,
    required this.label,
    required this.categories,
    required this.dropdownValue,
  }) : super(key: key);

  @override
  State<CustomRadiologyTestCategoryDropdownButton> createState() =>
      _CustomRadiologyTestCategoryDropdownButtonState();
}

class _CustomRadiologyTestCategoryDropdownButtonState
    extends State<CustomRadiologyTestCategoryDropdownButton> {
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
