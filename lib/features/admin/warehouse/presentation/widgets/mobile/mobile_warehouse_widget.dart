import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../../core/style/widgets/app_space.dart';
import '../../../data/model/werehouse_model.dart';
import '../../cubits/warehouse_cubit/warehouse_cubit.dart';
import '../category_filter.dart';
import 'mobile_item.dart';

class MobileWarehouseWidget extends StatelessWidget {
  const MobileWarehouseWidget({
    super.key,
    required this.cubit,
    required this.items,
  });
  final List<WarehouseModel> items;
  final WarehouseCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (c, i) {
              var item = items[i];
              return MobileItem(
                item: item,
               
              ).animate().fadeIn(duration: 1000.ms, delay: (1 * i).ms);
            },
          ),
        ),
        CategoryFilter(cubit: cubit),
        AppSpace(),
      ],
    );
  }
}
