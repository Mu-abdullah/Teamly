import 'package:flutter/material.dart';

import '../../../../core/style/color/app_color.dart';
import '../../../../core/style/widgets/app_text.dart';

class BuidInfoTile extends StatelessWidget {
  const BuidInfoTile({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        spacing: 4,
        children: [
          AppText(
            title,
            fontSize: 12,
            translate: false,
            color: AppColors.darkGrey,
          ),
          AppText(
            value,
            fontSize: 14,
            translate: false,
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
