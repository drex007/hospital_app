import 'package:doctor/constants/color_constant.dart';
import 'package:doctor/widgets/customBoldTextWidget.dart';
import 'package:doctor/widgets/nurse/opdPatientWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../../utils/responsive.dart';

class NursesOpd extends StatefulWidget {
  const NursesOpd({Key? key}) : super(key: key);

  @override
  State<NursesOpd> createState() => _NursesOpdState();
}

class _NursesOpdState extends State<NursesOpd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.0.hp),
          child: AppBar(
            elevation: 0,
            backgroundColor: customWhiteBackground,
          )),
      backgroundColor: customWhiteBackground,
      body: ListView(
        children: [
          SizedBox(height: 3.0.hp),
          Padding(
            padding: EdgeInsets.only(left: 2.0.wp, bottom: 2.0.hp),
            child: customBoldTextWidget(
                text: "OPD Patients",
                textColor: Colors.black,
                textSize: 20.0.sp),
          ),
          OpdList(),
        ],
      ),
    );
  }
}
