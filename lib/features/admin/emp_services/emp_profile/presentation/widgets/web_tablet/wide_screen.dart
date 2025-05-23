import 'package:flutter/material.dart';

import '../../../../../../auth/data/models/emp_model.dart';
import 'profile_info_section.dart';
import 'profile_slidepar.dart';
import 'state_grid.dart';

class WideScreenLayout extends StatelessWidget {
  const WideScreenLayout({super.key, required this.user});

  final EmpModel user;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left Panel - Profile Info
        Expanded(flex: 1, child: ProfileSidebar(user: user)),
        const SizedBox(width: 40),
        // Right Panel - Details
        Expanded(
          flex: 2,
          child: Column(
            children: [
              StatsGrid(user: user),
              const SizedBox(height: 30),
              PersonalInfoSection(user: user),
            ],
          ),
        ),
      ],
    );
  }
}
