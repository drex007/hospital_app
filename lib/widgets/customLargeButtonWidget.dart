import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import '../utils/responsive.dart';

class CustomLargeButtomWidget extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  const CustomLargeButtomWidget(
      {required this.buttonText,
      required this.buttonColor,
      required this.textColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.0.hp,
      width: 90.0.wp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: buttonColor,
      ),
      child: Center(
        child: Text(
          buttonText,
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 20.0.sp,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
