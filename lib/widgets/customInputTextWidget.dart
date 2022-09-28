import 'package:flutter/material.dart';
import 'package:doctor/utils/responsive.dart';

class CustomInputTextWidget extends StatelessWidget {
  TextEditingController textController;
  String hintText;
  Icon prefixIcon;
  bool ShowObscureTextIcon;
  // String text;
  bool obscureText;
  CustomInputTextWidget({
    Key? key,
    required this.textController,
    // required this.text,
    required this.hintText,
    required this.obscureText,
    required this.ShowObscureTextIcon,
    required this.prefixIcon,
  }) : super(key: key);

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
        textInputAction: TextInputAction.next,
        obscureText: obscureText,
        controller: textController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 17),
          prefixIcon: prefixIcon,
          border: InputBorder.none,
          hintText: hintText,
          suffixIcon: ShowObscureTextIcon
              ? GestureDetector(
                  onTap: () => {!obscureText, print(obscureText)},
                  child: Icon(Icons.remove_red_eye_outlined),
                )
              : Text(""),
        ),
      ),
    );
  }
}
