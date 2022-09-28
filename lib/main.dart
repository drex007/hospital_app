import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:doctor/Services/authController/login_controller.dart';
import 'package:doctor/Services/profile_controller/profile_controller.dart';
import 'package:doctor/constants/color_constant.dart';
import 'package:doctor/controller/generic_controller.dart';
import 'package:doctor/routes/page_routers.dart';
import 'package:doctor/ui/Dashboard/doctorsDashboard/doctor_dashboard.dart';
import 'package:doctor/ui/Dashboard/nurseDashboard/nurses_dashboard.dart';
import 'package:doctor/ui/LoginPage/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:doctor/utils/responsive.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   statusBarIconBrightness: Brightness.dark,
  //   statusBarColor: Colors.transparent,
  // ));

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GenericController _controller = Get.put(GenericController());
  // This widget is the root of your application.
  @override
  void initState() {
    _controller.callController();
    super.initState();
  }

  Widget build(BuildContext context) {
    final authStorage = GetStorage();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: AnimatedSplashScreen(
        splashTransition: SplashTransition.fadeTransition,
        // pageTransitionType: PageTransitionType.scale,
        backgroundColor: customblue,
        splash: Image.asset(
          "assets/images/kit.png",
          scale: 5.0,
          // fit: BoxFit.fill,
        ),
        nextScreen: authStorage.read("usersRole") == "doctor"
            ? DoctorsDashboard()
            : authStorage.read("usersRole") == "nurse"
                ? NursesDashboard()
                : LoginPage(),
      ),
      theme: ThemeData(
        colorScheme: ThemeData()
            .colorScheme
            .copyWith(primary: customblue.withOpacity(0.6)),
      ),
      builder: EasyLoading.init(),
      getPages: Pagerouter.getPages(),
    );
  }
}
