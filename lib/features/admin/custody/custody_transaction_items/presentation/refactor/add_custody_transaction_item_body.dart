import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../../../../../../core/style/widgets/custom_divider.dart';
import '../widgets/add_custody_trsnsaction_item/dynamic_text_form_feild.dart';
import '../widgets/add_custody_trsnsaction_item/submit_transaction_item.dart';

class AddCustodyTransactionItemBody extends StatelessWidget {
  const AddCustodyTransactionItemBody({
    super.key,
    this.onTransactionAdded,
    required this.remainingAmount,
  });
  final VoidCallback? onTransactionAdded;
  final String remainingAmount;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10,
        bottom: MediaQuery.of(context).viewInsets.bottom + 10,
        left: 10,
        right: 10,
      ),
      child: Column(
        children: [
          Row(
            spacing: 5,
            children: [
              IconButton(
                icon: const Icon(HugeIcons.strokeRoundedCancelSquare),
                onPressed: () {
                  context.pop();
                },
              ),
              Expanded(child: AppText(LangKeys.addItems)),
              AppText(remainingAmount, translate: false),
              AppText(LangKeys.eg),
            ],
          ),
          CustomDivider(),
          Expanded(child: DynamicTextFormFeild()),
          Row(
            spacing: 10,
            children: [
              SubmitNewTransactionItem(onTransactionAdded: onTransactionAdded),
            ],
          ),
        ],
      ),
    );
  }
}
