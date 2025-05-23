import 'package:flutter/material.dart';

import '../../../../../../../core/style/color/app_color.dart';
import '../../../../../../../core/style/widgets/app_text.dart';

class InfoItem {
  final IconData icon;
  final String title;
  final String value;
  final Color color;
  final VoidCallback? onTap;

  const InfoItem({
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
    this.onTap,
  });
}

class InfoIcon extends StatelessWidget {
  const InfoIcon({super.key, required this.icon, required this.color});

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, color: color, size: 24),
    );
  }
}

class InfoContent extends StatelessWidget {
  const InfoContent({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,spacing: 4,
      children: [
        AppText(title, fontSize: 14, color: AppColors.grey, translate: false),
       
        SelectableText(value, style: customTextStyle(context)),
      ],
    );
  }
}
