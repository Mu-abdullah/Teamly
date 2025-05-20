import 'package:flutter/material.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../../../core/language/lang_keys.dart';
import '../../../../../../../core/style/color/app_color.dart';
import '../../../../../../../core/style/statics/app_statics.dart';
import '../../../../../../../core/style/widgets/app_text.dart';
import '../../../../../../../core/style/widgets/custom_shimmer.dart';

class EmpShimmer extends StatelessWidget {
  const EmpShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          height: 50,
          width: context.width(),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: AppBorderRadius.mediumRadius,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppText(LangKeys.loading),
          ),
        ),
      ),
    );
  }
}
