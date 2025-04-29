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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: AppBorderRadius.mediumRadius,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(att.date!, translate: false),
              Row(
                children: [
                  Expanded(
                    child: AppText(att.emp!.position!, translate: false),
                  ),
                  AppText(
                    att.emp!.id!,
                    translate: false,
                    color: AppColors.darkGrey,
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: AppText(
                      att.emp!.name!,
                      translate: false,
                      isTitle: true,
                    ),
                  ),
                  att.checkOut == null
                      ? const SizedBox()
                      : AppText(
                        TimeRefactor(
                          att.checkIn!,
                        ).timeDifferenceInHoursAndMinutes(att.checkOut!),
                        translate: false,
                        color: AppColors.darkGrey,
                      ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      AppText(LangKeys.checkIn),
                      AppText(" : ", translate: false),
                      AppText(
                        TimeRefactor(att.checkIn!).toTimeString(),
                        translate: false,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      AppText(LangKeys.checkOut),
                      AppText(" : ", translate: false),

                      AppText(
                        att.checkOut == null
                            ? LangKeys.noLogout
                            : TimeRefactor(att.checkOut!).toTimeString(),
                        translate: att.checkOut == null,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
