import 'package:flutter/material.dart';

import '../../../../../../../core/language/lang_keys.dart';
import '../../../../../../auth/data/models/emp_model.dart';
import '../profile_card_decoration.dart';
import 'personal_info_grid.dart';
import 'section_header.dart';

class PersonalInfoSection extends StatelessWidget {
  const PersonalInfoSection({super.key, required this.user});

  final EmpModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: const ProfileCardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: LangKeys.userInfo),
          const SizedBox(height: 24),
          PersonalInfoGrid(user: user),
        ],
      ),
    );
  }
}
