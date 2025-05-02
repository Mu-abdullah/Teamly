import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/routes/routes_name.dart';
import '../../../../../core/style/color/app_color.dart';
import '../../../../../core/style/statics/app_statics.dart';
import '../../../../admin/home_screen/presentation/widgets/emp_count/home_card.dart';
import '../cubits/get_user_data_cubit/get_user_data_cubit.dart';

class SalaryVacationCards extends StatelessWidget {
  const SalaryVacationCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppBorderRadius.largeRadius,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          spacing: 10,
          children: [
            Expanded(
              child: InkWell(
                onTap:
                    () => context.pushNamed(
                      RoutesNames.userVacation,
                      arguments: {
                        'gender':
                            context.read<GetUserDataCubit>().user!.gend!.name,
                      },
                    ),
                child: HomeCard(
                  cardTitle: LangKeys.vacation,
                  cardIcon: HugeIcons.strokeRoundedBeach,
                  isHighlighted: true,
                  height: 150,
                ),
              ),
            ),
            Expanded(
              child: HomeCard(
                cardTitle: LangKeys.salary,
                cardIcon: HugeIcons.strokeRoundedCoinsDollar,
                isHighlighted: true,
                color: AppColors.green,
                height: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
