import 'package:flutter/material.dart';

import '../../../../../core/style/font/fonts_helper.dart';
import '../../../../../core/style/widgets/custom_app_bar.dart';
import '../widgets/attendance_leaving.dart';
import '../widgets/pervious_attendance/pervious_attendance_body.dart';
import '../widgets/user_home_card.dart';

class UserHome extends StatelessWidget {
  const UserHome({super.key});

  @override
  Widget build(BuildContext context) {
    var isArabic = FontsHelper.isArabic(context);
    return Scaffold(
      appBar: CustomAppBar(title: 'User Home', translate: false, isBack: false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            UserHomeCard(isArabic: isArabic),
            AttendanceLeaving(),
            PerviousAttendance(),
          ],
        ),
      ),
    );
  }
}
