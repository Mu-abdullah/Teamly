import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/services/get_it/git_it.dart';
import '../../data/repo/create_custody_trans_item_repo.dart';
import '../cubits/create_custody_trans_items_cubit/create_custody_trans_items_cubit.dart';
import '../cubits/text_field_cubit.dart';
import '../refactor/add_custody_transaction_item_body.dart';

class AddCustodyTransactionItem extends StatelessWidget {
  const AddCustodyTransactionItem({
    super.key,
    this.onTransactionAdded,
    required this.id,
    required this.remainingAmount,
  });
  final VoidCallback? onTransactionAdded;
  final String id;
  final double remainingAmount;
  @override
  Widget build(BuildContext context) {
    final lac = locator<CreateCustodyTransItemRepo>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => CreateCustodyTransItemsCubit(
                lac,
                rimindingAmount: remainingAmount,
              ),
        ),
        BlocProvider(create: (context) => CustodyItemsCubit(context, id: id)),
      ],
      child: BlocBuilder<
        CreateCustodyTransItemsCubit,
        CreateCustodyTransItemsState
      >(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: AddCustodyTransactionItemBody(
                  remainingAmount: remainingAmount.toString(),
                  onTransactionAdded: onTransactionAdded,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
