import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/style/widgets/custom_bottom_sheet.dart';
import '../../../../admin/admin_custody/custody_transaction_items/presentation/views/add_custody_transaction_item.dart';
import '../../../user_custody/data/model/user_custody_model.dart';
import '../cubits/get_user_custody_items_cubit/get_user_custody_items_cubit.dart';

class UserAddCustodyItem extends StatelessWidget {
  const UserAddCustodyItem({super.key, required this.item});
  final UserCustodyModel item;
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<GetUserCustodyItemsCubit>();
    return IconButton(
      icon: const Icon(HugeIcons.strokeRoundedAddCircle),
      onPressed: () {
        customShowBottomSheet(
          context: context,
          isScrollControlled: true,

          builder: (context) {
            return AddCustodyTransactionItem(
              remainingAmount: cubit.calculateRemainingAmount(),
              id: item.id!,
              onTransactionAdded: () => cubit.getItems(item.id!),
            );
          },
        );
      },
    );
  }
}
