import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../../core/functions/timestamp_to_time.dart';
import '../../../../../../core/language/lang_keys.dart' show LangKeys;
import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/widgets/app_text.dart';

class AttendanceDone extends StatelessWidget {
  const AttendanceDone({
    super.key,
    required this.checkIn,
    required this.checkOut,
  });

  final String checkIn;
  final String checkOut;

  @override
  Widget build(BuildContext context) {
    final formattedCheckIn = TimeRefactor(checkIn).toTimeString();
    final formattedCheckOut = TimeRefactor(checkOut).toTimeString();
    final hoursBetween = TimeRefactor(
      checkIn,
    ).timeDifferenceInHoursAndMinutes(checkOut);

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          _buildHeader(),
          const SizedBox(height: 20),
          AttendanceRow(label: LangKeys.checkIn, value: formattedCheckIn),
          const SizedBox(height: 20),
          AttendanceRow(label: LangKeys.checkOut, value: formattedCheckOut),
          const SizedBox(height: 20),
          AttendanceRow(label: LangKeys.manyHours, value: hoursBetween),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
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
    );
  }
}

class AttendanceRow extends StatelessWidget {
  final String label;
  final String value;

  const AttendanceRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: AppText(label, fontSize: 16)),
        AppText(" :  ", translate: false),
        Expanded(
          flex: 2,
          child: AppText(value, fontSize: 16, translate: false),
        ),
      ],
    );
  }
}
