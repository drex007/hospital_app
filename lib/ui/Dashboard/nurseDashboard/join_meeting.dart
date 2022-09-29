import 'package:doctor/Services/jitsi_methods.dart';
import 'package:doctor/Services/profile_controller/profile_controller.dart';
import 'package:doctor/constants/color_constant.dart';
import 'package:doctor/ui/Dashboard/nurseDashboard/meeting_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:get/get.dart';

class JoinMeeting extends StatefulWidget {
  const JoinMeeting({Key? key}) : super(key: key);

  @override
  State<JoinMeeting> createState() => _JoinMeetingState();
}

class _JoinMeetingState extends State<JoinMeeting> {
  ProfileController _profileController = Get.find();
  late TextEditingController meetingIdController;
  late TextEditingController nameController;
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  bool isAudioMuted = true;
  bool isVideoMuted = true;
  
  @override
  initState() {
    meetingIdController = TextEditingController();
    nameController = TextEditingController(
        text: _profileController.userProfile.value.profile?.fullName);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    meetingIdController.dispose();
    nameController.dispose();
    JitsiMeet.removeAllListeners();
  }

  _joinMeting() {
    _jitsiMeetMethods.createMeeting(
        roomName: meetingIdController.text,
        isAudioMuted: isAudioMuted,
        isVideoMuted: isVideoMuted,
        username: nameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: customblue,
        title: Text(
          "Join a meeting ",
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            controller: meetingIdController,
            maxLines: 1,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                fillColor: Colors.black12,
                filled: true,
                border: InputBorder.none,
                hintText: "Enter Room ID"),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: nameController,
            readOnly: true,
            maxLines: 1,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                fillColor: Colors.black12,
                filled: true,
                border: InputBorder.none,
                hintText: "Name"),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () => _joinMeting(),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6), color: customblue),
                child: Center(
                  child: Text(
                    "Click to join",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          MeetingOption(
            text: "Mute audio",
            isMute: isAudioMuted,
            onChange: onAudioMuted,
          ),
          MeetingOption(
            text: "Turn off video",
            isMute: isVideoMuted,
            onChange: onVideoMuted,
          )
        ],
      ),
    );
  }

  onAudioMuted(bool? val) {
    setState(() {
      isAudioMuted = val!;
    });
  }

  onVideoMuted(bool? val) {
    setState(() {
      isVideoMuted = val!;
    });
  }
}
