import 'package:doctor/Services/jitsi_methods.dart';
import 'package:doctor/Services/profile_controller/profile_controller.dart';
import 'package:doctor/constants/url_paths.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:doctor/utils/responsive.dart';
import 'package:jitsi_meet/jitsi_meet.dart';

class SocketServices extends GetxController {
  late IO.Socket socket;
  final ProfileController _profileController = Get.find();
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

  bool isAudioMuted = true; 
  bool isVideoMuted = true;
  int callNotificationDuration = 120;

  void _joinMeeting(String roomId) {
    _jitsiMeetMethods.createMeeting(
      roomName: roomId,
      isAudioMuted: isAudioMuted,
      isVideoMuted: isVideoMuted,
      username: "${_profileController.userProfile.value.profile?.fullName}",
    );
  }

  Future initializeSocket() async {
    try {
      socket = IO.io(socketServerUrl,
          IO.OptionBuilder().setTransports(['websocket']).build());
      socket.connect();
      socket.onConnect(
        (data) {
          debugPrint('socket_server_connected');
          socket.emit(
            'mobile_signin',
            <String, dynamic>{
              "id": _profileController.userProfile.value.profile?.user,
              "message":
                  '${_profileController.userProfile.value.profile?.fullName} :: signed in!'
            },
          );
          socket.on('mobile_message', (data) {
            debugPrint(data.toString());
          });

          socket.on(
            'single_call',
            (data) {
              debugPrint(data.toString());
              Get.snackbar(
                "Incoming call",
                "${data["caller"]} is calling",
                backgroundColor: Colors.white.withOpacity(0.5),
                icon: Padding(
                  padding: EdgeInsets.only(left: 80.0.wp),
                  child: Icon(Icons.call),
                ),
                duration: Duration(seconds: callNotificationDuration),
                onTap: (GetSnackBar) {
                  debugPrint('answering call!!!!!!!!!!');
                  _joinMeeting(data['roomId']);
                  Get.closeCurrentSnackbar();
                },
              );
            },
          );
        },
      );
      socket.onConnectError((err) =>
          debugPrint("${err.toString()} :: socket_server_connection_error"));
      socket.onError(
          (err) => debugPrint("${err.toString()} :: socket_server_error"));
      socket.onDisconnect((_) => debugPrint('socket_server_disconnected'));
      // test events
    } catch (e) {
      debugPrint("${e.toString()}::  an error occured on socket connection");
    }
  }
}

class CallNotification extends StatelessWidget {
  const CallNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: ListTile(),
    );
  }
}
