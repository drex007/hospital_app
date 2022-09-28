import 'package:doctor/Services/nursesController/nurse_services.dart';
import 'package:doctor/constants/color_constant.dart';
import 'package:doctor/repository/nurse_repo.dart';
import 'package:doctor/ui/Dashboard/nurseDashboard/nurse_WardDetails.dart';
import 'package:doctor/widgets/customBoldTextWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../../utils/responsive.dart';
import 'package:get/get.dart';

class NursesWard extends StatefulWidget {
  const NursesWard({Key? key}) : super(key: key);

  @override
  State<NursesWard> createState() => _NursesWardState();
}

class _NursesWardState extends State<NursesWard> with TickerProviderStateMixin {
  NurseServices _nurseController = Get.find();
  NursesRepository _nursesRepository = Get.find();

  @override
  void initState() {
    _nurseController.getWardList();
    setState(() {});
    super.initState();
  }

  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return Obx(
      () => Scaffold(
        appBar: PreferredSize(
            child: AppBar(
              backgroundColor: customWhiteBackground,
              elevation: 0,
            ),
            preferredSize: Size.fromHeight(0.0.hp)),
        backgroundColor: customWhiteBackground,
        body: ListView(
          children: [
            SizedBox(
              height: 3.0.hp,
            ),
            Padding(
              padding: EdgeInsets.only(left: 2.0.wp),
              child: customBoldTextWidget(
                  text: "Ward List",
                  textColor: Colors.black,
                  textSize: 20.0.sp),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _nursesRepository.wardList.value.length,
              itemBuilder: (_, index) {
                return InkWell(
                  onTap: () => {
                    Get.to(() => WardDetails(
                          wardName:
                              _nursesRepository.wardList.value[index].name,
                          wardId: _nursesRepository.wardList.value[index].id,
                        )),
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(blurRadius: 0.5, spreadRadius: -1)
                        ]),
                    height: 8.0.hp,
                    margin: EdgeInsets.symmetric(
                        horizontal: 2.0.wp, vertical: 0.5.hp),
                    width: 90.0.wp,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child:
                                    Center(child: Text((index + 1).toString())),
                              ),
                              SizedBox(width: 10),
                              Text(_nursesRepository.wardList.value[index].name
                                  .toString()),
                            ],
                          ),
                          Container(
                            height: 20,
                            width: 80,
                            margin: EdgeInsets.only(right: 2.0.wp),
                            decoration: BoxDecoration(
                              color: index.isEven
                                  ? Colors.grey.withOpacity(0.4)
                                  : Colors.blueAccent.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: Text(
                              "${_nursesRepository.wardList.value[index].totalBedSpace.toString()} beds",
                            )),
                          ),
                        ]),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
