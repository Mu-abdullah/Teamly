import 'package:flutter/material.dart';

import '../../../../../core/style/font/fonts_helper.dart';
import '../widgets/attendance_leaving.dart';
import '../widgets/pervious_attendance/pervious_attendance_body.dart';
import '../widgets/user_info/user_home_card.dart';

class UserHomeBody extends StatelessWidget {
  const UserHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    var isArabic = FontsHelper.isArabic(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          UserHomeCard(isArabic: isArabic),
          AttendanceLeaving(),
          PerviousAttendance(),
        ],
      ),
    );
  }
}
