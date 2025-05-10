import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/services/get_it/git_it.dart';
import '../../../../../core/services/status/custody_status.dart';
import '../../../../../core/style/widgets/custom_app_bar.dart';
import '../../../custody/data/model/custody_model.dart';
import '../../data/repo/get_custody_transaction.dart';
import '../cubits/get_custody_transaction_cubit/get_custody_transaction_cubit.dart';
import '../widgets/add_custody_transaction_button.dart';
import '../refactor/custody_transaction_body.dart';

class CustodyTransactions extends StatelessWidget {
  const CustodyTransactions({super.key, required this.model});

  final CustodyModel model;

  @override
  Widget build(BuildContext context) {
    
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
        actions:
            model.status! == CustodyStatus.settled
                ? null
                : [AddCustodyTransactionbutton(id: model.id!)],
      ),
      body: SingleChildScrollView(child: CustodyTransactionsBody()),
    );
  }
}
