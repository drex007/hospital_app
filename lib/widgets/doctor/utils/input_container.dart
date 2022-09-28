import 'package:flutter/material.dart';
import 'package:doctor/utils/responsive.dart';

class InputContainer extends StatelessWidget {
  final String label;
  final String inputType;
  final String borderType;
  final TextEditingController? valueController;

  const InputContainer({
    Key? key,
    required this.label,
    required this.inputType,
    required this.borderType,
    this.valueController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        // SizedBox(
        //   height: 0.5.hp,
        // ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 4.0.wp,
          ),
          decoration: BoxDecoration(
            border: borderType == 'all'
                ? Border.all(
                    color: Colors.grey.shade200,
                  )
                : Border(
                    bottom: BorderSide(
                      color: Colors.grey.shade200,
                    ),
                  ),
            borderRadius:
                borderType == 'all' ? BorderRadius.circular(10) : null,
          ),
          child: TextField(
            controller: valueController,
            keyboardType: inputType == 'number'
                ? TextInputType.number
                : TextInputType.name,
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
