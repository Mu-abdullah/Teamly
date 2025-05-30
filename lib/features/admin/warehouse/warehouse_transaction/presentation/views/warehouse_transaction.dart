import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/services/get_it/git_it.dart';
import '../../../../../../core/style/widgets/custom_app_bar.dart';
import '../../../warehouse/data/model/get_werehouse_model.dart';
import '../../data/repo/get_warehouse_trans_item_repo.dart';
import '../cubits/warehouse_transaction_cubit/warehouse_transaction_cubit.dart';
import '../refactor/warehouse_transaction_body.dart';

class WarehouseTransaction extends StatelessWidget {
  const WarehouseTransaction({super.key, required this.model});
  final GetWarehouseModel model;
  @override
  Widget build(BuildContext context) {
    final lac = locator<GetWarehouseTransItemRepo>();
       
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  WarehouseTransactionCubit(model: model, repo: lac)
                    ..getTransItems(warehouse: model.id!),
        ),
   
      ],
      child: Scaffold(
        appBar: CustomAppBar(title: model.name!, translate: false),
        body: WarehouseTransactionBody(),
      ),
    );
  }
}
