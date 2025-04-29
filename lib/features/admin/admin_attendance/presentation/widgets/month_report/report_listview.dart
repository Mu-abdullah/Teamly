import 'package:flutter/material.dart';

import '../../../data/model/month_admin_attendance.dart';
import 'report_item.dart';

class ReportListview extends StatelessWidget {
  const ReportListview({super.key, required this.attendance});

  final List<MonthAdminAttendance> attendance;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: attendance.length,
        itemBuilder: (context, index) {
          var att = attendance[index];
          return ReportItem(att: att);
        },
      ),
    );
  }
}
