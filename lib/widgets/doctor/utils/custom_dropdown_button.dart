// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomDropdownButton extends StatefulWidget {
  String label;
  List<String> items;
  String dropdownValue;
  Function? handleChange;

  CustomDropdownButton({
    Key? key,
    required this.label,
    required this.items,
    required this.dropdownValue,
    this.handleChange,
  }) : super(key: key);

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
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
            items: widget.items.map((item) {
              return DropdownMenuItem<String>(value: item, child: Text(item));
            }).toList(),
            // onChanged: (newValue) {
            //   setState(() {
            //     widget.dropdownValue = newValue as String;
            //     print(newValue.toString());
            //     print("${widget.dropdownValue} ::  new dp val");
            //   });
            // },
            onChanged: (value) {
              widget.handleChange!(value);
            }),
      ],
    );
  }
}
