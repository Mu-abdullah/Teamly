import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../../core/functions/timestamp_to_time.dart';
import '../../../../../../core/language/lang_keys.dart' show LangKeys;
import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/widgets/app_text.dart';


class AttendancDone extends StatelessWidget {
  const AttendancDone({
    super.key,
    required this.checkIn,
    required this.checkOut,
  });
  final String checkIn;
  final String checkOut;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
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
          Row(
            children: [
              Expanded(flex: 1, child: AppText(LangKeys.checkIn, fontSize: 16)),
              AppText(" :  ", translate: false),
              Expanded(
                flex: 2,
                child: AppText(
                  TimeRefactor.yyyymmddString(checkIn),
                  fontSize: 16,
                  translate: false,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: AppText(LangKeys.checkOut, fontSize: 16),
              ),
              AppText(" :  ", translate: false),
              Expanded(
                flex: 2,
                child: AppText(
                  TimeRefactor.yyyymmddString(checkOut),
                  fontSize: 16,
                  translate: false,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}