import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/routes/routes_name.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/statics/app_statics.dart';
import '../emp_count/home_card.dart';

class HomeAdminCustody extends StatelessWidget {
  const HomeAdminCustody({super.key, this.height = 110});
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: AppBorderRadius.mediumRadius),

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: HomeCard(
          onTap: () {
            context.pushNamed(RoutesNames.custodyScreen);
          },
          cardTitle: LangKeys.custody,

          color: AppColors.green,
          cardIcon: HugeIcons.strokeRoundedDollarCircle,
          isHighlighted: true,
        ),
      ),
    );
  }
}
