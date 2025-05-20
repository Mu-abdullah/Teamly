import 'package:flutter/material.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../color/app_color.dart';
import '../statics/app_statics.dart';
import 'custom_shimmer.dart';

class LoadingShimmer extends StatelessWidget {
  const LoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder:
          (_, __) => CustomShimmer(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: context.height(percent: 0.28),
                decoration: BoxDecoration(
                  color: AppColors.scaffoldBackground,
                  borderRadius: AppBorderRadius.mediumRadius,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      height: context.height(percent: 0.02),
                      color: AppColors.blueAccent,
                    ),
                    Container(
                      height: context.height(percent: 0.02),
                      color: AppColors.scaffoldBackground,
                    ),
                  ],
                ),
              ),
            ),
          ),
      itemCount: 14,
    );
  }
}
