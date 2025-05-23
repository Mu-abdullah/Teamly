import 'package:flutter/material.dart';

import '../../../../../../../core/style/color/app_color.dart';
import '../../../../../../auth/data/models/emp_model.dart';
import '../profile_card_decoration.dart';
import 'profile_avatar.dart';

class CompactProfileHeader extends StatelessWidget {
  const CompactProfileHeader({super.key, required this.user});

  final EmpModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const ProfileCardDecoration(),
      child: Row(
        children: [
          ProfileAvatar(imageUrl: user.image, size: 100, showBorder: true),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(
                  user.name!,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blueBlack,
                  ),
                ),
                const SizedBox(height: 8),
                SelectableText(
                  user.position!,
                  style: const TextStyle(fontSize: 16, color: AppColors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
