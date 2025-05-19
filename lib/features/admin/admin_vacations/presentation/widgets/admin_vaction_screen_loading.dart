import 'package:flutter/material.dart';

import '../../../../../core/style/color/app_color.dart';
import '../../../../../core/style/statics/app_statics.dart';
import '../../../../../core/style/widgets/app_space.dart';
import '../../../../../core/style/widgets/custom_shimmer.dart';

class AdminVacationScreenLoading extends StatelessWidget {
  const AdminVacationScreenLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 3,
      separatorBuilder: (context, index) => AppSpace(),
      itemBuilder: (c, i) {
        return CustomShimmer(
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: AppBorderRadius.mediumRadius,
              color: AppColors.white,
            ),
          ),
        );
      },
    );
  }
}
