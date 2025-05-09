import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/services/get_it/git_it.dart';
import '../../../../../core/style/widgets/custom_app_bar.dart';
import '../../../custody/data/model/custody_model.dart';
import '../../data/repo/get_custody_transaction.dart';
import '../../data/repo/satteled_repo.dart';
import '../cubits/get_custody_transaction_cubit/get_custody_transaction_cubit.dart';
import '../cubits/settled_custody_cubit/settled_custody_cubit.dart';
import '../widgets/add_custody_transaction_button.dart';
import '../refactor/custody_transaction_body.dart';

class CustodyTransactions extends StatelessWidget {
  const CustodyTransactions({
    super.key,
    required this.model,
    
  });

  final CustodyModel model;
   

  @override
  Widget build(BuildContext context) {
    final lac = locator<SatteledRepo>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => (BuildContext context) {
                final repo = locator<GetCustodyTransactionRepo>();
                return GetCustodyTransactionCubit(repo: repo, custody: model)
                  ..fetchCustodyTransaction(model.id!);
              }(context),
        ),
        BlocProvider(
          create: (context) => SettledCustodyCubit(lac,  ),
        ),
      ],
      child: _CustodyTransactionsView(model: model),
    );
  }
}

class _CustodyTransactionsView extends StatelessWidget {
  const _CustodyTransactionsView({required this.model});

  final CustodyModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LangKeys.custodyDetails,
        actions: [AddCustodyTransactionbutton(id: model.id!)],
      ),
      body: SingleChildScrollView(child: CustodyTransactionsBody()),
    );
  }
}
