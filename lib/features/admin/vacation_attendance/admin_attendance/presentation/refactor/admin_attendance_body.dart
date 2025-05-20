import 'package:flutter/material.dart';

import '../widgets/choose_month.dart';
import '../widgets/month_report/month_attendance_report.dart';

class AdminAttendanceBody extends StatelessWidget {
  const AdminAttendanceBody({super.key, required this.com});
  final String com;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [ChooseMonth(com: com), MonthAttendanceReport()],
    );
  }
}
