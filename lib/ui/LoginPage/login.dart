import 'package:doctor/Services/authController/login_controller.dart';
import 'package:doctor/constants/color_constant.dart';
import 'package:doctor/widgets/CustomPasswordInputWidget.dart';
import 'package:doctor/widgets/customInputTextWidget.dart';
import 'package:flutter/material.dart';
import 'package:doctor/utils/responsive.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: customblue,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.25),
        child: AppBar(
          shape: RoundedRectangleBorder(
              // borderRadius: BorderRadius.vertical(
              //   bottom: Radius.circular(40),
              // ),
              ),
          backgroundColor: customblue,
          shadowColor: Colors.white.withOpacity(0),
          flexibleSpace: Container(
            height: screenHeight * 0.25,
            width: screenWidth,
            padding: EdgeInsets.only(left: 4.0.wp),
            decoration: BoxDecoration(
              // color: Colors.blue.withOpacity(0.6),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // SizedBox(height: 2.0.hp),
                Container(
                  width: screenWidth * 0.5,
                  child: Text(
                    'Welcome back.',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  width: screenWidth * 0.4,
                  child: SvgPicture.asset('assets/images/illustration__1.svg'),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        height: screenHeight * 0.75,
        width: 100.0.wp,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10.0.hp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Log In",
                    style: TextStyle(
                      fontSize: 20.0.sp,
                      fontFamily: "Poppins",
                      color: customblue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 3.0.hp,
              ),
              CustomInputTextWidget(
                textController: emailTextController,
                hintText: "Enter email address",
                obscureText: false,
                prefixIcon: Icon(Icons.mail),
                ShowObscureTextIcon: false,
              ),
              SizedBox(
                height: 2.0.hp,
              ),
              CustomPasswordWidget(
                textController: passwordTextController,
                hintText: "Password",
                obscureText: true,
                prefixIcon: Icon(
                  Icons.lock,
                  // color: customblue,
                  size: 15.0.sp,
                ),
              ),
              SizedBox(
                height: 4.0.hp,
              ),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                  width: 90.0.wp,
                  height: 6.0.hp,
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(customblue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  onPressed: () => {
                    authController.login(
                      emailTextController.text,
                      passwordTextController.text,
                    ),
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 15.0.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
