import 'package:doctor/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../utils/responsive.dart';

class CustomPasswordWidget extends StatefulWidget {
  TextEditingController textController;
  String hintText;
  Icon prefixIcon;
  bool obscureText;
  CustomPasswordWidget(
      {Key? key,
      required this.textController,
      // required this.text,
      required this.hintText,
      required this.obscureText,
      required this.prefixIcon})
      : super(key: key);

  @override
  State<CustomPasswordWidget> createState() => _CustomPasswordWidgetState();
}

class _CustomPasswordWidgetState extends State<CustomPasswordWidget> {
  @override
  Widget build(BuildContext context) {
    TextEditingController();
    return Container(
      height: 7.0.hp,
      width: 90.0.wp,
      padding: EdgeInsets.symmetric(horizontal: 1.0.wp, vertical: 0.5.hp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: TextField(
        obscureText: widget.obscureText,
        controller: widget.textController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 17),
          prefixIcon: widget.prefixIcon,
          border: InputBorder.none,
          hintText: widget.hintText,
          suffixIcon: IconButton(
              onPressed: () => {
                    setState(() {
                      widget.obscureText = !widget.obscureText;
                    })
                  },
              icon: !widget.obscureText
                  ? Icon(
                      Icons.visibility,
                    )
                  : Icon(Icons.visibility_off)),
        ),
      ),
    );
  }
}
