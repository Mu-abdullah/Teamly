import 'package:flutter/material.dart';

import '../../../../../../core/functions/timestamp_to_time.dart';
import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/statics/app_statics.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../../../data/model/month_admin_attendance.dart';

class ReportItem extends StatelessWidget {
  const ReportItem({super.key, required this.att});

  final MonthAdminAttendance att;

  bool get hasCheckOut => att.checkOut != null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 140,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: AppBorderRadius.mediumRadius,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Stack(
            children: [
              if (!hasCheckOut) _buildNoLogoutLabel(),
              Positioned.fill(child: _buildReportDetails()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNoLogoutLabel() {
    return Positioned(
      top: 0,
      left: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: const BoxDecoration(
          color: AppColors.red,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: const AppText(
          LangKeys.noLogout,
          color: AppColors.white,
          translate: true,
        ),
      ),
    );
  }

  Widget _buildReportDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(att.date!, translate: false),

        _buildPositionAndIdRow(),

        _buildNameAndDurationRow(),

        _buildCheckTimes(),
      ],
    );
  }

  Widget _buildPositionAndIdRow() {
    return Row(
      children: [
        Expanded(
          child: AppText(
            att.emp!.position!,
            translate: false,
            fontSize: 11,
            color: AppColors.darkGrey,
          ),
        ),
        AppText(
          att.emp!.id!,
          translate: false,
          color: AppColors.darkGrey,
          fontSize: 9,
        ),
      ],
    );
  }

  Widget _buildNameAndDurationRow() {
    return Row(
      children: [
        Expanded(child: AppText(att.emp!.name!, translate: false)),
        if (hasCheckOut)
          AppText(
            TimeRefactor(
              att.checkIn!,
            ).timeDifferenceInHoursAndMinutes(att.checkOut!),
            translate: false,
            color: AppColors.darkGrey,
          ),
      ],
    );
  }

  Widget _buildCheckTimes() {
    return Column(
      children: [
        Row(
          children: [
            AppText(LangKeys.checkIn, fontSize: 10),
            const AppText(" : ", translate: false),
            AppText(
              TimeRefactor(att.checkIn!).toTimeString(),
              translate: false,
            ),
          ],
        ),
        if (hasCheckOut)
          Row(
            children: [
              AppText(LangKeys.checkOut, fontSize: 10),
              const AppText(" : ", translate: false),
              AppText(
                TimeRefactor(att.checkOut!).toTimeString(),
                translate: false,
              ),
            ],
          ),
      ],
    );
  }
}
