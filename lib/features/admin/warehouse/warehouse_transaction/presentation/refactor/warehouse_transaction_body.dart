import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teamly/core/language/lang_keys.dart';

import '../../../../../../core/style/widgets/app_text.dart';
import '../../../../custody/custody_transaction/presentation/widgets/add_custody/emp_shimmer.dart';
import '../cubits/warehouse_transaction_cubit/warehouse_transaction_cubit.dart';
import '../widgets/summary_and_add_transaction.dart';
import 'mobile_warehouse_transaction.dart';
import 'web_warehouse_transaction.dart';

class WarehouseTransactionBody extends StatelessWidget {
  const WarehouseTransactionBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = WarehouseTransactionCubit.get(context);
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SummaryAndWarehouseTransaction( ),
        ),

        BlocBuilder<WarehouseTransactionCubit, WarehouseTransactionState>(
          builder: (context, state) {
            if (state is WarehouseTransactionLoading) {
              return Expanded(
                child: ListView.builder(
                  itemCount: 20,
                  padding: const EdgeInsets.all(8),
                  itemBuilder:
                      (_, __) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const EmpShimmer(),
                      ),
                ),
              );
            } else if (state is WarehouseTransactionError) {
              return Center(child: AppText(state.error, translate: false));
            } else if (state is WarehouseTransactionEmpty) {
              return const Center(child: AppText(LangKeys.noDataFound));
            } else if (state is WarehouseTransactionSuccess) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth < 600) {
                    return MobileWarehouseTransaction(cubit: cubit);
                  } else {
                    return WebWarehouseTransaction(
                      cubit: cubit,
                      transItems: state.transItems,
                    );
                  }
                },
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ],
    );
  }
}
