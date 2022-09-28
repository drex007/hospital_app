import 'dart:math';

import 'package:doctor/Services/jitsi_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:doctor/utils/responsive.dart';

class UsersToCallScreen extends StatelessWidget {
  const UsersToCallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

    createNewMeeting() {
      var random = Random();
      String roomName = (random.nextInt(10000000) + 10000000).toString();
      _jitsiMeetMethods.createMeeting(
          roomName: roomName, isAudioMuted: true, isVideoMuted: true);
    }

    return ListView.builder(
      itemCount: 20,
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
                            "http://192.168.1.128:8000/uploads/images/profile_default.png")),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, top: 27),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Female",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text("Male")
                      ],
                    ),
                  ),
                ],
              ),
              IconButton(
                  onPressed: () => createNewMeeting(), icon: Icon(Icons.call))
            ],
          ),
        );
      },
    );
  }
}
