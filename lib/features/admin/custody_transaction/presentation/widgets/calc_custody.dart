import 'package:flutter/material.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/services/status/custody_status.dart';
import '../../../../../core/style/color/app_color.dart';
import '../../../../../core/style/widgets/app_space.dart';
import '../../../../../core/style/widgets/app_text.dart';
import '../../data/model/custody_transaction_model.dart';
import '../cubits/get_custody_transaction_cubit/get_custody_transaction_cubit.dart';

import 'package:flutter_animate/flutter_animate.dart';

import 'satteled_button.dart';

class CalcCustody extends StatelessWidget {
  const CalcCustody({
    super.key,
    required this.cubit,
    required this.custodyTransaction,
  });

  final GetCustodyTransactionCubit cubit;
  final List<CustodyTransactionModel> custodyTransaction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final remainingAmount = cubit.calculateRemainingAmount();
    final isNegative = remainingAmount < 0;
    final isNotSatteled = cubit.custody.status == CustodyStatus.notSettled;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [theme.cardColor, theme.cardColor.withValues(alpha: 0.9)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: theme.shadowColor.withValues(alpha: 0.15),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
                AppSpace(space: 4),
                // Header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: AppText(
                          LangKeys.custodySummary,
                          fontSize: context.labelMedium!.fontSize,
                          color: AppColors.black,
                        ),
                      ),
                      SatteledButton(
                        isNotSatteled: isNotSatteled,
                        cubit: cubit,
                      ),
                    ],
                  ),
                ),
                _buildSummaryCard(
                  context,
                  title: LangKeys.custody,
                  value: double.parse(cubit.custody.totalAmount!),
                  icon: Icons.account_balance_wallet_rounded,
                ),

                _buildSummaryCard(
                  context,
                  title: LangKeys.spended,
                  value: cubit.sumAmount(custodyTransaction),
                  icon: Icons.trending_down_rounded,
                ),
                _buildSummaryCard(
                  context,
                  title: LangKeys.rimaining,
                  value: remainingAmount.abs(),
                  icon:
                      isNegative
                          ? Icons.error_outline
                          : Icons.trending_up_rounded,

                  isNegative: isNegative,
                ),
                AppSpace(space: 4),
              ]
              .animate(interval: 200.ms)
              .fadeIn(duration: 400.ms)
              .slideY(begin: 0.2),
        ),
      ),
    );
  }

  Widget _buildSummaryCard(
    BuildContext context, {
    required String title,
    required double value,
    required IconData icon,

    bool isNegative = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.blueBlack,
        ),
        child: Row(
          spacing: 16,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white),
            ),
            Expanded(
              child: Row(
                spacing: 6,
                children: [
                  AppText(title, color: Colors.white),
                  AppText(" :", color: Colors.white70, translate: false),
                  if (isNegative)
                    const AppText(
                      '-',
                      color: Colors.white,
                      translate: false,
                      fontWeight: FontWeight.bold,
                    ),
                  AppText(
                    value.round().toString(),
                    color: Colors.white,
                    translate: false,
                  ),

                  AppText(LangKeys.eg, color: Colors.white70, fontSize: 11),
                ],
              ),
            ),
          ],
        ),
      ).animate().scale(duration: 300.ms, curve: Curves.easeOut),
    );
  }
}
