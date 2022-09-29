import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/state_manager.dart';

class GenericRepository extends GetxController {
  RxList _employeesList = [].obs;
  RxList get employeesList => _employeesList;
}
