import 'package:doctor/Services/doctorController/doctor_services.dart';
import 'package:doctor/constants/color_constant.dart';
import 'package:doctor/data/doctor_pramas.dart';
import 'package:doctor/model/patient_diagnosis_model.dart';
import 'package:doctor/repository/doctor_repository.dart';
import 'package:doctor/widgets/doctor/laboratory_test_card.dart';
import 'package:doctor/widgets/doctor/tab_button.dart';
import 'package:doctor/widgets/modal/doctor_add_labtest_modal.dart';
import 'package:doctor/widgets/modal/doctor_addother_labtest_modal.dart';
import 'package:flutter/material.dart';
import 'package:doctor/utils/responsive.dart';
import 'package:get/get.dart';

class PatientLabTestsPage extends StatefulWidget {
  final PatientDiagnosisModel data;
  const PatientLabTestsPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<PatientLabTestsPage> createState() => _PatientLabTestsPageState();
}

class _PatientLabTestsPageState extends State<PatientLabTestsPage>
    with TickerProviderStateMixin {
  DoctorServices _doctorController = Get.find();
  DoctorRepository _doctorRepository = Get.find();

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);

    _doctorController.getPatientLabTests(
        "${widget.data.diagnosedPatient!.pkid}/${widget.data.pkid}/");

    _doctorController.getLabTestTypes();
    _doctorController.getLabTestCategories();
    _doctorController.getLabTestSamples();

    addTestHandler() {
      return showDialog(
        context: context,
        builder: (context) {
          return AddLabTestModal(diagnosis: widget.data);
        },
      );
    }

    addOtherTestHandler() {
      return showDialog(
        context: context,
        builder: (context) {
          return AddOtherLabTestModal(diagnosis: widget.data);
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
                  Tab(text: 'Hospital Laboratory Tests'),
                  Tab(text: 'Other Laboratory Tests'),
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
                  itemCount: _doctorRepository.laboratoryTests.length,
                  physics: ScrollPhysics(),
                  itemBuilder: (_, index) {
                    return LaboratoryTestCard(
                        labtest: _doctorRepository.laboratoryTests[index],
                        testIndex: index);
                  },
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: _doctorRepository.otherLaboratoryTests.length,
                  physics: ScrollPhysics(),
                  itemBuilder: (_, index) {
                    return LaboratoryTestCard(
                        labtest: _doctorRepository.otherLaboratoryTests[index],
                        testIndex: index);
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
