import 'package:flutter/material.dart';

class TextColumn extends StatelessWidget {
  final String textTop;
  final String textBottom;

  const TextColumn({
    Key? key,
    required this.textTop,
    required this.textBottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textTop,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          textBottom.length > 14
              ? textBottom.substring(0, 14) + '...'
              : textBottom,
          style: TextStyle(
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
