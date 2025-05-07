import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/services/get_it/git_it.dart';
import '../../data/repo/create_custody_trans_item_repo.dart';
import '../cubits/create_custody_trans_items_cubit/create_custody_trans_items_cubit.dart';
import '../cubits/text_field_cubit.dart';
import '../widgets/add_custody_trsnsaction_item/dynamic_text_fields.dart';

class AddCustodyTransactionItem extends StatelessWidget {
  const AddCustodyTransactionItem({super.key});

  @override
  Widget build(BuildContext context) {
    final lac = locator<CreateCustodyTransItemRepo>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CreateCustodyTransItemsCubit(lac)),
        BlocProvider(create: (context) => CustodyItemsCubit()),
      ],
      child: BlocBuilder<
        CreateCustodyTransItemsCubit,
        CreateCustodyTransItemsState
      >(
        builder: (context, state) {
          return Column(children: [Expanded(child: DynamicTextFields())]);
        },
      ),
    );
  }
}
