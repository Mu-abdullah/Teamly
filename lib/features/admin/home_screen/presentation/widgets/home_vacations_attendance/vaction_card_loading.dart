
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/widgets/custom_shimmer.dart';
import '../emp_count/home_card.dart';

class VacationCardLoading extends StatelessWidget {
  const VacationCardLoading({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: HomeCard(
        onTap: () {},
        cardTitle: LangKeys.vacation,
        height: height,
        color: AppColors.blueAccent,
        cardIcon: HugeIcons.strokeRoundedBeach,
        isHighlighted: true,
      ),
    );
  }
}