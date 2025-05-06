import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../core/functions/timestamp_to_time.dart';
import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/widgets/app_text.dart';
import '../../data/model/custody_transaction_model.dart';

class CustodyTransactionItem extends StatelessWidget {
  const CustodyTransactionItem({super.key, required this.transaction});

  final CustodyTransactionModel transaction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  theme.colorScheme.primaryContainer,
                  theme.colorScheme.primaryContainer.withValues(alpha: 0.85),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: theme.shadowColor.withValues(alpha: 0.15),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Date/Time Indicator
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.access_time_rounded,

                      color: theme.colorScheme.primary,
                    ),
                  ),

                  // Transaction Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          TimeRefactor(transaction.createdAt!).toDateString(),
                          translate: false,
                          color: theme.textTheme.bodySmall?.color,
                        ),
                        AppText(transaction.empId!, translate: false),
                        AppText(transaction.userId!, translate: false),
                      ],
                    ),
                  ),

                  // Amount
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.secondary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        AppText(
                          transaction.amount!,
                          translate: false,
                          color: theme.colorScheme.secondary,
                        ),
                        const SizedBox(width: 6),
                        AppText(
                          LangKeys.eg,
                          color: theme.colorScheme.secondary.withValues(
                            alpha: 0.7,
                          ),
                          fontSize: context.bodySmall!.fontSize,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
          .animate()
          .fadeIn(duration: 400.ms)
          .slideX(begin: 0.2, duration: 300.ms, curve: Curves.easeOut),
    );
  }
}
