import 'package:flutter/material.dart';

import '../../../../../../../core/language/lang_keys.dart';
import '../../../../../../auth/data/models/emp_model.dart';
import 'set_card.dart';

class ProfileStatsRow extends StatelessWidget {
  const ProfileStatsRow({super.key, required this.user});
  final EmpModel user;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          spacing: 16,
          children: [
            Expanded(
              child: StatCard(
                icon: Icons.badge_outlined,
                title: LangKeys.id,
                value: user.id ?? '',
                color: Colors.blue,
                flex: 2,
              ),
            ),

            Expanded(
              child: StatCard(
                icon: Icons.payments_outlined,
                title: LangKeys.salary,
                value: user.salary ?? '',
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
