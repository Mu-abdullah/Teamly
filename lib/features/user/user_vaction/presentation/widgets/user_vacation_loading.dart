import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/color/app_color.dart';
import '../../../../../core/style/widgets/custom_shimmer.dart';
import '../../../../admin/home_screen/presentation/widgets/emp_count/home_card.dart';

class UserVacationLoading extends StatelessWidget {
  const UserVacationLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 16 / 10,
              children: List.generate(
                6,
                (index) => CustomShimmer(
                  child: HomeCard(
                    cardTitle: LangKeys.vacation,
                    cardIcon: HugeIcons.strokeRoundedWoman,
                    color: AppColors.pink,
                    isHighlighted: true,
                    height: 150,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
