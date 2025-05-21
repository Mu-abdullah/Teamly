import 'package:flutter/material.dart';

import '../../../data/model/get_werehouse_model.dart';
import '../../cubits/warehouse_cubit/warehouse_cubit.dart';
import '../category_filter.dart';
import 'web_warehouse_listview.dart';

class WebWarehouseWidget extends StatelessWidget {
  const WebWarehouseWidget({
    super.key,
    required this.cubit,
    required this.items,
  });
  final List<GetWarehouseModel> items;
  final WarehouseCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoryFilter(cubit: cubit),
        Expanded(child: WebWarehouseListview(items: items, cubit: cubit)),
      ],
    );
  }
}
