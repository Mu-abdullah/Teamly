import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../../cubits/emp_count_cubit/emp_count_cubit.dart';
import 'home_card.dart';

class EmpCount extends StatelessWidget {
  const EmpCount({super.key, this.height = 100, required this.cubit});

  final double height;
  final EmpCountCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        spacing: 10,
        children: [
          Expanded(
            child: HomeCard(
              cardTitle: LangKeys.current,
              cardCount: cubit.getOnWork().length.toString(),
              cardIcon: HugeIcons.strokeRoundedCheckmarkCircle01,
              isHighlighted: true,
              color: AppColors.blueBlack,
            ),
          ),
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
              cardIcon: HugeIcons.strokeRoundedAlertDiamond,
              color: AppColors.red,
            ),
          ),
        ],
      ),
    );
  }
}
