import 'package:doctor/Services/nursesController/nurse_services.dart';
import 'package:doctor/constants/asset_path.dart';
import 'package:doctor/constants/url_paths.dart';
import 'package:doctor/repository/nurse_repo.dart';
import 'package:doctor/widgets/nurse/AdmittedPatientCard.dart';
import 'package:doctor/widgets/nurse/AdmittedPatientDetailsWiget.dart';
import 'package:doctor/widgets/nurse/opdPatientWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../utils/responsive.dart';
import 'package:get/get.dart';

class OpdList extends StatefulWidget {
  const OpdList({Key? key}) : super(key: key);

  @override
  State<OpdList> createState() => _OpdListState();
}

class _OpdListState extends State<OpdList> {
  NurseServices _nurseServices = Get.find();
  NursesRepository _nursesRepository = Get.find();
  @override
  void initState() {
    _nurseServices.opdPatients();

    super.initState();
  }

  Widget build(BuildContext context) {
    List<String> url = backendUrl.split("");
    var newUrl = url.removeLast();
    var assetUrl = url.join();

    return Obx(() => ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: _nursesRepository.opdList.length,
        itemBuilder: (_, index) {
          return InkWell(
              onTap: () => {
                    _nursesRepository.patientPrescribedId.value =
                        _nursesRepository
                            .opdList.value[index].patientPrescribed.id,
                    Get.to(() => OpdPatientDetailWidget(
                        patientId: _nursesRepository.opdList.value[index]
                            .diagnosis.diagnosedPatient.pkid,
                        patientName:
                            "${_nursesRepository.opdList.value[index].diagnosis.diagnosedPatient.firstName} ${_nursesRepository.opdList.value[index].diagnosis.diagnosedPatient.lastName}")),
                  },
              child: Container(
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
                          color: Colors.transparent),
                      child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(
                              "${assetUrl}${_nursesRepository.opdList.value[index].patientPrescribed.profilePhoto}")),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, top: 27),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${_nursesRepository.opdList.value[index].diagnosis.diagnosedPatient.firstName} ${_nursesRepository.opdList.value[index].diagnosis.diagnosedPatient.lastName}",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text(
                              "${_nursesRepository.opdList.value[index].patientPrescribed.gender}")
                        ],
                      ),
                    ),
                  ],
                ),
              ));
        }));
  }
}
