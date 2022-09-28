import 'package:doctor/Services/authController/login_controller.dart';
import 'package:doctor/constants/asset_path.dart';
import 'package:doctor/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../utils/responsive.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userRole;
  final String usersName;
  final String profileImagePath;
  const CustomAppBar(
      {required this.userRole,
      required this.usersName,
      required this.profileImagePath,
      Key? key})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  Widget build(BuildContext context) {
    AuthController authController = Get.find();
    return AppBar(
      backgroundColor: customblue,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${userRole} Dashboard",
            style: TextStyle(fontSize: 11.0.sp),
          ),
          Text(
            usersName,
            style: TextStyle(fontSize: 11.0.sp),
          ),
        ],
      ),
      titleSpacing: 0,
      leading: Container(
        height: 10,
        width: 10,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          image: DecorationImage(
            scale: 1.0,
            fit: BoxFit.cover,
            image: NetworkImage(
              profileImagePath,
            ),
          ),
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: GestureDetector(
              onTap: () => {authController.logout()},
              child: Icon(Icons.logout)),
        )
      ],
    );
  }
}
