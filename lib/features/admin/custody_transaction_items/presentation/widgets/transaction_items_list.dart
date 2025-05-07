import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/widgets/app_text.dart';
import '../cubits/get_custody_trans_items_cubit/get_custody_trans_items_cubit.dart';
import 'items_counts_prices.dart';
import 'trans_action_tile.dart';

class TransactionItemsList extends StatelessWidget {
  const TransactionItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCustodyTransItemsCubit, GetCustodyTransItemsState>(
      builder: (context, state) {
        var cubit = GetCustodyTransItemsCubit.get(context);
        return switch (state) {
          GetCustodyTransItemsLoaded() => Column(
            spacing: 10,
            children: [
              state.items.isEmpty
                  ? Expanded(
                    child: const Center(child: AppText(LangKeys.noDataFound)),
                  )
                  : Expanded(
                    child: ListView.builder(
                      itemCount: state.items.length,
                      itemBuilder:
                          (context, index) =>
                              TransactionItemTile(item: state.items[index]),
                    ),
                  ),
              TotalCountItems(cubit: cubit, items: state.items),
            ],
          ),
          GetCustodyTransItemsError() => Center(child: AppText(state.error)),
          _ => const Center(child: CircularProgressIndicator()),
        };
      },
    );
  }
}
