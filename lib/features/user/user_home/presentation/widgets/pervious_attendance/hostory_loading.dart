import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/statics/app_statics.dart';
import '../../../../../../core/style/widgets/app_space.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../../../../../../core/style/widgets/custom_shimmer.dart';

class HistoryLoadingShimmer extends StatelessWidget {
  const HistoryLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        width: double.infinity,
        height: context.height(),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: AppBorderRadius.largeRadius,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.15),
              blurRadius: 20,
              spreadRadius: 2,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: CustomShimmer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSpace(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: AppText(LangKeys.lastAttendance, isTitle: true),
              ),

              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder:
                      (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.scaffoldBackground,
                            borderRadius: AppBorderRadius.mediumRadius,
                          ),
                          padding: AppPadding.smallPadding,
                          child: Column(
                            spacing: 10,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: Row(
                                  spacing: 16,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor:
                                          AppColors.scaffoldBackground,
                                      child: Icon(
                                        HugeIcons.strokeRoundedMinusSign,
                                        color: AppColors.darkGrey,
                                      ),
                                    ),
                                    Expanded(
                                      child: AppText(
                                        LangKeys.loading,
                                        translate: false,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: Column(
                                  spacing: 5,
                                  children: [
                                    AppText(LangKeys.checkIn),
                                    AppText(LangKeys.checkOut),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  itemCount: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
