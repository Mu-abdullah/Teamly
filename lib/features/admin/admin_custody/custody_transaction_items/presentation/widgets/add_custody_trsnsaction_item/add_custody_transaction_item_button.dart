import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../../../core/language/lang_keys.dart';
import '../../../../../../../core/style/color/app_color.dart';
import '../../../../../../../core/style/widgets/custom_bottom_sheet.dart';
import '../../../../../../../core/style/widgets/custom_snack_bar.dart';
import '../../cubits/get_custody_trans_items_cubit/get_custody_trans_items_cubit.dart';
import '../../views/add_custody_transaction_item.dart';

class AddCustodyTransactionItemButton extends StatelessWidget {
  const AddCustodyTransactionItemButton({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<GetCustodyTransItemsCubit>();
    return IconButton(
      icon: const Icon(HugeIcons.strokeRoundedAddCircle),
      onPressed: () {
        if (cubit.calculateRemainingAmount() == 0) {
          CustomSnackbar.showTopSnackBar(
            context,
            message: LangKeys.noRemainingAmount,
            backgroundColor: AppColors.red,
            top: false,
          );
        } else {
          customShowBottomSheet(
            context: context,
            isScrollControlled: true,

            builder: (context) {
              return AddCustodyTransactionItem(
                onTransactionAdded:
                    () => cubit.getCustodyTransItems(transId: id),
                remainingAmount: cubit.calculateRemainingAmount(),
                id: id,
              );
            },
          );
        }
      },
    );
  }
}
