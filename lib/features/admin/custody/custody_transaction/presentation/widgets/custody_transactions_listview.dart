import 'package:flutter/material.dart';

import '../../data/model/custody_transaction_model.dart';
import 'custody_transactions_item.dart';

class CustodyTransactionsListview extends StatelessWidget {
  const CustodyTransactionsListview({
    super.key,
    required this.custodyTransaction,
  });

  final List<CustodyTransactionModel> custodyTransaction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: custodyTransaction.length,
        itemBuilder: (context, index) {
          final transaction = custodyTransaction[index];
          return CustodyTransactionItem(transaction: transaction);
        },
      ),
    );
  }
}
