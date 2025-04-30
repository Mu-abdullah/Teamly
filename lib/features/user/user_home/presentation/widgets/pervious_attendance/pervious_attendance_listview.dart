import 'package:flutter/material.dart';

import '../../../data/model/history_attendance_model.dart';
import 'pervious_attendance_item.dart';

class PerviousAttendanceListview extends StatelessWidget {
  const PerviousAttendanceListview({super.key, required this.attendanceItems});

  final List<HistoryAttendanceModel> attendanceItems;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: attendanceItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: PreviousAttendanceItem(item: attendanceItems[index]),
          );
        },
      ),
    );
  }
}
