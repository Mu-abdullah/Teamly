import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../home_screen/presentation/cubits/vacation_count_cubit/vacation_count_cubit.dart';
import 'admin_vaction_screen_item.dart';

class AdminVacationScreenItems extends StatelessWidget {
  const AdminVacationScreenItems({super.key, required this.cubit});

  final VacationCountCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AdminVacationScreenItem(
          title: LangKeys.newVacationRequest,
          icon: HugeIcons.strokeRoundedTask01,
          count: cubit.getVacationsPeding().length.toString(),
          onTap: () {},
        ),
        AdminVacationScreenItem(
          title: LangKeys.approved,
          icon: HugeIcons.strokeRoundedTask01,
          count: cubit.getVacationsApproved().length.toString(),
          onTap: () {},
        ),
        AdminVacationScreenItem(
          title: LangKeys.rejected,
          icon: HugeIcons.strokeRoundedTask01,
          count: cubit.getVacationsRejected().length.toString(),
          onTap: () {},
        ),
      ],
    );
  }
}
