import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/routes/routes_name.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/statics/app_statics.dart';
import '../emp_count/home_card.dart';

class HomeCustody extends StatelessWidget {
  const HomeCustody({super.key, this.height = 120});
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppBorderRadius.mediumRadius,
      ),
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
    );
  }
}
