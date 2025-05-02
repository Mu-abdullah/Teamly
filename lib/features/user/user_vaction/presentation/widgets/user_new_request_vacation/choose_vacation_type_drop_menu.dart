import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/services/status/vactions_typs.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/statics/app_statics.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../../cubits/request_vacation_cubit/request_vacation_cubit.dart';

class ChooseVacationTypeDrpoMenu extends StatelessWidget {
  const ChooseVacationTypeDrpoMenu({super.key, required this.cubit});
  final RequestVacationCubit cubit;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        border: _outLineInputBorder(color: AppColors.blueAccent),
        enabledBorder: _outLineInputBorder(color: AppColors.blueAccent),
        focusedBorder: _outLineInputBorder(color: AppColors.black),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        filled: true,
        fillColor: AppColors.scaffoldBackground,
      ),
      items:
          VacationUtils.getArabicTypeNamesList().map((type) {
            return DropdownMenuItem<String>(
              value: type,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: AppText(type, translate: false),
              ),
            );
          }).toList(),
      onChanged: (String? type) {
        if (type != null) {
          cubit.vactionType(type);
        }
      },

      hint: Padding(
        padding: EdgeInsets.only(left: 8),
        child: AppText(LangKeys.vacationType),
      ),

      borderRadius: BorderRadius.circular(12),
      icon: Icon(
        HugeIcons.strokeRoundedArrowDown01,
        color: AppColors.black,
        size: 28,
      ),
      iconSize: 32,
      dropdownColor: Colors.white,
      elevation: 2,
      menuMaxHeight: 300,
      alignment: AlignmentDirectional.center,
      selectedItemBuilder: (BuildContext context) {
        return VacationUtils.getArabicTypeNamesList().map((String value) {
          return Align(
            alignment: Alignment.center,
            child: AppText(value, translate: false),
          );
        }).toList();
      },
    );
  }

  OutlineInputBorder _outLineInputBorder({Color color = Colors.grey}) {
    return OutlineInputBorder(
      borderRadius: AppBorderRadius.mediumRadius,
      borderSide: BorderSide(color: color),
    );
  }
}
