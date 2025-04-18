import 'package:flutter/material.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/widgets/app_space.dart';
import '../../../../../core/style/widgets/app_text.dart';
import '../../../../core/style/color/app_color.dart';

class HomeSectionHeader extends StatelessWidget {
  const HomeSectionHeader({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String title;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(child: AppText(context.translate(title), isTitle: true)),
          AppSpace(space: 5),
          InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: AppColors.darkGrey.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: AppText(
                context.translate(LangKeys.seeAll),
                color: AppColors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
