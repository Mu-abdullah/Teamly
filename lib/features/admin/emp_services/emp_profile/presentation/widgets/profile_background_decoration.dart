import 'package:flutter/material.dart';

import '../../../../../../core/style/color/app_color.dart';

class ProfileBackgroundDecoration extends Decoration {
  const ProfileBackgroundDecoration();

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _ProfileBackgroundPainter();
  }
}

class _ProfileBackgroundPainter extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final rect = offset & configuration.size!;
    final gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [AppColors.blueBlack.withValues(alpha: 0.03), AppColors.white],
    );

    final paint = Paint()..shader = gradient.createShader(rect);
    canvas.drawRect(rect, paint);
  }
}