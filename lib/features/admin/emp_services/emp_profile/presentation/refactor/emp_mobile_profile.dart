import 'package:flutter/material.dart';

import '../../../../../../core/style/color/app_color.dart';
import '../../../../../auth/data/models/emp_model.dart';
import '../widgets/mobile/personal_info_section.dart';
import '../widgets/mobile/profile_header.dart';
import '../widgets/mobile/profile_stats_row.dart';

class EmpMobileProfile extends StatelessWidget {
  const EmpMobileProfile({super.key, required this.user});

  final EmpModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.blueBlack.withValues(alpha: 0.05),
            AppColors.white,
          ],
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ProfileHeader(user: user),
            ProfileStatsRow(user: user),
            PersonalInfoSection(user: user),
          ],
        ),
      ),
    );
  }
}
