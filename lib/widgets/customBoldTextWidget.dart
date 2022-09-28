import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class customBoldTextWidget extends StatelessWidget {
  final String text;
  final Color textColor;
  final double textSize;
  final String fontfamily;

  const customBoldTextWidget(
      {required this.text,
      required this.textColor,
      required this.textSize,
      this.fontfamily = "Poppins",
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: fontfamily,
        fontSize: textSize,
        color: textColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
