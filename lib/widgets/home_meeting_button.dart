import 'package:doctor/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';


class HomeMeetingButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String text;
  const HomeMeetingButton(
      {required this.onPressed,
      required this.icon,
      required this.text,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                color: customblue,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.06),
                      offset: Offset(0, 4))
                ]),
            child: Icon( 
              icon,
              color: Colors.white,
              size: 30,
            ),
          ),
          SizedBox(height: 10),
          Text(text, style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}