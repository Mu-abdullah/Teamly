import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../../auth/data/models/emp_model.dart';
import 'info_icon.dart';
import 'info_tile.dart';

class PersonalInfoGrid extends StatelessWidget {
  const PersonalInfoGrid({super.key, required this.user});

  final EmpModel user;

  @override
  Widget build(BuildContext context) {
    final infoItems = [
      InfoItem(
        icon: HugeIcons.strokeRoundedLocation01,
        title: 'العنوان',
        value: user.address!,
        color: Colors.orange,
      ),
      InfoItem(
        icon: HugeIcons.strokeRoundedStudentCard,
        title: 'الرقم القومي',
        value: user.nid!,
        color: Colors.purple,
      ),
      InfoItem(
        icon: HugeIcons.strokeRoundedSmartPhone01,
        title: 'الهاتف',
        value: user.phone!,
        color: Colors.green,
        onTap: () => context.call(phoneNumber: user.phone!),
      ),
      InfoItem(
        icon: HugeIcons.strokeRoundedDateTime,
        title: 'بداية العمل',
        value: user.startIn!,
        color: Colors.blue,
      ),
      InfoItem(
        icon: HugeIcons.strokeRoundedDateTime,
        title: 'نهاية العمل',
        value: 'مستمر بالخدمة',
        color: Colors.teal,
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 800 ? 2 : 1;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 20,
            mainAxisSpacing: 16,
            childAspectRatio: 4,
          ),
          itemCount: infoItems.length,
          itemBuilder: (context, index) {
            return InfoTile(item: infoItems[index]);
          },
        );
      },
    );
  }
}
