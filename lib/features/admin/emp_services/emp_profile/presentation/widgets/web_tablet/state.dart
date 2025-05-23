import 'package:flutter/material.dart';

import '../../../../../../../core/style/color/app_color.dart';
import '../../../../../../../core/style/widgets/app_text.dart';

class StatItem {
  final IconData icon;
  final String title;
  final String value;
  final Color color;

  const StatItem({
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
  });
}

class StatCard extends StatelessWidget {
  const StatCard({super.key, required this.stat});

  final StatItem stat;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: stat.color.withValues(alpha: 0.2),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            StatIcon(icon: stat.icon, color: stat.color),
            const SizedBox(width: 20),
            Expanded(child: StatContent(title: stat.title, value: stat.value)),
          ],
        ),
      ),
    );
  }
}

class StatIcon extends StatelessWidget {
  const StatIcon({super.key, required this.icon, required this.color});

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: color, size: 28),
    );
  }
}

class StatContent extends StatelessWidget {
  const StatContent({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText(title, fontSize: 14, color: AppColors.grey),
        const SizedBox(height: 4),
        SelectableText(value, style: customTextStyle(context)),
      ],
    );
  }
}
