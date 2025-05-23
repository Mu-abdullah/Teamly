import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../../../core/routes/routes_name.dart';
import '../../../../../../../core/style/color/app_color.dart';
import '../../../../../../../core/style/widgets/app_text.dart';
import '../../../../../../auth/data/models/emp_model.dart';

class UserNameAndPosition extends StatelessWidget {
  const UserNameAndPosition({super.key, required this.user});
  final EmpModel user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText(
          user.name ?? '',
          isTitle: true,
          translate: false,
          maxLines: 2,
          color: AppColors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.white.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.white.withValues(alpha: 0.3),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.work_outline, color: AppColors.white, size: 16),
              const SizedBox(width: 8),
              Flexible(
                child: AppText(
                  user.position ?? '',
                  translate: false,
                  color: AppColors.white,
                  fontSize: 16,
                ),
              ),
              if (user.papers?.isNotEmpty == true) ...[
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () {
                    context.pushNamed(
                      RoutesNames.paperViewer,
                      arguments: {'url': user.papers},
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      HugeIcons.strokeRoundedPdf01,
                      color: AppColors.blueBlack,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
