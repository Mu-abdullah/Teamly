import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/widgets/app_text.dart';

class PerviousAttendanceItem extends StatelessWidget {
  const PerviousAttendanceItem({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: AppColors.green,
        child: Icon(
          HugeIcons.strokeRoundedCheckmarkCircle01,
          color: AppColors.white,
        ),
      ),
      title: AppText('${index + 1} ابريل 2023', translate: false),
      subtitle: AppText('حضور', translate: false),
      
    );
  }
}
