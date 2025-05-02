import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:teamly/core/services/status/gender_status.dart';
import 'package:teamly/core/style/color/app_color.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/widgets/custom_app_bar.dart';
import '../../../../admin/home_screen/presentation/widgets/emp_count/home_card.dart';

class UserVacations extends StatelessWidget {
  const UserVacations({super.key, required this.gender});
  final String gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LangKeys.vacation),
      body: MobileUserVactions(gender: gender),
    );
  }
}

class MobileUserVactions extends StatelessWidget {
  const MobileUserVactions({super.key, required this.gender});
  final String gender;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: HomeCard(
            cardTitle: LangKeys.annuallVacation,
            cardIcon: HugeIcons.strokeRoundedBeach,
            isHighlighted: true,
            color: AppColors.green,
            height: 150,
          ),
        ),
        Expanded(
          child: HomeCard(
            cardTitle: LangKeys.sickLeave,
            cardIcon: HugeIcons.strokeRoundedStethoscope,
            color: AppColors.black,
            isHighlighted: true,
            height: 150,
          ),
        ),
        Expanded(
          child: HomeCard(
            cardTitle: LangKeys.exceptionalVacation,
            cardIcon: HugeIcons.strokeRoundedWorkAlert,
            color: AppColors.yellow,
            isHighlighted: true,
            height: 150,
          ),
        ),
        gender == GenderStatus.getGender(Gender.female)
            ? Expanded(
              child: HomeCard(
                cardTitle: LangKeys.maternityLeave,
                cardIcon: HugeIcons.strokeRoundedWoman,
                color: AppColors.pink,
                isHighlighted: true,
                height: 150,
              ),
            )
            : Container(),
      ],
    );
  }
}
