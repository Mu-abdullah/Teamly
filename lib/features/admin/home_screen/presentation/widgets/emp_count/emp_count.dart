import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/statics/app_statics.dart';
import '../../cubits/emp_count_cubit/emp_count_cubit.dart';
import 'home_card.dart';

class EmpCount extends StatelessWidget {
  const EmpCount({super.key, required this.height, required this.cubit});

  final double height;
  final EmpCountCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: AppBorderRadius.mediumRadius,
        color: AppColors.white,
      ),
      height: height,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 10,
        children: [
          HomeCard(
            cardTitle: LangKeys.current,
            cardCount: cubit.getOnWork().length.toString(),
            cardIcon: HugeIcons.strokeRoundedCheckmarkCircle01,
            isHighlighted: true,
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: HomeCard(
                    cardTitle: LangKeys.resigned,
                    cardCount: cubit.getResigned().length.toString(),
                    cardIcon: HugeIcons.strokeRoundedCancelCircle,
                    color: AppColors.yellow,
                    textColor: AppColors.black,
                  ),
                ),

                Expanded(
                  child: HomeCard(
                    cardTitle: LangKeys.terminated,
                    cardCount: cubit.getTerminated().length.toString(),
                    cardIcon: HugeIcons.strokeRoundedCancelCircle,
                    color: AppColors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
