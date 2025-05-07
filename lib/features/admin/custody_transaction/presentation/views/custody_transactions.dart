import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/services/get_it/git_it.dart';
import '../../../../../core/style/color/app_color.dart';
import '../../../../../core/style/widgets/app_button.dart';
import '../../../../../core/style/widgets/custom_app_bar.dart';
import '../../data/repo/get_custody_transaction.dart';
import '../cubits/get_custody_transaction_cubit/get_custody_transaction_cubit.dart';
import '../widgets/add_custody_transaction_button.dart';
import '../refactor/custody_transaction_body.dart';

class CustodyTransactions extends StatelessWidget {
  const CustodyTransactions({
    super.key,
    required this.id,
    required this.custodyAmount,
  });

  final String id;
  final String custodyAmount;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _createCubit(context),
      child: _CustodyTransactionsView(id: id),
    );
  }

  GetCustodyTransactionCubit _createCubit(BuildContext context) {
    final repo = locator<GetCustodyTransactionRepo>();
    return GetCustodyTransactionCubit(
      repo: repo,
      custody: id,
      totlaCustody: custodyAmount,
    )..fetchCustodyTransaction(id);
  }
}

class _CustodyTransactionsView extends StatelessWidget {
  const _CustodyTransactionsView({required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LangKeys.custodyDetails,
        actions: [AddCustodyTransactionbutton(id: id)],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(child: CustodyTransactionsBody()),
          ),
          _buildBottomButton(context),
        ],
      ),
    );
  }

  Widget _buildBottomButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: AppButton(
        onTap: () {},
        text: LangKeys.settled,
        backGroungColor: AppColors.green,
      ),
    );
  }
}
