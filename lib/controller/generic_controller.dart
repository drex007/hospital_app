import 'package:doctor/Services/authController/login_controller.dart';
import 'package:doctor/Services/doctorController/doctor_services.dart';
import 'package:doctor/Services/nursesController/nurse_services.dart';
import 'package:doctor/Services/profile_controller/profile_controller.dart';
import 'package:doctor/repository/doctor_repository.dart';
import 'package:doctor/repository/nurse_repo.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';

class GenericController extends GetxController {
  callController() {
    NursesRepository nursesRepository = Get.put(NursesRepository());
    LoginRedirectController _redirectUser = Get.put(LoginRedirectController());
    AuthController authController = Get.put(AuthController());
    ProfileController _profile = Get.put(ProfileController());
    NurseServices _nurseServices = Get.put(NurseServices());
    DoctorRepository doctorRepository = Get.put(DoctorRepository());
    DoctorServices _doctorServices = Get.put(DoctorServices());
  }
}
