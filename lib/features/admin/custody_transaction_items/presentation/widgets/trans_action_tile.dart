import 'package:flutter/material.dart';
import 'package:teamly/core/style/widgets/custom_divider.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/color/app_color.dart';
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
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 5,
              children: [
                SizedBox(
                  width: 40,
                  child: AppText(item.count!, translate: false, fontSize: 11),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 10,
                        children: [
                          Expanded(
                            child: AppText(
                              item.name!,
                              translate: false,
                              maxLines: 20,
                            ),
                          ),
                          AppText(item.price!, translate: false),
                          AppText(
                            LangKeys.eg,
                            fontSize: 11,
                            color: AppColors.grey,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            CustomDivider(endIndent: 0, indent: 0),
            Row(
              spacing: 5,
              children: [
                AppText(
                  LangKeys.totalPrice,
                  fontSize: 11,
                  color: AppColors.grey,
                ),
                AppText(" : ", translate: false),
                AppText(
                  item.calculateTotal().toStringAsFixed(0),
                  translate: false,
                ),
                AppText(LangKeys.eg, fontSize: 11, color: AppColors.grey),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
