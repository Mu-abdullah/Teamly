import 'package:flutter/material.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../../../core/language/lang_keys.dart';
import '../../../../../../../core/routes/routes_name.dart';
import '../../../../../../../core/style/color/app_color.dart';
import '../../../../../../../core/style/widgets/app_text.dart';
import '../../../data/model/get_werehouse_model.dart';

class MobileItem extends StatefulWidget {
  const MobileItem({super.key, required this.item});

  final GetWarehouseModel? item;

  @override
  State<MobileItem> createState() => _MobileItemState();
}

class _MobileItemState extends State<MobileItem> {
  bool _isExpanded = false;

  bool get isNull => widget.item == null;

  @override
  Widget build(BuildContext context) {
    final totalPrice =
        widget.item != null
            ? "${widget.item?.calculateTotal()} ${context.translate(LangKeys.eg)}"
            : LangKeys.totalPrice;

    return GestureDetector(
      onTap: () => setState(() => _isExpanded = !_isExpanded),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: isNull ? AppColors.grey : AppColors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                AnimatedCrossFade(
                  firstChild: const SizedBox.shrink(),
                  secondChild: Column(
                    spacing: 5,
                    children: [
                      const Divider(height: 20, thickness: 1),
                      _buildInfoRow(context, LangKeys.sku, widget.item?.sku),
                      _buildInfoRow(
                        context,
                        LangKeys.totalQuantity,
                        widget.item?.quantity,
                      ),
                      _buildInfoRow(
                        context,
                        LangKeys.unitType,
                        widget.item?.unitType,
                      ),

                      _buildInfoRow(
                        context,
                        LangKeys.itemPrice,
                        widget.item?.price,
                      ),
                      _buildInfoRow(context, LangKeys.totalPrice, totalPrice),
                      const SizedBox(height: 12),
                    ],
                  ),
                  crossFadeState:
                      _isExpanded
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 300),
                ),
                Row(
                  spacing: 8,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStatusBadge(context),
                    IconButton(
                      onPressed: () {
                        context.pushNamed(
                          RoutesNames.warehouseTransaction,
                          arguments: {'model': widget.item},
                        );
                      },
                      icon: CircleAvatar(
                        backgroundColor: AppColors.black.withValues(alpha: 0.1),
                        child: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final name = widget.item?.name;
    return Row(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 10,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.black.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.inventory_2_rounded,
                color: AppColors.black,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            AppText(
              name!,
              translate: widget.item == null,

              color: isNull ? AppColors.grey : AppColors.black,
              isTitle: isNull,
            ),
          ],
        ),
        Icon(
          _isExpanded ? Icons.expand_less : Icons.expand_more,
          color: AppColors.black,
          size: 24,
        ),
      ],
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String? value) {
    final isTitle = isNull;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: AppText(
              label,
              translate: true,
              fontSize: 14,
              color: AppColors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            flex: 3,
            child: AppText(
              value ?? label,
              translate: isTitle,
              fontSize: 16,
              color: isNull ? AppColors.grey : AppColors.black,
              isTitle: isTitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(BuildContext context) {
    final available = widget.item?.available ?? false;
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

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: color.withValues(alpha: 0.5), width: 1),
      ),
      child: Row(
        spacing: 10,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.only(right: 6),
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          AppText(
            label,
            translate: true,
            color: color,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
