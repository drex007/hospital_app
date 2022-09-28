import 'package:doctor/Services/doctorController/doctor_services.dart';
import 'package:doctor/constants/color_constant.dart';
import 'package:doctor/data/doctor_pramas.dart';
import 'package:doctor/model/patient_diagnosis_model.dart';
import 'package:doctor/repository/doctor_repository.dart';
import 'package:doctor/widgets/doctor/radiology_test_card.dart';
import 'package:doctor/widgets/doctor/tab_button.dart';
import 'package:doctor/widgets/modal/doctor_add_radiotest_modal.dart';
import 'package:doctor/widgets/modal/doctor_addother_radiotest_modal.dart';
import 'package:flutter/material.dart';
import 'package:doctor/utils/responsive.dart';
import 'package:get/get.dart';

class PatientRadiologyTestsPage extends StatefulWidget {
  final PatientDiagnosisModel data;
  const PatientRadiologyTestsPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<PatientRadiologyTestsPage> createState() =>
      _PatientRadiologyTestsPageState();
}

class _PatientRadiologyTestsPageState extends State<PatientRadiologyTestsPage>
    with TickerProviderStateMixin {
  DoctorServices _doctorController = Get.find();
  DoctorRepository _doctorRepository = Get.find();

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);

    _doctorController.getRadiologyTests(
        "${widget.data.diagnosedPatient!.pkid}/${widget.data.pkid}/");

    _doctorController.getRadiologyTestTypes();
    _doctorController.getRadiologyTestCategories();

    addTestHandler() {
      return showDialog(
        context: context,
        builder: (context) {
          return AddRadiologyTestModal(diagnosis: widget.data);
        },
      );
    }

    addOtherTestHandler() {
      return showDialog(
        context: context,
        builder: (context) {
          return AddOtherRadiologyTestModal(diagnosis: widget.data);
        },
      );
    }

    return Obx(
      () => ListView(
        shrinkWrap: true,
        // physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(
          left: 5.0.wp,
          right: 5.0.wp,
          bottom: 5.0.hp,
        ),
        children: [
          SizedBox(
            height: 1.0.hp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TabButton(
                label: 'Add',
                bgColor: Colors.deepPurpleAccent,
                onPressHandler: addTestHandler,
              ),
              SizedBox(
                width: 2.0.wp,
              ),
              TabButton(
                label: 'Add Other',
                bgColor: Color.fromARGB(255, 16, 6, 72),
                onPressHandler: addOtherTestHandler,
              ),
            ],
          ),
          SizedBox(
            height: 1.0.hp,
          ),
          Container(
            // height: MediaQuery.of(context).size.height /
            //     15 *
            //     prescriptions_list.length,
            padding: EdgeInsets.only(bottom: 2.0.hp),
            child: Center(
              child: TabBar(
                controller: _tabController,
                unselectedLabelStyle: TextStyle(
                  color: customblue,
                ),
                isScrollable: true,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 1),
                unselectedLabelColor: Colors.black,
                labelColor: customblue,
                tabs: [
                  Tab(text: 'Hospital Radiology Tests'),
                  Tab(text: 'Other Radiology Tests'),
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.75,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: _doctorRepository.radiologyTests.length,
                  physics: ScrollPhysics(),
                  itemBuilder: (_, index) {
                    return RadiologyTestCard(
                      radiologytest: _doctorRepository.radiologyTests[index],
                      testIndex: index,
                    );
                  },
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: _doctorRepository.otherRadiologyTests.length,
                  physics: ScrollPhysics(),
                  itemBuilder: (_, index) {
                    return RadiologyTestCard(
                      radiologytest:
                          _doctorRepository.otherRadiologyTests[index],
                      testIndex: index,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
