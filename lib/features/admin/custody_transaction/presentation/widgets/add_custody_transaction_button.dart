import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/style/widgets/custom_bottom_sheet.dart';
import '../cubits/get_custody_transaction_cubit/get_custody_transaction_cubit.dart';
import '../views/add_custody_transaction_bottom_sheet.dart';

class AddCustodyTransactionbutton extends StatelessWidget {
  const AddCustodyTransactionbutton({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<GetCustodyTransactionCubit>();
    return IconButton(
      onPressed: () {
        customShowBottomSheet(
          context: context,
          isScrollControlled: true,
          builder:
              (context) => AddCustodyTranactionBottomSheet(
                id: id,
                rimingAmount: cubit.calculateRemainingAmount().toString(),
                onTransactionAdded: () => cubit.fetchCustodyTransaction(id),
              ),
        );
      },
      icon: const Icon(HugeIcons.strokeRoundedAddCircle),
    );
  }
}
