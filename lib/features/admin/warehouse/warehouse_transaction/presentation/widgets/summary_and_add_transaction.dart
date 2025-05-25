import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/widgets/app_button.dart';
import '../../../../../../core/style/widgets/custom_bottom_sheet.dart';
import '../cubits/warehouse_transaction_cubit/warehouse_transaction_cubit.dart';
import 'ware_house_transaction_bottom_sheet.dart';
import 'warehouse_item_suammry.dart';

class SummaryAndWarehouseTransaction extends StatelessWidget {
  const SummaryAndWarehouseTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<WarehouseTransactionCubit>();
    return Column(
      spacing: 10,
      children: [
        WarehouseItemSummary(cubit: cubit),
        AppButton(
          isDisabled: cubit.calculateRemainingAmount() <= 0,
          isLoading: cubit.state is WarehouseTransactionLoading,
          onTap: () {
            customShowBottomSheet(
              context: context,
              builder:
                  (context) => WarehouseTransactionBottomSheet(
                    quantity: cubit.calculateRemainingAmount().toStringAsFixed(
                      0,
                    ),
                    warehouseId: cubit.model.id!,
                    onClose:
                        () => cubit.getTransItems(warehouse: cubit.model.id!),
                  ),
            );
          },
          text: LangKeys.exitQuantity,
        ),
      ],
    );
  }
}
