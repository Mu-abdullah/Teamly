import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../../core/functions/timestamp_to_time.dart';
import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/statics/app_statics.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../../../data/model/history_attendance_model.dart';

class PerviousAttendanceItem extends StatelessWidget {
  const PerviousAttendanceItem({super.key, required this.item});
  final HistoryAttendanceModel item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.scaffoldBackground,
          borderRadius: AppBorderRadius.mediumRadius,
        ),
        padding: AppPadding.smallPadding,
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                spacing: 16,
                children: [
                  CircleAvatar(
                    backgroundColor:
                        item.checkOut == null
                            ? AppColors.yellow
                            : AppColors.green,
                    child: Icon(
                      item.checkOut == null
                          ? HugeIcons.strokeRoundedMinusSign
                          : HugeIcons.strokeRoundedCheckmarkCircle01,
                      color: AppColors.white,
                    ),
                  ),
                  Expanded(child: AppText(item.date!, translate: false)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                spacing: 5,
                children: [
                  _buildItem(title: LangKeys.checkIn, value: item.checkIn!),
                  _buildItem(title: LangKeys.checkOut, value: item.checkOut),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildItem({required String title, String? value}) {
    return Row(
      children: [
        AppText(title),
        AppText(' : ', translate: false),
        AppText(
          value == null
              ? LangKeys.noLogout
              : TimeRefactor(value).toTimeString(),
          translate: value == null,
        ),
      ],
    );
  }
}
