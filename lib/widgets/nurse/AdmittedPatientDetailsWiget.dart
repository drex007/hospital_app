import 'package:doctor/Services/nursesController/nurse_services.dart';
import 'package:doctor/constants/color_constant.dart';
import 'package:doctor/repository/nurse_repo.dart';
import 'package:doctor/widgets/modal/addPatientDiagnosisModal.dart';
import 'package:doctor/widgets/nurse/PatientDiagnosisList.dart';
import 'package:doctor/widgets/nurse/performanceDataPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../utils/responsive.dart';
import 'package:get/get.dart';

class OpdPatientDetailWidget extends StatefulWidget {
  final int patientId;
  final String patientName;
  const OpdPatientDetailWidget(
      {required this.patientId, required this.patientName, Key? key})
      : super(key: key);

  @override
  State<OpdPatientDetailWidget> createState() => _OpdPatientDetailWidgetState();
}

class _OpdPatientDetailWidgetState extends State<OpdPatientDetailWidget>
    with TickerProviderStateMixin {
  NurseServices _nurseServices = Get.find();
  NursesRepository _nursesRepository = Get.find();

  @override
  void initState() {
    super.initState();
    _nurseServices.getInjectionsRequest(widget.patientId);

    _nurseServices
        .getpatientPerformaceData(_nursesRepository.patientPrescribedId.value);
  }

  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return SafeArea(
      child: Scaffold(
        backgroundColor: customWhiteBackground,
        body: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            SizedBox(
              height: 15,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              IconButton(
                  onPressed: () => {Get.back()}, icon: Icon(Icons.arrow_back)),
              Text(
                widget.patientName,
                style: TextStyle(
                    fontFamily: "Poppins", fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: EdgeInsets.only(right: 3.0.wp),
                child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: customblue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: IconButton(
                          onPressed: () {
                            _nurseServices.showModal.value == true;
                            print(_nurseServices.showModal.value);
                            showDialog(
                                context: context,
                                builder: (BuildContext) =>
                                    AddPatientDiagnosisModal());
                          },
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          )),
                    )),
              )
            ]),
            SizedBox(
              height: 2.0.hp,
            ),
            TabBar(
                // unselectedLabelStyle: TextStyle(
                //     color: customblue, backgroundColor: Colors.black26),
                isScrollable: true,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 4),
                unselectedLabelColor: Colors.black,
                labelPadding:
                    EdgeInsets.symmetric(horizontal: 15.0.wp, vertical: 10),
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(25), // Creates border
                    color: customblue),
                controller: _tabController,
                tabs: [Text("Diagnosis"), Text("Performance data")]),
            SizedBox(
              height: 10,
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.8,
                width: 90.0.wp,
                child: TabBarView(
                    controller: _tabController,
                    children: [PatientDiagnosisList(), PerformanceDataPage()]))
          ],
        ),
      ),
    );
  }
}
