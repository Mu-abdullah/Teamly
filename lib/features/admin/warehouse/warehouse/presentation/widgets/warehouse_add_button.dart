import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../../core/app/user/app_user_cubit/app_user_cubit.dart';
import '../../../../../../core/style/widgets/custom_bottom_sheet.dart';
import '../../../add_item_to_warehouse/presentation/views/add_to_warehouse_bottom_sheet.dart';
import '../cubits/warehouse_cubit/warehouse_cubit.dart';

class WarehouseAddButton extends StatelessWidget {
  const WarehouseAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<WarehouseCubit>();
    return IconButton(
      icon: const Icon(HugeIcons.strokeRoundedAddCircle),
      onPressed: () {
        customShowBottomSheet(
          context: context,

          builder: (context) {
            return AddToWarehouseBottomSheet(
              onClose:
                  () => cubit.getWerehouseItems(
                    compId: context.read<AppUserCubit>().compId,
                  ),
            );
          },
        );
      },
    );
  }
}
