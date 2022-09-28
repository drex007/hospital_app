import 'package:flutter/material.dart';
import 'package:doctor/utils/responsive.dart';

class TabButton extends StatelessWidget {
  final String label;
  final Color bgColor;
  final Function? onPressHandler;

  const TabButton({
    Key? key,
    required this.label,
    required this.bgColor,
    this.onPressHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressHandler!(),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(bgColor),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(horizontal: 5.0.wp),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
    );
  }
}
