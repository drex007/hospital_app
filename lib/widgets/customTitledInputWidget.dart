import 'package:doctor/widgets/customSemiBoldTextWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import '../utils/responsive.dart';

class CustomTitledInputWidget extends StatelessWidget {
  final TextEditingController textController;
  final String textTitle;
  const CustomTitledInputWidget(
      {required this.textController, required this.textTitle, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.0.hp,
      width: 90.0.wp,
      padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 5,
          ),
          customSemiBoldTextWidget(
              text: textTitle, textColor: Colors.grey, textSize: 14.0.sp),
          Container(
            margin: EdgeInsets.only(top: 5),
            height: 6.0.hp,
            width: 90.0.wp,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border: Border.all(color: Colors.grey),
              color: Colors.white,
            ),
            child: TextField(
              decoration: InputDecoration(border: InputBorder.none),
              controller: textController,
            ),
          )
        ],
      ),
    );
  }
}
