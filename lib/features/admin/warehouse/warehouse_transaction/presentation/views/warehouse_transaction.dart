import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/style/widgets/custom_app_bar.dart';
import '../../../warehouse/data/model/get_werehouse_model.dart';
import '../cubits/warehouse_transaction_cubit/warehouse_transaction_cubit.dart';
import '../widgets/warehouse_item_suammry.dart';

class WarehouseTransaction extends StatelessWidget {
  const WarehouseTransaction({super.key, required this.model});
  final GetWarehouseModel model;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WarehouseTransactionCubit(model: model),
      child: Scaffold(
        appBar: CustomAppBar(title: model.name!, translate: false),
        body: BlocBuilder<WarehouseTransactionCubit, WarehouseTransactionState>(
          builder: (context, state) {
            var cubit = WarehouseTransactionCubit.get(context);
            return LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 600) {
                  return MobileWarehouseTransaction(cubit: cubit);
                } else {
                  return WebWarehouseTransaction(cubit: cubit);
                }
              },
            );
          },
        ),
      ),
    );
  }
}

class WebWarehouseTransaction extends StatelessWidget {
  const WebWarehouseTransaction({super.key, required this.cubit});
  final WarehouseTransactionCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: WarehouseItemSummary(cubit: cubit)),
        const SizedBox(width: 12),
        Expanded(flex: 2, child: Column(
          children: [
            // Add any additional widgets for the web layout here
          ],
        )),
      ],
    );
  }
}

class MobileWarehouseTransaction extends StatelessWidget {
  const MobileWarehouseTransaction({super.key, required this.cubit});
  final WarehouseTransactionCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(children: [WarehouseItemSummary(cubit: cubit)]);
  }
}
