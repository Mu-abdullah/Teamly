import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../../../core/functions/timestamp_to_time.dart';
import '../../../../../../../core/language/lang_keys.dart';
import '../../../../../../../core/routes/routes_name.dart';
import '../../../../../../../core/services/status/custody_status.dart';
import '../../../../../../../core/style/color/app_color.dart';
import '../../../../../../../core/style/statics/app_statics.dart';
import '../../../../../../../core/style/widgets/app_text.dart';
import '../../../data/model/custody_model.dart';

class CustodyItemWeb extends StatelessWidget {
  final CustodyModel custody;
  const CustodyItemWeb({
    super.key,
    required this.custody,
    this.showMore = true,
  });
  final bool showMore;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(
          RoutesNames.custodyTransactions,
          arguments: {'model': custody},
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: AppBorderRadius.mediumRadius,
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withValues(alpha: 0.1),
                blurRadius: 12,
                spreadRadius: 2,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 10,
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.white,
                        CustodyStatus.getStatusColor(custody.status!),
                      ],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(1.0, 0.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp,
                    ),
                    borderRadius: AppBorderRadius.mediumRadius,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Expanded(
                          child: AppText(
                            custody.name ?? '',
                            fontSize: 16,
                            color: AppColors.black,
                            translate: false,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                _buildWebItem(
                  icon: HugeIcons.strokeRoundedCalendar01,
                  title: LangKeys.custodyDate,
                  value: TimeRefactor(custody.createdAt!).toDateString(),
                ),
                _buildWebItem(
                  icon: HugeIcons.strokeRoundedPoundCircle,
                  title: LangKeys.custody,
                  value: custody.totalAmount ?? '',
                  isAmount: true,
                ),

                _buildWebItem(
                  icon:
                      custody.status == CustodyStatus.settled
                          ? HugeIcons.strokeRoundedCheckmarkCircle01
                          : HugeIcons.strokeRoundedCancelCircle,
                  title: LangKeys.custodyStatus,
                  value: _getStatusText(custody.status!),
                  translate: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buildWebItem({
    required IconData icon,
    required String title,
    required String value,
    bool isAmount = false,
    bool translate = false,
  }) {
    return Row(
      spacing: 10,
      children: [
        Icon(icon, color: CustodyStatus.getStatusColor(custody.status!)),
        AppText(title, fontSize: 16, color: AppColors.black),
        AppText(":", translate: false),
        AppText(
          translate: translate,
          value,
          fontSize: 16,
          color: AppColors.black,
        ),
        isAmount == true ? AppText(LangKeys.eg) : const SizedBox.shrink(),
      ],
    );
  }

  String _getStatusText(String status) {
    return switch (status) {
      CustodyStatus.settled => LangKeys.settled,
      CustodyStatus.notSettled => LangKeys.notSettled,
      _ => LangKeys.error,
    };
  }
}
