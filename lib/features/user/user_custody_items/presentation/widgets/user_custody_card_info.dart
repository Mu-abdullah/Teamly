import 'package:flutter/material.dart';

import '../../../../../core/style/color/app_color.dart';
import '../../../../../core/style/widgets/app_text.dart';

class UserCustodyItemCardInfo extends StatelessWidget {
  const UserCustodyItemCardInfo({
    super.key,
    required this.lable,
    required this.value,
    required this.icon,
  });

  final String lable;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 10,
      children: [
        Icon(icon, color: AppColors.blueBlack),
        Expanded(
          flex: 1,
          child: AppText(
            lable,
            color: AppColors.grey,
            fontSize: 10,
            maxLines: 2,
          ),
        ),
        AppText(":", translate: false),
        Expanded(flex: 2, child: AppText(value, translate: false, maxLines: 5)),
      ],
    );
  }
}
