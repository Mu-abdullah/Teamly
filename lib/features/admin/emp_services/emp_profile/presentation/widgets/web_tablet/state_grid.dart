import 'package:flutter/material.dart';

import '../../../../../../../core/language/lang_keys.dart';
import '../../../../../../auth/data/models/emp_model.dart';
import 'state.dart';

class StatsGrid extends StatelessWidget {
  const StatsGrid({super.key, required this.user});

  final EmpModel user;

  @override
  Widget build(BuildContext context) {
    final stats = [
      StatItem(
        icon: Icons.badge_outlined,
        title: LangKeys.id,
        value: user.id!,
        color: Colors.blue,
      ),
      StatItem(
        icon: Icons.payments_outlined,
        title: LangKeys.salary,
        value: user.salary!,
        color: Colors.green,
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 600 ? 2 : 1;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 2.5,
          ),
          itemCount: stats.length,
          itemBuilder: (context, index) {
            return StatCard(stat: stats[index]);
          },
        );
      },
    );
  }
}
