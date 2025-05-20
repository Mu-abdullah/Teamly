import 'package:flutter/material.dart';
import 'package:teamly/core/style/widgets/custom_shimmer.dart';

import '../../../../../../../core/language/lang_keys.dart';
import '../../../../../../../core/style/color/app_color.dart';
import '../../../../../../../core/style/statics/app_statics.dart';
import '../../../../../../../core/style/widgets/app_text.dart';

class MonthReportLoading extends StatelessWidget {
  const MonthReportLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (con, index) {
          return CustomShimmer(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: AppBorderRadius.mediumRadius,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText("21/01/2023", translate: false),
                      Row(
                        children: [
                          Expanded(child: AppText("", translate: false)),
                          AppText(
                            " ",
                            translate: false,
                            color: AppColors.darkGrey,
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: AppText(LangKeys.name, isTitle: true),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              AppText(LangKeys.checkIn),
                              AppText(" : ", translate: false),
                              AppText("00:00", translate: false),
                            ],
                          ),
                          Row(
                            children: [
                              AppText(LangKeys.checkOut),
                              AppText(" : ", translate: false),
                              AppText("00:00", translate: false),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
