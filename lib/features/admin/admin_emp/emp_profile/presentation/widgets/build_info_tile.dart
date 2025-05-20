import 'package:flutter/material.dart';

import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/widgets/app_text.dart';

class BuidInfoTile extends StatelessWidget {
  const BuidInfoTile({
    super.key,
    required this.title,
    required this.value,
    this.flex = 1,
  });

  final String title;
  final String value;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Column(
        spacing: 4,
        children: [
          AppText(title, color: AppColors.darkGrey),
          AppText(value, translate: false, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
