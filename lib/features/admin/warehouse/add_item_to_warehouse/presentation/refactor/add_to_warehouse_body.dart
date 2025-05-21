import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../../core/app/user/app_user_cubit/app_user_cubit.dart';
import '../../../../../../core/functions/generate_id.dart';
import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/services/supabase/backend_points.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/widgets/app_button.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../../../../../../core/style/widgets/custom_divider.dart';
import '../../../../../../core/style/widgets/custom_snack_bar.dart';
import '../../data/model/add_warehouse_item_model.dart';
import '../cubits/add_to_warehouse_cubit/add_to_warehouse_cubit.dart';
import '../widgets/add_to_bottom_sheets_item.dart';

class AddToWarehouseBody extends StatelessWidget {
  const AddToWarehouseBody({super.key, this.onClose});
  final VoidCallback? onClose;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddToWarehouseCubit, AddToWarehouseState>(
      listener: (context, state) {
        if (state is AddToWarehouseSuccess) {
          context.pop();
          CustomSnackbar.showTopSnackBar(
            context,
            message: LangKeys.addedSuccess,
          );
          onClose?.call();
        } else if (state is AddToWarehouseError) {
          CustomSnackbar.showTopSnackBar(context, message: state.message);
        } else if (state is AddToWarehouseLoading) {
          CustomSnackbar.showTopSnackBar(context, message: LangKeys.loading);
        }
      },
      builder: (context, state) {
        var cubit = AddToWarehouseCubit.get(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                AppText(LangKeys.addItems, isTitle: true),
                CustomDivider(),
                AddItemToWarehouse(cubit: cubit),
                AppButton(
                  backGroungColor: AppColors.blueBlack,
                  isLoading: state is AddToWarehouseLoading,
                  onTap: () {
                    if (cubit.formKey.currentState!.validate()) {
                      final data = AddWarehouseItemModel(
                        id: GenerateId.generateDocumentId(
                          context: context,
                          tableName: BackendPoint.warehouse,
                          userId: context.read<AppUserCubit>().userID,
                          companyName: context.read<AppUserCubit>().compId,
                        ),
                        available: true,
                        comp: context.read<AppUserCubit>().compId,
                        createdAt: DateTime.now().toIso8601String(),
                        sku: cubit.skuController.text,
                        name: cubit.nameController.text,
                        quantity: cubit.countController.text,
                        price: cubit.priceController.text,
                        category: cubit.categoryController.text,
                        unitType: cubit.unitTypeController.text,
                      );
                      cubit.addToWarehouse(data: data);
                    }
                  },
                  text: LangKeys.addItems,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
