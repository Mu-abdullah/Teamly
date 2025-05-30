import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/routes/routes_name.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/statics/app_statics.dart';
import '../emp_count/home_card.dart';
import 'vacation_card_count.dart';

class HomeVacationAttendance extends StatelessWidget {
  const HomeVacationAttendance({super.key, this.height = 120});
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        
        borderRadius: AppBorderRadius.mediumRadius,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          spacing: 10,
          children: [
            Expanded(child: VacationCardCount(height: height)),
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

