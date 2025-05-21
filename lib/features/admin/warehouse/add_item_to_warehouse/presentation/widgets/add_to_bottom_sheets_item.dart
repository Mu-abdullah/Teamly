import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../../../../../../core/style/widgets/app_text_form_felid.dart';
import '../cubits/add_to_warehouse_cubit/add_to_warehouse_cubit.dart';

class AddItemToWarehouse extends StatelessWidget {
  const AddItemToWarehouse({super.key, required this.cubit});
  final AddToWarehouseCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Form(
        key: cubit.formKey,
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            AppText(LangKeys.itemIdentification),

            AppTextFormField(
              controller: cubit.skuController,
              validate: (v) {
                if (v!.isEmpty) {
                  return context.translate(LangKeys.requiredValue);
                }
                return null;
              },
              label: LangKeys.sku,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              type: TextInputType.number,
              onChange: (value) {},
            ),

            AppTextFormField(
              controller: cubit.nameController,
              type: TextInputType.text,
              onChange: (value) {},
              label: LangKeys.name,
              validate: (v) {
                if (v!.isEmpty) {
                  return context.translate(LangKeys.requiredValue);
                }
                return null;
              },
            ),

            AppText(LangKeys.itemCount),

            Row(
              spacing: 10,
              children: [
                Expanded(
                  child: AppTextFormField(
                    controller: cubit.countController,
                    label: LangKeys.totalQuantity,
                    type: TextInputType.number,
                    validate: (v) {
                      if (v!.isEmpty) {
                        return context.translate(LangKeys.requiredValue);
                      }
                      return null;
                    },
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChange: (value) {},
                  ),
                ),

                Expanded(
                  child: AppTextFormField(
                    controller: cubit.priceController,
                    validate: (v) {
                      if (v!.isEmpty) {
                        return context.translate(LangKeys.requiredValue);
                      }
                      return null;
                    },
                    label: LangKeys.itemPrice,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    type: TextInputType.number,
                    onChange: (value) {},
                  ),
                ),
              ],
            ),

            AppText(LangKeys.additionalDetails),

            Row(
              spacing: 8,
              children: [
                Expanded(
                  child: AppTextFormField(
                    controller: cubit.categoryController,
                    validate: (v) {
                      if (v!.isEmpty) {
                        return context.translate(LangKeys.requiredValue);
                      }
                      return null;
                    },
                    label: LangKeys.category,

                    type: TextInputType.text,
                    onChange: (value) {},
                  ),
                ),

                Expanded(
                  child: AppTextFormField(
                    controller: cubit.unitTypeController,
                    validate: (v) {
                      if (v!.isEmpty) {
                        return context.translate(LangKeys.requiredValue);
                      }
                      return null;
                    },
                    label: LangKeys.unitType,

                    type: TextInputType.text,
                    onChange: (value) {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
