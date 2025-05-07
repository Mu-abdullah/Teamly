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
    final totalQuantity = cubit.sumCount(items).toStringAsFixed(0);
    final totalPrice = cubit.sumPrice(items).toString();
    final remaining = cubit.calculateRemainingAmount().toString();

    return Padding(
      padding: const EdgeInsets.all(8),
      child: DecoratedContainer(
        child: Column(
          spacing: 8,
          children: [
            _buildRow([
              _buildLabelValue(LangKeys.totalQuantity, totalQuantity),
              const Spacer(),
              _buildLabelValue(LangKeys.totalPrice, totalPrice),
              AppText(LangKeys.eg),
            ]),
            _buildRow([
              _buildLabelValue(LangKeys.rimaining, remaining),
              AppText(LangKeys.eg),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(List<Widget> children) {
    return Row(spacing: 8, children: children);
  }

  Widget _buildLabelValue(String label, String value) {
    return Row(
      spacing: 4,
      children: [
        AppText(label, fontSize: 11),
        AppText(translate: false, ":", fontSize: 11),
        AppText(value, translate: false, fontSize: 11),
      ],
    );
  }
}
