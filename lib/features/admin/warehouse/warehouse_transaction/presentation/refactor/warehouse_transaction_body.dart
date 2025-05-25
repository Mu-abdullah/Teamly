import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/language/lang_keys.dart';
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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SummaryAndWarehouseTransaction(),
          ),
          BlocBuilder<WarehouseTransactionCubit, WarehouseTransactionState>(
            builder: (context, state) {
              if (state is WarehouseTransactionLoading) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 20,
                  padding: const EdgeInsets.all(8),
                  itemBuilder:
                      (_, __) => const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: EmpShimmer(),
                      ),
                );
              } else if (state is WarehouseTransactionError) {
                return Center(child: AppText(state.error, translate: false));
              } else if (state is WarehouseTransactionEmpty) {
                return const Center(child: AppText(LangKeys.noDataFound));
              } else if (state is WarehouseTransactionSuccess) {
                return LayoutBuilder(
                  builder: (context, constraints) {
                    return constraints.maxWidth < 600
                        ? MobileWarehouseTransaction(cubit: cubit)
                        : WebWarehouseTransaction(
                          cubit: cubit,
                          transItems: state.transItems,
                        );
                  },
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
