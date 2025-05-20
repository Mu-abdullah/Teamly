import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/style/widgets/app_text.dart';
import '../../../../../../core/style/widgets/loading_shimmer_widget.dart';
import '../cubits/warehouse_cubit/warehouse_cubit.dart';
import '../widgets/mobile/mobile_warehouse_widget.dart';
import '../widgets/web/web_warehouse_widget.dart';

class WarehouseScreenBody extends StatelessWidget {
  const WarehouseScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: BlocBuilder<WarehouseCubit, WarehouseState>(
        builder: (context, state) {
          final cubit = WarehouseCubit.get(context);
          if (state is WarehouseLoading) {
            return LoadingShimmer();
          } else if (state is WarehouseLoaded) {
            return LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 600) {
                  return MobileWarehouseWidget(
                    cubit: cubit,
                    items: state.items,
                  );
                } else {
                  return WebWarehouseWidget(cubit: cubit, items: state.items);
                }
              },
            );
          } else if (state is WarehouseError) {
            return Center(child: AppText(state.message));
          }
          return Container();
        },
      ),
    );
  }
}
