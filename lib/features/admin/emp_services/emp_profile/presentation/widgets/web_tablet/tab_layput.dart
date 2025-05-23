import 'package:flutter/material.dart';

import '../../../../../../auth/data/models/emp_model.dart';
import '../mobile/personal_info_section.dart';
import 'compact_profile_header.dart';
import 'state_grid.dart';

class TabletProfileLayout extends StatelessWidget {
  const TabletProfileLayout({super.key, required this.user});

  final EmpModel user;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        CompactProfileHeader(user: user),
        StatsGrid(user: user),
        PersonalInfoSection(user: user),
      ],
    );
  }
}
