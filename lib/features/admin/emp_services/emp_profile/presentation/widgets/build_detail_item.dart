import 'package:flutter/material.dart';

import '../../../../../../core/style/widgets/app_text.dart';

class BuildDetailItem extends StatelessWidget {
  const BuildDetailItem({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Row(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 20, color: Colors.grey.shade600),
          Expanded(
            child: Column(
              spacing: 2,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(title, fontSize: 12, translate: false),
                AppText(value, fontSize: 14, translate: false),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
