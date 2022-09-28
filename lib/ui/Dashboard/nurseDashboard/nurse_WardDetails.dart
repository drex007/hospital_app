import 'package:doctor/Services/nursesController/nurse_services.dart';
import 'package:doctor/constants/color_constant.dart';
import 'package:doctor/repository/nurse_repo.dart';
import 'package:doctor/ui/Dashboard/nurseDashboard/nurse_wardBedspaces.dart';
import 'package:doctor/ui/Dashboard/nurseDashboard/nurses_WardReport.dart';
import 'package:doctor/widgets/modal/addWardReportModal.dart';
import 'package:doctor/widgets/nurse/PatientDiagnosisList.dart';
import 'package:doctor/widgets/nurse/performanceDataPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:doctor/utils/responsive.dart';

class WardDetails extends StatefulWidget {
  final String wardName;
  final String wardId;

  const WardDetails({required this.wardName, required this.wardId, Key? key})
      : super(key: key);

  @override
  State<WardDetails> createState() => _WardDetailsState();
}

class _WardDetailsState extends State<WardDetails>
    with TickerProviderStateMixin {
  NursesRepository _nursesRepository = Get.find();
  NurseServices _nurseController = Get.find();
  @override
  initState() {
    setState(() {
      _nurseController.getWardBespaces(this.widget.wardName);
    });

    super.initState();
  }

  @override
  void dispose() {
    _nursesRepository.WardReport.clear();
    _nursesRepository.bedSpaceList.clear();
    super.dispose();
  }

  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      backgroundColor: customWhiteBackground,
      body: ListView(
        // physics: NeverScrollableScrollPhysics(),
        children: [
          SizedBox(
            height: 15,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () => {Get.back()},
                  icon: Icon(
                    Icons.arrow_back,
                    color: customblue,
                    size: 25.0.sp,
                  )),
              SizedBox(
                width: 25.0.wp,
              ),
              Text(
                this.widget.wardName,
                style: TextStyle(fontSize: 20.0.sp),
              ),
              // Padding(
              //     padding: EdgeInsets.only(right: 2.0.wp),
              //     child: InkWell(
              //       onTap: () => {
              //         showDialog(
              //             context: context,
              //             barrierDismissible: false,
              //             builder: (context) {
              //               return AddWardReportModal();
              //             })
              //       },
              //       child: Container(
              //         height: 30,
              //         width: 30,
              //         decoration: BoxDecoration(
              //             color: customblue.withOpacity(0.7),
              //             borderRadius: BorderRadius.circular(10)),
              //         child: Center(
              //             child: Icon(
              //           Icons.add,
              //           color: Colors.white,
              //         )),
              //       ),
              //     ))
            ],
          ),
          SizedBox(height: 10),
          TabBar(
              isScrollable: true,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 4),
              unselectedLabelColor: Colors.black,
              labelPadding:
                  EdgeInsets.symmetric(horizontal: 15.0.wp, vertical: 10),
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(25), // Creates border
                  color: customblue),
              controller: _tabController,
              tabs: [Text("Bed spaces"), Text("Ward reports")]),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
                height: MediaQuery.of(context).size.height * 0.8,
                width: 95.0.wp,
                child: TabBarView(controller: _tabController, children: [
                  BedSpaces(),
                  WardReport(
                    wardId: this.widget.wardId,
                  )
                ])),
          )
        ],
      ),
    );
  }
}
