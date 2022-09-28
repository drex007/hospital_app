import 'package:doctor/Services/profile_controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:get/get.dart';

class JitsiMeetMethods {
  ProfileController _profileController = Get.find();

  void createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String username = "",
  }) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution.MD_RESOLUTION;
      // Limit video resolution to 360p
      String name;
      if (!username.isEmpty) {
        name = "${_profileController.userProfile.value.profile?.fullName}";
      } else {
        name = username;
      }

      var options = JitsiMeetingOptions(room: roomName)
        ..userDisplayName = name
        ..userEmail = _profileController.userProfile.value.profile?.email
        ..userAvatarURL =
            _profileController.userProfile.value.profile?.profilePhoto
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted;
      // ..audioOnly = true
      // ..room = "myroom" // Required, spaces will be trimmed
      // ..serverURL = "https://someHost.com"
      // ..subject = "Meeting with Gunschu"
      // ..featureFlag = featureFlag;

      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      print("error: $error");
    }
  }
}
