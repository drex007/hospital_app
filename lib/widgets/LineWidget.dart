import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:doctor/utils/responsive.dart';

class LineWidget extends StatelessWidget {
  const LineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 2.5.hp),
      height: 1,
      color: Colors.black.withOpacity(0.3),
      width: MediaQuery.of(context).size.height,
    );
  }
}
