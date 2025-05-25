import 'package:flutter/material.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../cubits/warehouse_transaction_cubit/warehouse_transaction_cubit.dart';

class WarehouseItemSummary extends StatelessWidget {
  const WarehouseItemSummary({super.key, required this.cubit});

  final WarehouseTransactionCubit cubit;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.white, AppColors.blueAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeaderRow(context),
          const SizedBox(height: 12),
          _buildDetailsRow(context),
          const SizedBox(height: 12),
          AppText(
            '${context.translate(LangKeys.rimaining)}: ${cubit.calculateRemainingAmount().toStringAsFixed(0)}',
            translate: false,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: AppText(
            cubit.model.sku!,
            translate: false,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          flex: 2,
          child: AppText(
            cubit.model.category!,
            translate: false,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        _buildStatusChip(context),
      ],
    );
  }

  Widget _buildStatusChip(BuildContext context) {
    final isAvailable = cubit.model.available!;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color:
            isAvailable
                ? AppColors.green.withValues(alpha: 0.2)
                : AppColors.red.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color:
              isAvailable
                  ? AppColors.green.withValues(alpha: 0.5)
                  : AppColors.red.withValues(alpha: 0.5),
        ),
      ),
      child: Row(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.only(right: 6),
            decoration: BoxDecoration(
              color: isAvailable ? AppColors.green : AppColors.red,
              shape: BoxShape.circle,
            ),
          ),
          AppText(
            isAvailable ? LangKeys.available : LangKeys.unAvailable,
            translate: true,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isAvailable ? AppColors.green : AppColors.red,
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsRow(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppText(
            cubit.model.quantity!,
            translate: false,
            fontSize: 14,

            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          child: AppText(
            cubit.model.unitType!,
            translate: false,
            fontSize: 14,

            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const Spacer(),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppText(
              cubit.model.price!,
              translate: false,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(width: 4),
            AppText(LangKeys.eg, translate: true, fontSize: 14),
          ],
        ),
      ],
    );
  }
}
