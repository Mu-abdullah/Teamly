import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/color/app_color.dart';
import '../../../../../core/style/statics/app_statics.dart';
import 'home_card.dart';

class HomeEmpCount extends StatelessWidget {
  const HomeEmpCount({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.smallPadding,
      child: Column(
        spacing: 12,
        children: [
          HomeCard(
            cardTitle: LangKeys.current,
            cardCount: '20',
            cardIcon: HugeIcons.strokeRoundedCheckmarkCircle01,
            isHighlighted: true,
          ),
          Row(
            spacing: 12,
            children: [
              Expanded(
                child: HomeCard(
                  cardTitle: LangKeys.resigned,
                  cardCount: '3',
                  cardIcon: HugeIcons.strokeRoundedCancelCircle,
                  color: AppColors.yellow,
                  textColor: AppColors.black,
                ),
              ),

              Expanded(
                child: HomeCard(
                  cardTitle: LangKeys.terminated,
                  cardCount: '1',
                  cardIcon: HugeIcons.strokeRoundedCancelCircle,
                  color: AppColors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
