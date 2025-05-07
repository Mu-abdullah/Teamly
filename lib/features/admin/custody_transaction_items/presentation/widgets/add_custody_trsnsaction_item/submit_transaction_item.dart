import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/widgets/app_button.dart';
import '../../../../../../core/style/widgets/circle_progress.dart';
import '../../../../../../core/style/widgets/custom_snack_bar.dart';
import '../../../data/model/create_custody_trans_item_model.dart';
import '../../cubits/create_custody_trans_items_cubit/create_custody_trans_items_cubit.dart';
import '../../cubits/text_field_cubit.dart';

class SubmitNewTransactionItem extends StatelessWidget {
  const SubmitNewTransactionItem({super.key, this.onTransactionAdded});
  final VoidCallback? onTransactionAdded;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: BlocConsumer<
        CreateCustodyTransItemsCubit,
        CreateCustodyTransItemsState
      >(
        listener: (context, state) {
          if (state is CreateCustodyTransItemsLoaded) {
            context.pop();
            Future.delayed(const Duration(milliseconds: 300), () {
              if (context.mounted) {
                CustomSnackbar.showTopSnackBar(
                  context,
                  message: LangKeys.addedSuccess,
                );
                context.pop();
              }
            });

            onTransactionAdded?.call();
          } else if (state is CreateCustodyTransItemsError) {
            context.pop();
            CustomSnackbar.showTopSnackBar(
              context,
              message: state.message,
              translate: false,
            );
          } else if (state is CreateCustodyTransItemsLoading) {
            showProgressIndicator(context);
          }
        },
        builder: (context, state) {
          var cubit = CreateCustodyTransItemsCubit.get(context);
          var itemsCubit = context.read<CustodyItemsCubit>();
          return AppButton(
            onTap: () {
              if (itemsCubit.getTotalPrice() > cubit.rimindingAmount) {
                CustomSnackbar.showTopSnackBar(
                  context,
                  message:
                      LangKeys.custodyTransactionAmountBigThanCustodyAmount,
                );
              } else {
                final items = itemsCubit.getNonEmptyItems();

                List<CreateCustodyTransItemModel> modelList =
                    items
                        .map((map) => CreateCustodyTransItemModel.fromJson(map))
                        .toList();
                cubit.addItems(modelList);
              }
            },
            text: LangKeys.save,
          );
        },
      ),
    );
  }
}
