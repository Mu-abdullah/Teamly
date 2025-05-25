import 'package:flutter/material.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../../core/functions/timestamp_to_time.dart';
import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../../data/model/warehouse_transaction_model.dart';
import '../cubits/warehouse_transaction_cubit/warehouse_transaction_cubit.dart';
import '../widgets/summary_and_add_transaction.dart';

class WebWarehouseTransaction extends StatelessWidget {
  const WebWarehouseTransaction({
    super.key,
    required this.cubit,
    required this.transItems,
  });
  final WarehouseTransactionCubit cubit;
  final List<WarehouseTransactionModel> transItems;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SummaryAndWarehouseTransaction(),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 2,
          child: ListView.builder(
            itemCount: transItems.length,
            itemBuilder: (_, __) {
              var item = transItems[__];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: WarehouseItemTransaction(item: item),
              );
            },
          ),
        ),
      ],
    );
  }
}

class WarehouseItemTransaction extends StatelessWidget {
  const WarehouseItemTransaction({super.key, required this.item});

  final WarehouseTransactionModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status Indicator
            _buildStatusIndicator(context),
            const SizedBox(width: 16),
            // Main Content
            Expanded(
              child: Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SKU and Category
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        item.sku?.isNotEmpty == true ? item.sku! : 'N/A',
                        color: Colors.indigo[600],
                        translate: false,
                      ),
                      AppText(
                        item.category?.isNotEmpty == true
                            ? item.category!
                            : 'Uncategorized',
                        color: Colors.grey[600],
                        translate: false,
                      ),
                    ],
                  ),

                  // Date and Unit Type
                  Wrap(
                    spacing: 16,
                    children: [
                      _InfoChip(
                        label: LangKeys.createdAt,
                        value: TimeRefactor(item.createdAt!).toDateString(),
                      ),
                    ],
                  ),

                  // Price and Quantity
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _InfoChip(
                        label: LangKeys.itemPrice,
                        value:
                            item.price?.isNotEmpty == true
                                ? "${item.price} ${context.translate(LangKeys.eg)}"
                                : 'N/A',
                      ),
                      _InfoChip(
                        label: LangKeys.totalQuantity,
                        value:
                            item.quantity?.isNotEmpty == true
                                ? "${item.quantity} ${item.unitType?.isNotEmpty == true ? item.unitType! : 'N/A'}"
                                : 'N/A',
                      ),
                    ],
                  ),

                  // Total
                  AppText(
                    '${context.translate(LangKeys.totalPrice)}: ${item.calculateTotal().toStringAsFixed(2)} ${context.translate(LangKeys.eg)}',
                    color: Colors.green[700],
                    translate: false,
                  ),

                  // Employee and Position
                  AppText(
                    '${item.emp?.isNotEmpty == true ? item.emp! : 'Unknown'} (${item.position?.isNotEmpty == true ? item.position! : 'N/A'})',
                    color: Colors.grey[700],
                    translate: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget for status indicator
  Widget _buildStatusIndicator(BuildContext context) {
    return Container(
      width: 8,
      height: 80,
      decoration: BoxDecoration(
        color: _getStatusColor(),
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
    );
  }

  // Determine status color based on some item property (e.g., quantity)
  Color _getStatusColor() {
    final quantity = int.tryParse(item.quantity ?? '0') ?? 0;
    if (quantity > 0) {
      return Colors.green;
    } else if (quantity < 0) {
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }
}

// Helper widget for info chips
class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: AppText(
        '${context.translate(label)}: $value',
        fontSize: 12,
        translate: false,
        color: Colors.grey[800],
      ),
    );
  }
}

// Placeholder for WarehouseTransactionModel (adjust as per your model)
