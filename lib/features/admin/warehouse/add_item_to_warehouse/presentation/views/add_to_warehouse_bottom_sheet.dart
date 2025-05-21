import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/services/get_it/git_it.dart';
import '../../data/repo/add_werehouse_items_repo.dart';
import '../cubits/add_to_warehouse_cubit/add_to_warehouse_cubit.dart';
import '../refactor/add_to_warehouse_body.dart';

class AddToWarehouseBottomSheet extends StatelessWidget {
  const AddToWarehouseBottomSheet({super.key, this.onClose});
  final VoidCallback? onClose;
  @override
  Widget build(BuildContext context) {
    final lac2 = locator<AddWerehouseItemsRepo>();

    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => AddToWarehouseCubit(lac2))],
      child: AddToWarehouseBody(onClose: onClose),
    );
  }
}
