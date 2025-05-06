import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teamly/core/style/color/app_color.dart';
import 'package:teamly/core/style/widgets/custom_snack_bar.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/widgets/app_button.dart';
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
              Expanded(
                child: ListView.builder(
                  itemCount: state.items.length,
                  itemBuilder:
                      (context, index) =>
                          TransactionItemTile(item: state.items[index]),
                ),
              ),
              TotalCountItems(cubit: cubit, items: state.items),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: AppButton(
                  onTap: () {
                    CustomSnackbar.showTopSnackBar(
                      context,
                      message: "Not Working Now",
                      backgroundColor: AppColors.yellow,
                      textColor: AppColors.black,
                      translate: false,
                    );
                  },
                  text: LangKeys.print,
                ),
              ),
            ],
          ),
          GetCustodyTransItemsError() => Center(child: AppText(state.error)),
          _ => const Center(child: CircularProgressIndicator()),
        };
      },
    );
  }
}
