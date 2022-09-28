import 'package:doctor/constants/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../utils/responsive.dart';

class AdmittedPatientCard extends StatelessWidget {
  const AdmittedPatientCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.0.hp,
      width: 90.0.wp,
      margin: EdgeInsets.symmetric(horizontal: 2.0.wp, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 0.5,
            spreadRadius: -1,
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(top: 0.5.hp, left: 2.0.wp),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200),
            ),
            child: CircleAvatar(backgroundImage: AssetImage(profilePic)),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, top: 27),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text("Hillary Adeleke Elizabeth"), Text("Female")],
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.only(left: 20.0.wp),
          //   child: ElevatedButton(onPressed: () => {}, child: Text("Admit")),
          // )
        ],
      ),
    );
  }
}
