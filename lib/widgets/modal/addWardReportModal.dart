import 'package:doctor/constants/color_constant.dart';
import 'package:doctor/widgets/customSemiBoldTextWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:doctor/utils/responsive.dart';

class AddWardReportModal extends StatelessWidget {
  const AddWardReportModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _textController = TextEditingController();
    return AlertDialog(
      content: Container(
        height: 25.0.hp,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customSemiBoldTextWidget(
                text: "Add a ward report ",
                textColor: Colors.black,
                textSize: 15.0.sp),
            TextFormField(
              controller: _textController,
              maxLines: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.orange)),
                    onPressed: () => {Navigator.pop(context)},
                    child: Text("Cancel")),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(customblue)),
                    onPressed: () => {},
                    child: Text("Submit"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
