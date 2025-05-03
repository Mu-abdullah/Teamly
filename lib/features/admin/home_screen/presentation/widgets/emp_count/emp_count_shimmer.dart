import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/statics/app_statics.dart';
import '../../../../../../core/style/widgets/custom_shimmer.dart';
import 'home_card.dart';

class EmpCountShimmer extends StatelessWidget {
  const EmpCountShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: AppBorderRadius.mediumRadius,
        color: AppColors.white,
      ),
      height: 270,
      child: CustomShimmer(
        child: Expanded(
          child: Row(
            spacing: 10,
            children: [
              Expanded(
                child: HomeCard(
                  cardTitle: LangKeys.current,
                  cardCount: " ",
                  cardIcon: HugeIcons.strokeRoundedCheckmarkCircle01,
                  isHighlighted: true,
                ),
              ),
              Expanded(
                child: HomeCard(
                  cardTitle: LangKeys.resigned,
                  cardCount: " ",
                  cardIcon: HugeIcons.strokeRoundedCancelCircle,
                  color: AppColors.yellow,
                  textColor: AppColors.black,
                ),
              ),

              Expanded(
                child: HomeCard(
                  cardTitle: LangKeys.terminated,
                  cardCount: " ",
                  cardIcon: HugeIcons.strokeRoundedCancelCircle,
                  color: AppColors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
