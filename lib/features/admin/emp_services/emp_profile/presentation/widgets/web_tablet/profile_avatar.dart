import 'package:flutter/material.dart';

import '../../../../../../../core/style/color/app_color.dart';
import '../../../../../../../core/style/statics/image_test.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    required this.imageUrl,
    this.size = 180,
    this.showBorder = true,
  });

  final String? imageUrl;
  final double size;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border:
              showBorder
                  ? Border.all(
                    color: AppColors.blueBlack.withValues(alpha: 0.1),
                    width: 3,
                  )
                  : null,
          boxShadow: [
            BoxShadow(
              color: AppColors.blueBlack.withValues(alpha: 0.15),
              blurRadius: 25,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ClipOval(
          child: Image.network(
            imageUrl ?? ImageTest.bloger,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: AppColors.grey.withValues(alpha: 0.2),
                child: Icon(
                  Icons.person,
                  size: size * 0.4,
                  color: AppColors.blueBlack.withValues(alpha: 0.5),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
