import 'package:flutter/material.dart';

class CallNotificationModal extends StatelessWidget {
  const CallNotificationModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: ListTile(
        leading: Text('call '),
      ),
    );
  }
}
