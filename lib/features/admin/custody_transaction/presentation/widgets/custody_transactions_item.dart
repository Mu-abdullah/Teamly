import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../core/functions/timestamp_to_time.dart';
import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/routes/routes_name.dart';
import '../../../../../core/services/status/custody_status.dart';
import '../../../../../core/style/color/app_color.dart';
import '../../../../../core/style/widgets/app_text.dart';
import '../../data/model/custody_transaction_model.dart';
import '../cubits/get_custody_transaction_cubit/get_custody_transaction_cubit.dart';

class CustodyTransactionItem extends StatelessWidget {
  const CustodyTransactionItem({super.key, required this.transaction});

  final CustodyTransactionModel transaction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: () => _handleTap(context),
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: _buildItemDecoration(),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
                  children: [
                    _buildHeader(),
                    const SizedBox(height: 12),
                    _buildInfoRow(
                      context,
                      icon: Icons.person_outline_rounded,
                      label: LangKeys.name,
                      value: transaction.empId!,
                    ),
                    _buildDivider(),
                    _buildInfoRow(
                      context,
                      icon: Icons.assignment_ind_rounded,
                      label: LangKeys.createdBy,
                      value: transaction.userId!,
                    ),
                    _buildDivider(),
                    _buildStatusRow(),
                  ],
                )
                .animate()
                .fadeIn(duration: 400.ms)
                .slideX(begin: 0.2, duration: 300.ms, curve: Curves.easeOut),
          ),
        ),
      ),
    );
  }

  void _handleTap(BuildContext context) {
    context.pushNamed(
      RoutesNames.custodyTransactionsItems,
      arguments: {
        'id': transaction.id,
        'custodyAmount': transaction.amount,
        'superCustodyStatus':
            context.read<GetCustodyTransactionCubit>().custody.status,
      },
    );
  }

  BoxDecoration _buildItemDecoration() {
    return BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: AppColors.grey.withValues(alpha: 0.15),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ],
      border: Border.all(color: AppColors.black.withValues(alpha: 0.1)),
    );
  }

  Widget _buildHeader() {
    return Row(
      spacing: 8,
      children: [
        Icon(Icons.calendar_today_rounded, size: 18, color: AppColors.darkGrey),

        AppText(
          TimeRefactor(transaction.createdAt!).toDateString(),
          fontSize: 14,
          translate: false,
          color: AppColors.darkGrey,
        ),
        const Spacer(),
        Chip(
          backgroundColor: AppColors.black.withValues(alpha: 0.1),
          label: Row(
            spacing: 4,
            children: [
              AppText(
                transaction.amount!,
                color: AppColors.black,
                translate: false,
              ),
              AppText(LangKeys.eg, color: AppColors.black, fontSize: 10),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppColors.darkGrey),
          const SizedBox(width: 12),
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${context.translate(label)} : ',
                    style: customTextStyle(
                      context,
                      fontSize: 14,
                      color: AppColors.darkGrey,
                    ),
                  ),
                  TextSpan(
                    text: value,
                    style: customTextStyle(
                      context,
                      fontSize: 14,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusRow() {
    final statusColor = _getStatusColor(transaction.status!);
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        spacing: 12,
        children: [
          Icon(Icons.circle, size: 16, color: statusColor),

          Expanded(
            child: AppText(
              transaction.status!,
              color: statusColor,
              fontSize: 14,
              translate: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 0.8,
      color: AppColors.grey.withValues(alpha: 0.3),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case CustodyStatus.notSettled:
        return AppColors.orange;
      case CustodyStatus.settled:
        return AppColors.green;
      default:
        return AppColors.red;
    }
  }
}
