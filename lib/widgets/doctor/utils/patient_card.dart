import 'package:doctor/constants/url_paths.dart';
import 'package:doctor/model/doctor_appointment_model.dart';
import 'package:flutter/material.dart';
import 'package:doctor/utils/responsive.dart';

class PatientCard extends StatefulWidget {
  final DoctorAppointmentModel data;
  const PatientCard({Key? key, required this.data}) : super(key: key);

  @override
  State<PatientCard> createState() => _PatientCardState();
}

class _PatientCardState extends State<PatientCard> {
  @override
  Widget build(BuildContext context) {
    final time = TimeOfDay(
        hour: int.parse(widget.data.time!.split(':')[0]),
        minute: int.parse(widget.data.time!.split(':')[2]));

    return Container(
      width: 200,
      height: 12.0.hp,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 2.0.hp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                height: 50.0.hp,
                width: 10.0.hp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "${backendUrl2}${widget.data.patient!.profilePhoto}",
                    // fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 10.0.wp),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.data.patient!.firstName} ${widget.data.patient!.lastName}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF263257),
                ),
              ),
              SizedBox(height: 0.4.hp),
              Text(
                "Appointment",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF7D8BB7),
                ),
              ),
              SizedBox(height: 0.6.hp),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 4.0.wp, vertical: 0.5.wp),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text("${time.format(context)}"),
                // child: Text(new TimeOfDay(
                //         hour: int.parse(widget.data.time!.split('')[0]),
                //         minute: int.parse(widget.data.time!.split('')[3], widget.data.time!.split('')[4]))
                //     .format(context)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
