import 'package:doctor/model/bedSpace_Model.dart';
import 'package:doctor/model/wardModel.dart';
import 'package:doctor/ui/Dashboard/nurseDashboard/nurses_WardReport.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/state_manager.dart';

class NursesRepository extends GetxController {
  RxList<dynamic> _wardList = [].obs;
  RxList get wardList => _wardList;
  var diagnosisId = "";
  num bedSpaceCount = 0;

  // var bedSpaceList = [].obs;
  RxList<dynamic> _bedSpaceList = [].obs;
  RxList get bedSpaceList => _bedSpaceList;

  RxList<dynamic> _wardReports = [].obs;
  RxList get WardReport => _wardReports;

  RxList<dynamic> _opdList = [].obs;
  RxList get opdList => _opdList;

  RxList<dynamic> _patientDiagnosisList = [].obs;
  RxList get patientDiagnosisList => _patientDiagnosisList;

  RxString _patientPrescribedId = "".obs;
  RxString get patientPrescribedId => _patientPrescribedId;

  RxList<dynamic> _patientPerformanceData = [].obs;
  RxList get patientPerformanceData => _patientPerformanceData;

  RxList<dynamic> _patientDiagnosisPrescription = [].obs;
  RxList get patientDiagnosisPrescription => _patientDiagnosisPrescription;
}
