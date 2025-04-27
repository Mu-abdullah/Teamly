import 'package:flutter/material.dart';

import '../../../../../core/style/color/app_color.dart';
import '../../../../../core/style/widgets/custom_shimmer.dart';

class UserCardLoading extends StatelessWidget {
  const UserCardLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }
}
