import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/widgets/app_text.dart';
import '../cubits/get_custody_transaction_cubit/get_custody_transaction_cubit.dart';
import '../widgets/custody_transactions_body.dart';

class MobileCustodyTransactionBody extends StatelessWidget {
  const MobileCustodyTransactionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCustodyTransactionCubit, GetCustodyTransactionState>(
      builder: (context, state) {
        if (state is GetCustodyTransactionLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetCustodyTransactionError) {
          return Center(child: Text(state.error.message));
        } else if (state is GetCustodyTransactionLoaded) {
          if (state.custodyTransaction.isEmpty) {
            return const Center(child: AppText(LangKeys.noDataFound));
          }
          return CustodyTransactionBody(
            custodyTransaction: state.custodyTransaction,
            cubit: GetCustodyTransactionCubit.get(context),
          );
        } else {
          return const Center(child: Text('No data available'));
        }
      },
    );
  }
}
