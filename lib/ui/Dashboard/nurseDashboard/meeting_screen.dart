import 'dart:math';

import 'package:doctor/Services/jitsi_methods.dart';
import 'package:doctor/constants/color_constant.dart';
import 'package:doctor/ui/Dashboard/nurseDashboard/join_meeting.dart';
import 'package:doctor/widgets/home_meeting_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({Key? key}) : super(key: key);
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

  createNewMeeting() {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMeetMethods.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  // joinMeeting(BuildContext context) {
  //   Navigator.pushNamed(context, '/video-call');
  // }
  joinMeeting() {
    Get.to(() => JoinMeeting());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   title: Text("Call"),
      //   backgroundColor: customblue,
      // ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            HomeMeetingButton(
                onPressed: createNewMeeting,
                text: "New Meeting",
                icon: Icons.videocam),
            HomeMeetingButton(
                onPressed: () => joinMeeting(),
                text: "Join Meeting",
                icon: Icons.add_box_rounded),
          ]),
          Expanded(
            child: Center(
              child: Text(
                "Create or join meeting with just a click",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
