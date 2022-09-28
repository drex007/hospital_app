import 'package:doctor/model/doctor_bedspace_model.dart';
import 'package:flutter/material.dart';
import 'package:doctor/utils/responsive.dart';

class BedspaceCard extends StatelessWidget {
  final DoctorBedSpaceModel data;
  final int wardIndex;

  const BedspaceCard({
    Key? key,
    required this.data,
    required this.wardIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.0.hp,
      width: 90.0.wp,
      margin: EdgeInsets.symmetric(horizontal: 2.0.wp, vertical: 0.5.hp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 0.5,
            spreadRadius: -1,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(width: 10),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text((wardIndex + 1).toString()),
                ),
              ),
              SizedBox(width: 8.0.wp),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${data.wardName}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 1.0.hp),
                  Container(
                    height: 20,
                    width: 80,
                    margin: EdgeInsets.only(right: 2.0.wp),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "${data.bedNumber}",
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            height: 20,
            width: 80,
            margin: EdgeInsets.only(right: 2.0.wp),
            decoration: BoxDecoration(
              color: data.allocated == true
                  ? Colors.green.withOpacity(0.4)
                  : Colors.orange.withOpacity(0.4),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                "${data.allocated == true ? 'Occupied' : 'Available'}",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
