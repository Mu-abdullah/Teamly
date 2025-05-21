import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../data/model/get_werehouse_model.dart';
import '../../cubits/warehouse_cubit/warehouse_cubit.dart';
import 'web_warehouse_item_row.dart';

class WebWarehouseListview extends StatelessWidget {
  const WebWarehouseListview({
    super.key,
    required this.items,
    required this.cubit,
  });
  final List<GetWarehouseModel> items;
  final WarehouseCubit cubit;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (c, i) {
        var item = items[i];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: WarehouseItemRow(
            key: ValueKey(item.id),
            item: item,
            index: i + 1,
          ).animate().fadeIn(duration: 1000.ms, delay: (1 * i).ms),
        );
      },
    );
  }
}
