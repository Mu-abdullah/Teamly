import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:teamly/core/services/status/job_status.dart';

import '../../../../../../../core/language/lang_keys.dart';
import '../../../../../../../core/services/status/gender_status.dart';
import '../../../../../../../core/style/color/app_color.dart';
import '../../../../../../../core/style/widgets/app_text.dart';
import '../../../../../../auth/data/models/emp_model.dart';
import 'info_item_tile.dart';

class PersonalInfoSection extends StatelessWidget {
  const PersonalInfoSection({super.key, required this.user});
  final EmpModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            LangKeys.userInfo,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.blueBlack,
          ),
          InfoItemTile(
            icon: HugeIcons.strokeRoundedCreditCard,
            title: LangKeys.nid,
            value: user.nid,
          ),
          InfoItemTile(
            icon: HugeIcons.strokeRoundedSmartPhone01,
            title: LangKeys.phone,
            value: user.phone,
          ),

          InfoItemTile(
            icon: HugeIcons.strokeRoundedLocation01,
            title: LangKeys.address,
            value: user.address,
          ),
          InfoItemTile(
            icon: HugeIcons.strokeRoundedCalendar01,
            title: LangKeys.startIn,
            value: user.startIn,
          ),
          InfoItemTile(
            icon:
                user.gender == GenderStatus.getGender(Gender.male)
                    ? HugeIcons.strokeRoundedMaleSymbol
                    : HugeIcons.strokeRoundedFemaleSymbol,
            title: LangKeys.gender,
            value: user.gender,
            translateValue: true,
          ),
          InfoItemTile(
            icon: HugeIcons.strokeRoundedCalendar01,
            title: LangKeys.startIn,
            value: user.startIn,
          ),
          InfoItemTile(
            icon: HugeIcons.strokeRoundedWorkHistory,
            title: LangKeys.jobStatus,
            value:
                user.jobStatus == JobStatus.onWork
                    ? LangKeys.onWork
                    : user.jobStatus,
            translateValue: user.jobStatus == JobStatus.onWork,
          ),
        ],
      ),
    );
  }
}
