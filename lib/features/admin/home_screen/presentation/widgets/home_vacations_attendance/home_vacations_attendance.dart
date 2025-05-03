import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/routes/routes_name.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/statics/app_statics.dart';
import '../emp_count/home_card.dart';

class HomeVacationAttendance extends StatelessWidget {
  const HomeVacationAttendance({super.key, this.height = 120});
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppBorderRadius.mediumRadius,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          spacing: 10,
          children: [
            Expanded(
              child: HomeCard(
                onTap: () {},
                cardTitle: LangKeys.vacation,
                height: height,
                color: AppColors.blueAccent,
                cardIcon: HugeIcons.strokeRoundedBeach,
                isHighlighted: true,
              ),
            ),
            Expanded(
              child: HomeCard(
                onTap: () {
                  context.pushNamed(RoutesNames.adminAttendance);
                },
                cardTitle: LangKeys.attendanceLeaving,
                height: height,
                color: AppColors.black,
                maxLines: 3,
                cardIcon: HugeIcons.strokeRoundedFingerPrintScan,
                isHighlighted: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
