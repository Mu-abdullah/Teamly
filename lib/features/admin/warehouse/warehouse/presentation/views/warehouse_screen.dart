import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/app/user/app_user_cubit/app_user_cubit.dart';
import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/services/get_it/git_it.dart';
import '../../../../../../core/style/widgets/custom_app_bar.dart';
import '../../data/repo/get_werehouse_items_repo.dart';
import '../cubits/warehouse_cubit/warehouse_cubit.dart';
import '../refactor/warehouse_body.dart';
import '../widgets/app_bar_buttons.dart';

class WarehouseScreen extends StatelessWidget {
  const WarehouseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final compID = context.read<AppUserCubit>().compId;
    final lac = locator<GetWerehouseItemsRepo>();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  WarehouseCubit(lac)..getWerehouseItems(compId: compID),
        ),
      ],
      child: Scaffold(
        appBar: CustomAppBar(
          title: LangKeys.warehouse,
          actions: [RefreshButton(), WarehouseAddButton()],
        ),
        body: WarehouseScreenBody(),
      ),
    );
  }
}
