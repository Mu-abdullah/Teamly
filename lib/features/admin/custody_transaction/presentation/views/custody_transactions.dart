import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/services/get_it/git_it.dart';
import '../../../../../core/style/widgets/app_button.dart';
import '../../../../../core/style/widgets/custom_app_bar.dart';
import '../../../../../core/style/widgets/custom_bottom_sheet.dart';
import '../../data/repo/get_custody_transaction.dart';
import '../cubits/get_custody_transaction_cubit/get_custody_transaction_cubit.dart';
import '../refactor/add_custody_transaction_bottom_sheet.dart';
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
      appBar: CustomAppBar(title: LangKeys.custodyDetails),
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
      child: BlocBuilder<GetCustodyTransactionCubit, GetCustodyTransactionState>(
        builder: (context, state) {
          final cubit = context.read<GetCustodyTransactionCubit>();
          return AppButton(
            text: LangKeys.addCustody,
            onTap: () => _showAddCustodyBottomSheet(context, cubit),
          );
        },
      ),
    );
  }

  void _showAddCustodyBottomSheet(
    BuildContext context,
    GetCustodyTransactionCubit cubit,
  ) {
    customShowBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => AddCustodyTranactionBottomSheet(
        id: id,
        rimingAmount: cubit.calculateRemainingAmount().toString(),
        onTransactionAdded: () => cubit.fetchCustodyTransaction(id),
      ),
    );
  }
}
