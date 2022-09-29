import 'dart:math';

import 'package:doctor/Services/generic_api_service.dart';
import 'package:doctor/Services/jitsi_methods.dart';
import 'package:doctor/Services/profile_controller/profile_controller.dart';
import 'package:doctor/Services/socket_service.dart';
import 'package:doctor/constants/url_paths.dart';
import 'package:doctor/controller/generic_controller.dart';
import 'package:doctor/repository/generic_repo.dart';
import 'package:doctor/widgets/call_notification_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:doctor/utils/responsive.dart';
import 'package:get/get.dart';

class UsersToCallScreen extends StatefulWidget {
  const UsersToCallScreen({Key? key}) : super(key: key);

  @override
  State<UsersToCallScreen> createState() => _UsersToCallScreenState();
}

class _UsersToCallScreenState extends State<UsersToCallScreen> {
  GenericApiServices _genericApiServices = Get.find();
  GenericRepository _genericRepository = Get.find();
  SocketServices _socketServices = Get.find();
  ProfileController _profileController = Get.find();

  @override
  void initState() {
    super.initState();

    _genericApiServices.fetchEmployees();
  }

  @override
  Widget build(BuildContext context) {
    List<String> url = backendUrl.split("");
    var newUrl = url.removeLast();
    var assetUrl = url.join();
    final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
    generateRandomId() {
      var random = Random();
      String roomName = (random.nextInt(10000000) + 10000000).toString();
      return roomName;
    }

    createNewMeeting(String roomName) {
      _jitsiMeetMethods.createMeeting(
          roomName: roomName, isAudioMuted: true, isVideoMuted: true);
    }

    // _socketServices.socket.on(
    //   'single_call',
    //   (data) {
    //     debugPrint(data.toString());
    //     Get.snackbar(
    //       "Incoming call",
    //       "${data["caller"]} is calling",
    //       icon: Padding(
    //         padding: EdgeInsets.only(left: 80.0.wp),
    //         child: IconButton(
    //           onPressed: () => {print("hiiiiiiiii")},
    //           icon: Icon(Icons.airline_seat_flat),
    //         ),
    //       ),
    //       duration: Duration(seconds: 15000),
    //     );
    //   },
    // );

    return Obx(
      () => ListView.builder(
        itemCount: _genericRepository.employeesList.length,
        itemBuilder: (_, index) {
          return Container(
            height: 10.0.hp,
            width: 90.0.wp,
            margin: EdgeInsets.symmetric(horizontal: 2.0.wp, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  blurRadius: 0.5,
                  spreadRadius: -1,
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 0.5.hp, left: 2.0.wp),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                          color: Colors.transparent),
                      child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(
                              "${assetUrl}${_genericRepository.employeesList[index].profile.profilePhoto}")),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, top: 27),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${_genericRepository.employeesList[index].firstName} ${_genericRepository.employeesList[index].lastName}",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text(
                              "${_genericRepository.employeesList[index].profile.gender}")
                        ],
                      ),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () async {
                      String roomId = generateRandomId();
                      await createNewMeeting(roomId);
                      _socketServices.socket.emit("single_call", {
                        "targetId":
                            _genericRepository.employeesList[index].pkid,
                        "roomId": roomId,
                        "caller": _profileController
                            .userProfile.value.profile?.fullName
                      });
                    },
                    icon: Icon(Icons.call))
              ],
            ),
          );
        },
      ),
    );
  }
}
