import 'package:doctor/constants/color_constant.dart';
import 'package:doctor/ui/Dashboard/nurseDashboard/meeting_screen.dart';
import 'package:doctor/widgets/call_user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:doctor/utils/responsive.dart';

class CommunicationScreen extends StatefulWidget {
  const CommunicationScreen({Key? key}) : super(key: key);

  @override
  State<CommunicationScreen> createState() => _CommunicationScreenState();
}

class _CommunicationScreenState extends State<CommunicationScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
            isScrollable: true,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 4),
            unselectedLabelColor: Colors.black,
            labelPadding:
                EdgeInsets.symmetric(horizontal: 15.0.wp, vertical: 10),
            indicator: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(25), // Creates border
                color: customblue),
            padding: EdgeInsets.only(top: 4.0.hp, bottom: 10),
            controller: _tabController,
            tabs: [Text("Single Call"), Text("Conference call")]),
      ),
      body: TabBarView(
          controller: _tabController,
          children: [UsersToCallScreen(), MeetingScreen()]),
    );
  }
}
