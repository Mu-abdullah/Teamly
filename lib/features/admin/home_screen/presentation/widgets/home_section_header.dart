import 'package:flutter/material.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/widgets/app_space.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../../../../../core/style/color/app_color.dart';

class HomeSectionHeader extends StatelessWidget {
  const HomeSectionHeader({
    super.key,
    required this.title,
    required this.onTap,
    this.needSeeAll = true,
  });
  final String title;
  final Function()? onTap;
  final bool needSeeAll;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(child: AppText(title, isTitle: true)),
          AppSpace(space: 5),
          needSeeAll
              ? InkWell(
                onTap: onTap,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.darkGrey.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: AppText(LangKeys.seeAll, color: AppColors.black),
                ),
              )
              : const SizedBox(),
        ],
      ),
    );
  }
}
