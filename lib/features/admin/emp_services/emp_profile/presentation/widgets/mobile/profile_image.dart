import 'package:flutter/material.dart';

import '../../../../../../../core/style/color/app_color.dart';
import '../../../../../../../core/style/statics/image_test.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key, this.imageUrl});
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 140,
          width: 140,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.white, width: 4),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ClipOval(
            child: Image.network(
              imageUrl ?? ImageTest.bloger,
              fit: BoxFit.cover,
              errorBuilder:
                  (_, __, ___) => Container(
                    color: AppColors.grey,
                    child: const Icon(
                      Icons.person,
                      size: 60,
                      color: AppColors.white,
                    ),
                  ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.verified,
              color: AppColors.blueBlack,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
