import 'package:flutter/material.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/widgets/app_text.dart';
import '../../data/model/custody_transaction_model.dart';
import '../cubits/get_custody_transaction_cubit/get_custody_transaction_cubit.dart';

import 'package:flutter_animate/flutter_animate.dart';

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
    final remainingAmount =
        100.00; //cubit.calculateRemainingAmount(custodyTransaction);
    final isNegative = remainingAmount < 0;

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
          children: [
            // Header
            Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              decoration: BoxDecoration(
                color: theme.primaryColor.withValues(alpha: 0.05),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
              ),
              child: AppText(
                LangKeys.custodySummary,
                fontSize: context.titleLarge!.fontSize,
                fontWeight: FontWeight.bold,
                color: theme.primaryColor,
              ),
            ),

            // Summary Cards
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                      _buildSummaryCard(
                        context,
                        title: LangKeys.custody,
                        value: 100.00,
                        icon: Icons.account_balance_wallet_rounded,
                        gradient: LinearGradient(
                          colors: [
                            theme.primaryColor,
                            theme.primaryColor.withValues(alpha: 0.7),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildSummaryCard(
                        context,
                        title: LangKeys.spended,
                        value: cubit.sumAmount(custodyTransaction),
                        icon: Icons.trending_down_rounded,
                        gradient: const LinearGradient(
                          colors: [Colors.orange, Color(0xFFFFA726)],
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildSummaryCard(
                        context,
                        title: LangKeys.rimaining,
                        value: remainingAmount.abs(),
                        icon:
                            isNegative
                                ? Icons.error_outline
                                : Icons.trending_up_rounded,
                        gradient: LinearGradient(
                          colors:
                              isNegative
                                  ? [Colors.red, Colors.redAccent]
                                  : [Colors.green, Colors.greenAccent],
                        ),
                        isNegative: isNegative,
                      ),
                    ]
                    .animate(interval: 200.ms)
                    .fadeIn(duration: 400.ms)
                    .slideY(begin: 0.2),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(
    BuildContext context, {
    required String title,
    required double value,
    required IconData icon,
    required LinearGradient gradient,
    bool isNegative = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title,
                  color: Colors.white,
                  fontSize: context.titleMedium!.fontSize,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    if (isNegative)
                      const AppText(
                        '-',
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    AppText(
                      value.toStringAsFixed(2),
                      color: Colors.white,
                      fontSize: context.titleLarge!.fontSize,
                      fontWeight: FontWeight.bold,
                      translate: false,
                    ),
                    const SizedBox(width: 6),
                    AppText(
                      LangKeys.eg,
                      color: Colors.white70,
                      fontSize: context.bodySmall!.fontSize,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().scale(duration: 300.ms, curve: Curves.easeOut);
  }
}
