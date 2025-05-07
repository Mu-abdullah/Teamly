import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../../core/style/widgets/custom_bottom_sheet.dart';
import '../../cubits/get_custody_trans_items_cubit/get_custody_trans_items_cubit.dart';
import '../../views/add_custody_transactionI_item.dart';

class AddCustodyTransactionItemButton extends StatelessWidget {
  const AddCustodyTransactionItemButton({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<GetCustodyTransItemsCubit>();
    return IconButton(
      icon: const Icon(HugeIcons.strokeRoundedAddCircle),
      onPressed: () {
        customShowBottomSheet(
          context: context,
          isScrollControlled: true,

          builder: (context) {
            return AddCustodyTransactionItem(
              onTransactionAdded: () => cubit.getCustodyTransItems(transId: id),
              id: id,
            );
          },
        );
      },
    );
  }
}
