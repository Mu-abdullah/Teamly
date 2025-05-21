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
            return Column(children: [WarehouseItemSummary(cubit: cubit)]);
          },
        ),
      ),
    );
  }
}
