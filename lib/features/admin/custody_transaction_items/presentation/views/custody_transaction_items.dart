import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/services/get_it/git_it.dart';
import '../../../../../core/style/widgets/custom_app_bar.dart';
import '../../data/repo/get_custody_trans_item_repo.dart';
import '../cubits/get_custody_trans_items_cubit/get_custody_trans_items_cubit.dart';
import '../refactor/custody_transaction_items_body.dart';
import '../widgets/add_custody_trsnsaction_item/add_custody_transaction_item_button.dart';

class CustodyTransactionItems extends StatelessWidget {
  const CustodyTransactionItems({
    super.key,
    required this.id,
    required this.custodyAmount,
  });
  final String id;
  final String custodyAmount;
  @override
  Widget build(BuildContext context) {
    final lac = locator<GetCustodyTransItemRepo>();
    return BlocProvider(
      create:
          (context) =>
              GetCustodyTransItemsCubit(lac, custodyAmount: custodyAmount)
                ..getCustodyTransItems(transId: id),
      child: Scaffold(
        appBar: CustomAppBar(
          title:
              "${context.translate(LangKeys.custodyTransactionItems)} : $custodyAmount ${context.translate(LangKeys.eg)}",
          translate: false,
          actions: [AddCustodyTransactionItemButton(id: id)],
        ),
        body: CustodyTransactionItemsBody(),
      ),
    );
  }
}
