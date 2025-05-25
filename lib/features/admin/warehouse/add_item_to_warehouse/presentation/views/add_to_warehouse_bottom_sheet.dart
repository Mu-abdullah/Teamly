import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/app/user/app_user_cubit/app_user_cubit.dart';
import '../../../../../../core/services/get_it/git_it.dart';
import '../../data/repo/add_werehouse_items_repo.dart';
import '../../data/repo/get_warehouse_categoties_repo.dart';
import '../cubits/add_to_warehouse_cubit/add_to_warehouse_cubit.dart';
import '../cubits/get_w_categories_cubit/get_w_categories_cubit.dart';
import '../refactor/add_to_warehouse_body.dart';

class AddToWarehouseBottomSheet extends StatelessWidget {
  const AddToWarehouseBottomSheet({super.key, this.onClose});
  final VoidCallback? onClose;
  @override
  Widget build(BuildContext context) {
    final comp = context.read<AppUserCubit>().compId;
    final lac = locator<AddWerehouseItemsRepo>();
    final lac2 = locator<GetWarehouseCategotiesRepo>();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AddToWarehouseCubit(lac)),
        BlocProvider(
          create:
              (context) =>
                  GetWCategoriesCubit(lac2)..getWarehouseCategories(comp),
        ),
      ],
      child: AddToWarehouseBody(onClose: onClose),
    );
  }
}
