import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/routes/routes_name.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/statics/app_statics.dart';
import '../emp_count/home_card.dart';

class HomeCustodyAttendance extends StatelessWidget {
  const HomeCustodyAttendance({super.key, this.height = 120});
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
              child: InkWell(
                onTap: () {
                  context.pushNamed(RoutesNames.custodyScreen);
                },
                child: HomeCard(
                  cardTitle: LangKeys.custody,
                  height: height,
                  color: AppColors.green,
                  cardIcon: HugeIcons.strokeRoundedDollarCircle,
                  isHighlighted: true,
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  context.pushNamed(RoutesNames.adminAttendance);
                },
                child: HomeCard(
                  cardTitle: LangKeys.attendanceLeaving,
                  height: height,
                  color: AppColors.black,
                  maxLines: 3,
                  cardIcon: HugeIcons.strokeRoundedFingerPrintScan,
                  isHighlighted: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
