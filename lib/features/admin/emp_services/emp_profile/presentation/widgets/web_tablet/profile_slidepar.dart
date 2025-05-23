import 'package:flutter/material.dart';
import 'package:teamly/core/style/widgets/app_text.dart';

import '../../../../../../auth/data/models/emp_model.dart';
import '../profile_card_decoration.dart';
import 'profile_avatar.dart';

class ProfileSidebar extends StatelessWidget {
  const ProfileSidebar({super.key, required this.user});

  final EmpModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: const ProfileCardDecoration(),
      child: Column(
        children: [
          ProfileAvatar(imageUrl: user.image),
          const SizedBox(height: 24),
          AppText(
            user.name!,
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.w600,
            translate: false,
          ),
        ],
      ),
    );
  }
}
