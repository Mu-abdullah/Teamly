import 'package:flutter/material.dart';

import '../../../../../../core/style/color/app_color.dart';

class ProfileCardDecoration extends BoxDecoration {
  const ProfileCardDecoration()
    : super(
        color: AppColors.white,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 30,
            offset: Offset(0, 10),
          ),
        ],
      );
}