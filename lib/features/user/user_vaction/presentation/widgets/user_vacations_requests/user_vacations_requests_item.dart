import 'package:flutter/material.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../../core/functions/timestamp_to_time.dart';
import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/services/status/vactions_typs.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/font/fonts_helper.dart';
import '../../../../../../core/style/statics/app_statics.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../../../data/model/user_requests_vacations.dart';

class UserVacationRequestItem extends StatelessWidget {
  const UserVacationRequestItem({super.key, required this.request});

  final UserRequestsVacations request;

  @override
  Widget build(BuildContext context) {
    final isArabic = FontsHelper.isArabic(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: context.height(percent: 0.28),
        decoration: BoxDecoration(
          color: AppColors.scaffoldBackground,
          borderRadius: AppBorderRadius.mediumRadius,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            _buildStatusTag(isArabic),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    AppText(getStatus(request.type!), isTitle: true),
                    _buildInfoRow(
                      LangKeys.requestDate,
                      TimeRefactor(request.createdAt ?? '').timeString(),
                    ),
                    _buildInfoRow(LangKeys.startDate, request.startDate ?? ''),
                    _buildInfoRow(LangKeys.endDate, request.endDate ?? ''),
                    _buildInfoRow(
                      LangKeys.vacationReason,
                      request.reason ?? '',
                    ),
                    if (request.admin != null)
                      _buildInfoRow(
                        LangKeys.approved,
                        request.admin?.name ?? '',
                      ),
                    if ((request.rejectReason ?? '').isNotEmpty)
                      AppText(request.rejectReason ?? "", translate: false),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      children: [
        Expanded(flex: 1, child: AppText(label)),
        AppText(" : ", translate: false),
        Expanded(flex: 2, child: AppText(value, translate: false)),
      ],
    );
  }

  Widget _buildStatusTag(bool isArabic) {
    return Positioned(
      top: 0,
      right: isArabic ? null : 10,
      left: isArabic ? 10 : null,
      child: Container(
        decoration: BoxDecoration(
          color: _getStatusColor(request.status ?? ''),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        padding: const EdgeInsets.all(8.0),
        child: AppText(request.status ?? '', color: AppColors.white),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case VacationStatus.pending:
        return AppColors.yellow;
      case VacationStatus.approved:
        return AppColors.green;
      case VacationStatus.rejected:
        return AppColors.red;
      default:
        return AppColors.yellow;
    }
  }

  String getStatus(String status) {
    switch (status) {
      case VacationTypes.annual:
        return LangKeys.annuallVacation;
      case VacationTypes.exceptional:
        return LangKeys.exceptionalVacation;
      case VacationTypes.sickLeave:
        return LangKeys.sickLeave;
      default:
        return LangKeys.maternityLeave;
    }
  }
}
