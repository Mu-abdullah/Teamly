import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/routes/routes_name.dart';
import '../../../../../../core/services/status/job_status.dart';
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
              onTap: () {
                context.pushNamed(
                  RoutesNames.allEmp,
                  arguments: {'status': JobStatus.onWork},
                );
              },
            ),
          ),
          Expanded(
            child: HomeCard(
              cardTitle: LangKeys.resigned,
              cardCount: cubit.getResigned().length.toString(),
              cardIcon: HugeIcons.strokeRoundedCancelCircle,
              color: AppColors.yellow,
              textColor: AppColors.black,
              onTap: () {
                context.pushNamed(
                  RoutesNames.allEmp,
                  arguments: {'status': JobStatus.resigned},
                );
              },
            ),
          ),

          Expanded(
            child: HomeCard(
              cardTitle: LangKeys.terminated,
              cardCount: cubit.getTerminated().length.toString(),
              cardIcon: HugeIcons.strokeRoundedAlertDiamond,
              color: AppColors.red,
              onTap: () {
                context.pushNamed(
                  RoutesNames.allEmp,
                  arguments: {'status': JobStatus.terminated},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
