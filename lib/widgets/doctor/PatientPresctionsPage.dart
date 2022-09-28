import 'package:doctor/Services/doctorController/doctor_services.dart';
import 'package:doctor/constants/color_constant.dart';
import 'package:doctor/model/patient_diagnosis_model.dart';
import 'package:doctor/repository/doctor_repository.dart';
import 'package:doctor/widgets/doctor/prescription_card.dart';
import 'package:doctor/widgets/doctor/tab_button.dart';
import 'package:doctor/widgets/modal/doctor_addother_prescription_modal.dart';
import 'package:doctor/widgets/modal/doctor_addprescription_modal.dart';
import 'package:flutter/material.dart';
import 'package:doctor/utils/responsive.dart';
import 'package:get/get.dart';

class PatientPrescriptionsPage extends StatefulWidget {
  final PatientDiagnosisModel data;

  const PatientPrescriptionsPage({Key? key, required this.data})
      : super(key: key);

  @override
  State<PatientPrescriptionsPage> createState() =>
      _PatientPrescriptionsPageState();
}

class _PatientPrescriptionsPageState extends State<PatientPrescriptionsPage>
    with TickerProviderStateMixin {
  DoctorServices _doctorController = Get.find();
  DoctorRepository _doctorRepository = Get.find();

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);

    _doctorController.getPatientPrescriptions(
        "${widget.data.pkid}/${widget.data.diagnosedPatient!.pkid}/");

    _doctorController.getPatientOtherPrescriptions(
        "${widget.data.pkid}/${widget.data.diagnosedPatient!.pkid}/");

    addPrescriptionHandler() {
      _doctorController.showModal.value = true;
      return showDialog(
        context: context,
        builder: (context) {
          return AddPrescriptionModal(diagnosis: widget.data);
        },
      );
    }

    addOtherPrescriptionHandler() {
      _doctorController.showModal.value = true;
      return showDialog(
        context: context,
        builder: (context) {
          return AddOtherPrescriptionModal(diagnosis: widget.data);
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
                onPressHandler: addPrescriptionHandler,
              ),
              SizedBox(
                width: 2.0.wp,
              ),
              TabButton(
                label: 'Add Other',
                bgColor: Color.fromARGB(255, 16, 6, 72),
                onPressHandler: addOtherPrescriptionHandler,
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
                  Tab(text: 'Hospital Prescriptions'),
                  Tab(text: 'Other Prescriptions'),
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
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: _doctorRepository.patientPrescriptions.length,
                  physics: ScrollPhysics(),
                  itemBuilder: (_, index) {
                    return PrescriptionCard(
                        prescription:
                            _doctorRepository.patientPrescriptions[index],
                        prescriptionIndex: index);
                  },
                ),
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: _doctorRepository.patientOtherPrescriptions.length,
                  physics: ScrollPhysics(),
                  itemBuilder: (_, index) {
                    return PrescriptionCard(
                        prescription:
                            _doctorRepository.patientOtherPrescriptions[index],
                        prescriptionIndex: index);
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
