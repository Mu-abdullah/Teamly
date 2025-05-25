import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../../../../../../core/style/widgets/custom_drop_menu.dart';
import '../../../../custody/custody_transaction/presentation/widgets/add_custody/emp_shimmer.dart';
import '../../data/model/warehouse_categoties_model.dart';
import '../cubits/add_to_warehouse_cubit/add_to_warehouse_cubit.dart';
import '../cubits/get_w_categories_cubit/get_w_categories_cubit.dart';

class ChooseCategoryUnitType extends StatelessWidget {
  const ChooseCategoryUnitType({super.key, required this.cubit});

  final AddToWarehouseCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWCategoriesCubit, GetWCategoriesState>(
      builder: (context, state) {
        if (state is GetWCategoriesLoading) {
          return EmpShimmer(height: 60);
        } else if (state is GetWCategoriesLoaded) {
          return GenericDropdown<WarehouseCategotiesModel>(
            items: state.categories,
            getDisplayText: (WarehouseCategotiesModel item) => item.category!,
            onChanged: (WarehouseCategotiesModel? value) {
              if (value != null) {
                cubit.categoryController.text = value.category!;
                cubit.unitTypeController.text = value.unitType!;
              }
            },

            hint: LangKeys.category,
          );
        } else if (state is GetWCategoriesEmpty) {
          return AppText(LangKeys.noDataFound, color: Colors.red);
        } else if (state is GetWCategoriesError) {
          return AppText(state.error, color: Colors.red);
        }
        return AppText(LangKeys.loading);
      },
    );
  }
}
