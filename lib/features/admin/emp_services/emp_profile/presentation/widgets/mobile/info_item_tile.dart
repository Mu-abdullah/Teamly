import 'package:flutter/material.dart';

import '../../../../../../../core/style/color/app_color.dart';
import '../../../../../../../core/style/widgets/app_text.dart';

class InfoItemTile extends StatelessWidget {
  const InfoItemTile({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    this.translateValue = false,
  });

  final IconData icon;
  final String title;
  final String? value;
  final bool translateValue;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppColors.blueBlack, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                title,
                fontSize: 12,
                color: AppColors.grey,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 4),
              AppText(
                value ?? '-',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.blueBlack,
                translate: translateValue,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
