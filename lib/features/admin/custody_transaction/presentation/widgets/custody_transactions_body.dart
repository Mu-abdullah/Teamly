import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../data/model/custody_transaction_model.dart';
import '../cubits/get_custody_transaction_cubit/get_custody_transaction_cubit.dart';
import 'calc_custody.dart';
import 'custody_transactions_listview.dart';

class CustodyTransactionBody extends StatelessWidget {
  const CustodyTransactionBody({
    super.key,
    required this.custodyTransaction,
    required this.cubit,
  });
  final List<CustodyTransactionModel> custodyTransaction;
  final GetCustodyTransactionCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalcCustody(cubit: cubit, custodyTransaction: custodyTransaction),
        CustodyTransactionsListview(custodyTransaction: custodyTransaction),
      ].animate(interval: 200.ms).fadeIn(duration: 400.ms).slideY(begin: 0.2),
    );
  }
}
