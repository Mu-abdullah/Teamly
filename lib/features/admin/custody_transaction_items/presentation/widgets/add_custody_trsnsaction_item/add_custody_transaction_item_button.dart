import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../../core/style/widgets/custom_bottom_sheet.dart';
import '../../refactor/add_custody_transactionI_item.dart';

class AddCustodyTransactionItemButton extends StatelessWidget {
  const AddCustodyTransactionItemButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(HugeIcons.strokeRoundedAddCircle),
      onPressed: () {
        customShowBottomSheet(
          context: context,
          isScrollControlled: true,

          builder: (context) {
            return AddCustodyTransactionItem();
          },
        );
      },
    );
  }
}
