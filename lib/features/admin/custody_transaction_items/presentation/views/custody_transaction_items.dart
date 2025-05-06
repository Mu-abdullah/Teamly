import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/services/get_it/git_it.dart';
import '../../../../../core/style/widgets/custom_app_bar.dart';
import '../../data/repo/get_custody_trans_item_repo.dart';
import '../cubits/get_custody_trans_items_cubit/get_custody_trans_items_cubit.dart';
import '../refactor/custody_transaction_items_body.dart';

class CustodyTransactionItems extends StatelessWidget {
  const CustodyTransactionItems({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    final lac = locator<GetCustodyTransItemRepo>();
    return BlocProvider(
      create:
          (context) =>
              GetCustodyTransItemsCubit(lac)..getCustodyTransItems(transId: id),
      child: Scaffold(
        appBar: CustomAppBar(title: LangKeys.custodyTransactionItems),
        body: CustodyTransactionItemsBody(),
      ),
    );
  }
}
