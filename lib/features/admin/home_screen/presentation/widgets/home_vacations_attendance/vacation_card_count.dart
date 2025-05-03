import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/routes/routes_name.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../../cubits/vacation_count_cubit/vacation_count_cubit.dart';
import '../emp_count/home_card.dart';
import 'vaction_card_loading.dart';

class VacationCardCount extends StatelessWidget {
  const VacationCardCount({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VacationCountCubit, VacationCountState>(
      builder: (context, state) {
        if (state is VacationCountLoading) {
          return VacationCardLoading(height: height);
        } else if (state is VacationCountSuccess) {
          return HomeCard(
            onTap: () {
              context.pushNamed(RoutesNames.reviewVacationRequest);
            },
            cardTitle: LangKeys.vacation,
            height: height,
            cardCount: state.vacCount.length.toString(),
            color: AppColors.blueAccent,
            cardIcon: HugeIcons.strokeRoundedBeach,
            isHighlighted: true,
          );
        } else if (state is VacationCountError) {
          return HomeCard(
            onTap: () {},
            cardTitle: LangKeys.vacation,
            height: height,
            color: AppColors.blueAccent,
            cardIcon: HugeIcons.strokeRoundedBeach,
            isHighlighted: true,
          );
        }
        return HomeCard(
          onTap: () {},
          cardTitle: LangKeys.vacation,
          height: height,
          color: AppColors.blueAccent,
          cardIcon: HugeIcons.strokeRoundedBeach,
          isHighlighted: true,
        );
      },
    );
  }
}
