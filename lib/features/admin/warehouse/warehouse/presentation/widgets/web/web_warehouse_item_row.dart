import 'package:flutter/material.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../../../core/language/lang_keys.dart';
import '../../../../../../../core/routes/routes_name.dart';
import '../../../../../../../core/style/color/app_color.dart';
import '../../../../../../../core/style/widgets/app_text.dart';
import '../../../data/model/werehouse_model.dart';

class WarehouseItemRow extends StatelessWidget {
  const WarehouseItemRow({super.key, this.item, this.index});

  final WarehouseModel? item;
  final int? index;

  bool get isNull => item == null;

  @override
  Widget build(BuildContext context) {
    final totalPrice =
        item != null
            ? "${item?.calculateTotal()} ${context.translate(LangKeys.eg)}"
            : LangKeys.totalPrice;

    return InkWell(
      onTap: () {
        if (item != null) {
          context.pushNamed(
            RoutesNames.warehouseTransaction,
            arguments: {'model': item},
          );
        }
      },
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(12),
        color: AppColors.white,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(index, context),
              const SizedBox(height: 8),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _infoChip(LangKeys.sku, item?.sku),
                  _infoChip(LangKeys.totalQuantity, item?.quantity),
                  _infoChip(LangKeys.unitType, item?.unitType),
                  Expanded(
                    child: _infoChip(LangKeys.name, item?.name, flex: 2),
                  ),
                  _infoChip(LangKeys.itemPrice, item?.price),
                  _infoChip(LangKeys.totalPrice, totalPrice),
                  _statusChip(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(int? index, BuildContext context) {
    final serialText = "${index ?? LangKeys.serial}";
    return Row(
      children: [
        Icon(Icons.inventory, color: AppColors.black),
        const SizedBox(width: 8),
        AppText(
          serialText,
          translate: index == null,
          fontSize: 20,
          isTitle: isNull,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }

  Widget _infoChip(String label, String? value, {int flex = 1}) {
    final isTitle = isNull;
    return SizedBox(
      width: flex == 2 ? 400 : 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(label, translate: true, fontSize: 12, color: AppColors.grey),
          const SizedBox(height: 4),
          AppText(
            value ?? label,
            translate: isTitle,
            fontSize: 16,
            color: AppColors.black,
            isTitle: isTitle,
            maxLines: 2,
          ),
        ],
      ),
    );
  }

  Widget _statusChip(BuildContext context) {
    final available = item?.available ?? false;
    final label =
        isNull
            ? LangKeys.status
            : available
            ? LangKeys.available
            : LangKeys.unAvailable;

    final color =
        isNull
            ? AppColors.grey
            : available
            ? AppColors.green
            : AppColors.red;

    return Chip(
      backgroundColor: color.withValues(alpha: 0.1),
      label: AppText(
        label,
        translate: true,
        color: color,
        fontSize: 14,
        isTitle: true,
      ),
    );
  }
}
