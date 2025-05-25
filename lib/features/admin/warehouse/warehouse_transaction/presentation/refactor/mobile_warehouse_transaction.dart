import 'package:flutter/material.dart';
import 'package:teamly/core/extextions/extentions.dart';
import 'package:teamly/core/language/lang_keys.dart';

import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../cubits/warehouse_transaction_cubit/warehouse_transaction_cubit.dart';

class MobileWarehouseTransaction extends StatelessWidget {
  const MobileWarehouseTransaction({super.key, required this.cubit});
  final WarehouseTransactionCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: cubit.results.length,
      itemBuilder: (_, index) {
        var item = cubit.results[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: [
                _buildItemRow(title: LangKeys.itemName, value: item.warehouse!),
                _buildItemRow(
                  title: LangKeys.totalQuantity,
                  value: "${item.quantity!} ${item.unitType}",
                ),
                _buildItemRow(title: LangKeys.name, value: item.emp!),
                _buildItemRow(title: LangKeys.position, value: item.position!),
                _buildItemRow(
                  title: LangKeys.itemPrice,
                  value: "${item.price!} ${context.translate(LangKeys.eg)}",
                ),
                _buildItemRow(title: LangKeys.category, value: item.category!),
              ],
            ),
          ),
        );
      },
    );
  }

  Row _buildItemRow({required String title, required String value}) {
    return Row(
      spacing: 5,
      children: [
        Expanded(flex: 2, child: AppText(title)),
        AppText(":", translate: false),
        Expanded(flex: 3, child: AppText(value, translate: false)),
      ],
    );
  }
}
