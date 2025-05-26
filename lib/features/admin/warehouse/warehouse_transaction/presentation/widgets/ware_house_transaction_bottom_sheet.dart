import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../../core/app/user/app_user_cubit/app_user_cubit.dart';
import '../../../../../../core/functions/generate_id.dart';
import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/services/get_it/git_it.dart';
import '../../../../../../core/services/supabase/backend_points.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/widgets/app_button.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../../../../../../core/style/widgets/app_text_form_felid.dart';
import '../../../../../../core/style/widgets/custom_snack_bar.dart';
import '../../data/model/exist_item_model.dart';
import '../../data/repo/exist_item_repo.dart';
import '../../data/repo/get_warehouse_emp_repo.dart';
import '../../data/repo/update_avilable_repo.dart';
import '../cubits/exit_quantity_cubit/exit_quantity_cubit.dart';
import '../cubits/get_emps_cubit/get_emps_cubit.dart';
import '../cubits/update_avilable_cubit/update_avilable_cubit.dart';
import 'choose_emp_to_warehouse_item.dart';

class WarehouseTransactionBottomSheet extends StatelessWidget {
  const WarehouseTransactionBottomSheet({
    super.key,
    required this.quantity,
    required this.warehouseId,
    required this.onClose,
  });

  final VoidCallback? onClose;
  final String quantity;
  final String warehouseId;

  @override
  Widget build(BuildContext context) {
    final comp = BlocProvider.of<AppUserCubit>(context).compId;
    final lac = locator<GetWarehouseEmpRepo>();
    final lac2 = locator<ExistItemRepo>();
    final lac3 = locator<UpdateAvilableRepo>();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ExitQuantityCubit(lac2)),
        BlocProvider(create: (context) => UpdateAvilableCubit(lac3)),
        BlocProvider(
          create: (context) => GetEmpsCubit(lac)..getEmp(compId: comp),
        ),
      ],
      child: BlocConsumer<ExitQuantityCubit, ExitQuantityState>(
        listener: (context, state) {
          if (state is ExitQuantityError) {
            CustomSnackbar.showTopSnackBar(
              context,
              message: state.message,
              translate: false,
              backgroundColor: AppColors.red,
            );
          } else if (state is ExitQuantityLoaded) {
            context.pop();
            CustomSnackbar.showTopSnackBar(
              context,
              message: LangKeys.addedSuccess,
            );
            onClose?.call();
          }
        },
        builder: (context, state) {
          final cubit = ExitQuantityCubit.get(context);
          return Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom + 20,
            ),
            child: Form(
              key: cubit.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                spacing: 20,
                children: [
                  AppText(LangKeys.exitQuantity, isBold: true, isTitle: true),
                  ChooseEmpToWarehouseItem(cubit: cubit),
                  AppTextFormField(
                    controller: cubit.quantity,
                    type: TextInputType.number,
                    label: LangKeys.addQuantity,
                    hint: LangKeys.addQuantity,
                    validate: (v) => validateQuantity(v, quantity, context),
                  ),
                  BlocBuilder<UpdateAvilableCubit, UpdateAvilableState>(
                    builder: (context, state) {
                      return AppButton(
                        isLoading: state is ExitQuantityLoading,
                        text: LangKeys.addItem,
                        onTap: () => handleExitQuantity(context, cubit),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String? validateQuantity(
    String? value,
    String maxQuantity,
    BuildContext context,
  ) {
    if (value == null || value.isEmpty) {
      return context.translate(LangKeys.requiredValue);
    }

    final enteredQty = int.tryParse(value);
    final maxQty = int.tryParse(maxQuantity);

    if (enteredQty == null) {
      return context.translate(LangKeys.notEnoughQuantity);
    }

    if (maxQty == null || enteredQty > maxQty) {
      return context.translate(LangKeys.notEnoughQuantity);
    }

    return null;
  }

  void handleExitQuantity(BuildContext context, ExitQuantityCubit cubit) {
    if (!cubit.formKey.currentState!.validate()) return;

    if (cubit.uid == null) {
      CustomSnackbar.showTopSnackBar(
        context,
        message: LangKeys.chooseEmployee,
        backgroundColor: AppColors.red,
      );
      return;
    }

    final data = ExistItemModel(
      id: GenerateId.generateDocumentId(
        context: context,
        tableName: BackendPoint.warehouseTransaction,
        companyName: context.read<AppUserCubit>().compId,
        userId: context.read<AppUserCubit>().empID,
      ),
      warehouse: warehouseId,
      emp: cubit.uid,
      createdAt: DateTime.now().toString(),
      quantity: cubit.quantity.text,
    );

    if (int.parse(quantity) - int.parse(cubit.quantity.text) ==  0) {
      context.read<UpdateAvilableCubit>().updateItem(warehouseId).then((v) {
        cubit.exitQuantity(data: data.toJson());
      });
    } else {
      cubit.exitQuantity(data: data.toJson());
    }
  }
}
