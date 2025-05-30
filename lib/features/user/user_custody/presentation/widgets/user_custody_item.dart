import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../core/functions/timestamp_to_time.dart';
import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/routes/routes_name.dart';
import '../../../../../core/services/status/custody_status.dart';
import '../../../../../core/style/color/app_color.dart';
import '../../../../../core/style/widgets/app_text.dart';
import '../../data/model/user_custody_model.dart';
import 'user_custody_settaled_button.dart';

class UserCustodyItem extends StatelessWidget {
  const UserCustodyItem({super.key, required this.item});

  final UserCustodyModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          context.pushNamed(
            RoutesNames.userCustodyItem,
            arguments: {'item': item},
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: AppColors.grey.withValues(alpha: 0.2),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
            border: Border.all(color: AppColors.black.withValues(alpha: 0.1)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                const SizedBox(height: 12),
                _buildInfoTile(
                  context,
                  icon: HugeIcons.strokeRoundedDollar01,
                  label: LangKeys.custodyAmount,
                  value: '${item.amount} EGP',
                ),
                _buildDivider(),
                _buildInfoTile(
                  context,
                  icon: HugeIcons.strokeRoundedUser,
                  label: LangKeys.createdBy,
                  value: item.userId!,
                ),
                _buildDivider(),
                _buildStatus(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Icon(
          HugeIcons.strokeRoundedCalendar01,
          size: 18,
          color: AppColors.darkGrey,
        ),
        AppText(
          TimeRefactor(item.createdAt!).toDateString(),
          color: AppColors.darkGrey.withValues(alpha: 0.8),
          translate: false,
        ),
        Spacer(),
        if (item.status! == CustodyStatus.notSettled)
          UserSettaledButton(item: item),
      ],
    );
  }

  Widget _buildInfoTile(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        spacing: 12,
        children: [
          Icon(icon, size: 20, color: AppColors.black),
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${context.translate(label)}: ',
                    style: customTextStyle(context, color: AppColors.grey),
                  ),
                  TextSpan(text: value, style: customTextStyle(context)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatus() {
    final statusColor = CustodyStatus.getStatusColor(item.status!);
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Icon(
            HugeIcons.strokeRoundedNotification01,
            size: 20,
            color: statusColor,
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: statusColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: AppText(item.status!, fontSize: 11),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Divider(height: 1, color: AppColors.grey.withValues(alpha: 0.5)),
    );
  }
}

