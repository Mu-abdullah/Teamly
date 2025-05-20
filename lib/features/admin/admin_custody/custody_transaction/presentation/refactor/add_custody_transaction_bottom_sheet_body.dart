
import 'package:flutter/material.dart';

import '../widgets/add_custody/choose_emp_drop_menu.dart';
import '../widgets/add_custody/custody_transaction_amount.dart';

class AddCustodyTranactionBottomSheetBody extends StatelessWidget {
  const AddCustodyTranactionBottomSheetBody({
    super.key,
    required this.id,
    required this.compId,
    required this.onTransactionAdded,
  });

  final String id;
  final String compId;
  final VoidCallback? onTransactionAdded;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        child: Column(
          spacing: 16,
          children: [
            ChooseEmpDropMenu(),
            CustodyTransactionAmount(
              id: id,
              compId: compId,
              onTransactionAdded: onTransactionAdded,
            ),
          ],
        ),
      ),
    );
  }
}
