import 'package:flutter/material.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/widgets/app_text.dart';
import '../../data/model/get_custody_trans_item_model.dart';
import 'decoration_container.dart';

class TransactionItemTile extends StatelessWidget {
  final GetCustodyTransItemModel item;

  const TransactionItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedContainer(
        child: Column(
          children: [
            Row(
              spacing: 5,
              children: [
                Expanded(
                  flex: 1,
                  child: AppText(item.count!, translate: false, fontSize: 11),
                ),
                Expanded(
                  flex: 4,
                  child: AppText(item.name!, translate: false, maxLines: 4),
                ),
                AppText(item.price!, translate: false),
                AppText(LangKeys.eg),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
