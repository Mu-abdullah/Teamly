import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entities/custody_entity.dart';
import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/services/get_it/git_it.dart';
import '../../../../../core/style/widgets/custom_app_bar.dart';
import '../../data/repo/get_custody_transaction.dart';
import '../cubits/get_custody_transaction_cubit/get_custody_transaction_cubit.dart';
import '../refactor/custody_transaction_body.dart';

class CustodyTransactions extends StatelessWidget {
  const CustodyTransactions({super.key, required this.custody});
  final CustodyEntity custody;
  @override
  Widget build(BuildContext context) {
    var lac = locator<GetCustodyTransactionRepo>();
    return BlocProvider(
      create:
          (context) =>
              GetCustodyTransactionCubit(repo: lac, custody: custody)
                ..fetchCustodyTransaction(int.parse(custody.id!)),
      child: Scaffold(
        appBar: CustomAppBar(title: LangKeys.custodyDetails),
        body: CustodyTransactionsBody(custody: custody),
      ),
    );
  }
}
