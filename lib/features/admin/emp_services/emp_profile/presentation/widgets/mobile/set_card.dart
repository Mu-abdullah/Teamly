import 'package:flutter/material.dart';

import '../../../../../../../core/style/color/app_color.dart';
import '../../../../../../../core/style/widgets/app_text.dart';

class StatCard extends StatelessWidget {
  const StatCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
    this.flex = 1,
  });

  final IconData icon;
  final String title;
  final String value;
  final Color color;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          spacing: 8,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 24),
            ),

            AppText(title, color: AppColors.grey),

            AppText(
              value,
              color: AppColors.blueBlack,
              translate: false,
              fontSize: flex == 1 ? 16 : 9,
            ),
          ],
        ),
      ),
    );
  }
}
