import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/color/app_color.dart';
import '../../../../../core/style/statics/app_statics.dart';
import '../../../../../core/style/widgets/app_text.dart';
import '../../../../../core/style/widgets/custom_shimmer.dart';
import '../cubits/get_month_cubit/get_month_cubit.dart';
import '../cubits/month_attendance_cubit/month_attendance_cubit.dart';

class ChooseMonth extends StatelessWidget {
  const ChooseMonth({super.key, required this.com});
  final String com;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMonthCubit, GetMonthState>(
      builder: (c, s) {
        if (s is GetMonthLoading) {
          return CustomShimmer(
            child: Container(
              height: 50,
              width: context.width(),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: AppBorderRadius.mediumRadius,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppText(LangKeys.loading),
              ),
            ),
          );
        } else if (s is GetMonthLoaded) {
          final months = s.monthList;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: _outLineInputBorder(color: AppColors.blueAccent),
                enabledBorder: _outLineInputBorder(color: AppColors.blueAccent),
                focusedBorder: _outLineInputBorder(color: AppColors.black),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                filled: true,
                fillColor: AppColors.scaffoldBackground,
              ),
              items:
                  months.map((month) {
                    return DropdownMenuItem<String>(
                      value: month,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: AppText(month, translate: false),
                      ),
                    );
                  }).toList(),
              onChanged: (String? selectedMonth) {
                if (selectedMonth != null) {
                  context.read<MonthAttendanceCubit>().getMonthAttendance(
                    compId: com,
                    month: selectedMonth,
                  );
                }
              },
              hint: Padding(
                padding: EdgeInsets.only(left: 8),
                child: AppText(LangKeys.chooseMonth),
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
                return months.map((String value) {
                  return Align(
                    alignment: Alignment.center,
                    child: AppText(value, translate: false),
                  );
                }).toList();
              },
            ),
          );
        } else {
          return Center(
            child: AppText(s.toString(), color: Colors.red, translate: false),
          );
        }
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
