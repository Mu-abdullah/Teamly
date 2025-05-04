import 'package:flutter/material.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/services/status/vactions_typs.dart';
import '../../../../../../core/style/widgets/custom_drop_menu.dart';
import '../../cubits/new_request_vacation_cubit/new_request_vacation_cubit.dart';

class ChooseVacationTypeDrpoMenu extends StatelessWidget {
  const ChooseVacationTypeDrpoMenu({super.key, required this.cubit});
  final NewRequestVacationCubit cubit;
  @override
  Widget build(BuildContext context) {
    return GenericDropdown(
      items: VacationTypes.getArabicTypeNamesList(),
      getDisplayText: (String value) => value,
      onChanged: (type) {
        if (type != null) {
          cubit.vactionType(VacationTypes.convertToEnglish(type));
        }
      },
      hint: LangKeys.vacationType,
    );
  }
}
