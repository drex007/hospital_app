import 'package:doctor/widgets/customSemiBoldTextWidget.dart';
import 'package:flutter/material.dart';
import '../utils/responsive.dart';

class CustomIconInputWidget extends StatelessWidget {
  final String textTitle;
  final Icon icon;

  const CustomIconInputWidget(
      {required this.icon, required this.textTitle, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 7.0.wp, top: 3.0.hp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              icon,
              SizedBox(
                width: 3.0.hp,
              ),
              Text(
                textTitle,
                style: TextStyle(color: Colors.grey, fontSize: 15.0.sp),
              ),
            ],
          )
        ],
      ),
    );
  }
}
