import 'package:flutter/material.dart';
import 'package:doctor/utils/responsive.dart';

class CustomButton extends StatefulWidget {
  final String label;

  const CustomButton({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
      ),
      child: Text(
        widget.label,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
