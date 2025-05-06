import 'package:flutter/material.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/widgets/app_text.dart';
import '../../data/model/get_custody_trans_item_model.dart';
import '../cubits/get_custody_trans_items_cubit/get_custody_trans_items_cubit.dart';
import 'decoration_container.dart';

class TotalCountItems extends StatelessWidget {
  const TotalCountItems({super.key, required this.cubit, required this.items});

  final GetCustodyTransItemsCubit cubit;
  final List<GetCustodyTransItemModel> items;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: DecoratedContainer(
        child: Row(
          spacing: 5,
          children: [
            AppText(LangKeys.totalQuantity, fontSize: 11),
            AppText(translate: false, ":", fontSize: 11),
            AppText(
              translate: false,
              fontSize: 11,
              cubit.sumCount(items).toStringAsFixed(0),
            ),
            Spacer(),
            AppText(LangKeys.totalPrice, fontSize: 11),
            AppText(translate: false, ":", fontSize: 11),
            AppText(translate: false, cubit.sumPrice(items).toString()),
            AppText(LangKeys.eg),
          ],
        ),
      ),
    );
  }
}
