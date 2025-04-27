import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../../cubits/check_attendance_cubit/check_attendance_cubit.dart';
import 'check_in_out_buttons.dart';

class CheckAttendance extends StatelessWidget {
  const CheckAttendance({
    super.key,
    required this.cubit,
    required this.showCheckIn,
    required this.showCheckOut,
  });

  final CheckAttendanceCubit cubit;
  final bool showCheckIn;
  final bool showCheckOut;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  children: [
                    Icon(
                      HugeIcons.strokeRoundedTime04,
                      color: AppColors.blueAccent,
                      size: 24,
                    ),
                    const SizedBox(width: 8),
                    AppText(
                      LangKeys.attendanceLeaving,
                      isTitle: true,
                      fontSize: 20,
                      color: AppColors.blueAccent,
                    ),
                  ],
                ),
              ),
              CheckInOutButtons(
                cubit: cubit,
                showCheckIn: showCheckIn,
                showCheckOut: showCheckOut,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
