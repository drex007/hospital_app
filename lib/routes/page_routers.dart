import 'package:doctor/ui/Dashboard/doctorsDashboard/doctor_dashboard.dart';
import 'package:doctor/ui/Dashboard/nurseDashboard/nurses_dashboard.dart';
import 'package:doctor/ui/LoginPage/login.dart';
import 'package:get/get.dart';

class Pagerouter {
  static List<GetPage<dynamic>> getPages() {
    return [
      GetPage(name: "/doctorsDashboard", page: () => DoctorsDashboard()),
      GetPage(name: "/nursesDashboard", page: () => NursesDashboard()),
      GetPage(name: "/login", page: () => LoginPage()),
    ];
  }
}
