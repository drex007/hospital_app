import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MeetingOption extends StatelessWidget {
  const MeetingOption(
      {required this.text,
      required this.isMute,
      required this.onChange,
      Key? key})
      : super(key: key);
  final String text;
  final bool isMute;
  final Function(bool) onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.black12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Switch.adaptive(value: isMute, onChanged: onChange)
        ],
      ),
    );
  }
}
