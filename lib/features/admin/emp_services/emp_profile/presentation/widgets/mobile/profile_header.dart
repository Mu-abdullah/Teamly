import 'package:flutter/material.dart';
import 'package:teamly/core/style/widgets/app_space.dart';

import '../../../../../../../core/style/color/app_color.dart';
import '../../../../../../auth/data/models/emp_model.dart';
import 'profile_image.dart';
import 'user_name_position.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key, required this.user});
  final EmpModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.blueBlack,
            AppColors.blueBlack.withValues(alpha: 0.8),
          ],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        spacing: 16,
        children: [
          ProfileImage(imageUrl: user.image),
          UserNameAndPosition(user: user),
          AppSpace(space: 20),
        ],
      ),
    );
  }
}
