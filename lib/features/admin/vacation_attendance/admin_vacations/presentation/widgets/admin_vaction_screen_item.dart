import 'package:flutter/material.dart';

import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/statics/app_statics.dart';
import '../../../../../../core/style/widgets/app_text.dart';

class AdminVacationScreenItem extends StatelessWidget {
  const AdminVacationScreenItem({
    super.key,
    required this.title,
    required this.count,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String count;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: AppBorderRadius.mediumRadius,
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          spacing: 15,
          children: [
            Icon(icon),
            Expanded(child: AppText(title)),
            AppText(count, translate: false),
          ],
        ),
      ),
    );
  }
}
