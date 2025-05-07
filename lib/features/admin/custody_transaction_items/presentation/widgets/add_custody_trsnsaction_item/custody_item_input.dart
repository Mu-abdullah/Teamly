import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../../../../../../core/style/widgets/app_text_form_felid.dart';
import '../../../data/model/create_custody_trans_item_model.dart';
import '../../cubits/text_field_cubit.dart';

class CustodyItemInput extends StatelessWidget {
  final int index;
  final CreateCustodyTransItemModel item;
  final TextEditingController nameController;
  final TextEditingController countController;
  final TextEditingController priceController;
  final FocusNode nameFocusNode;
  final FocusNode countFocusNode;
  final FocusNode priceFocusNode;
  final Function(String, int) onNameChanged;
  final Function(String, int) onCountChanged;
  final Function(String, int) onPriceChanged;

  const CustodyItemInput({
    super.key,
    required this.index,
    required this.item,
    required this.nameController,
    required this.countController,
    required this.priceController,
    required this.nameFocusNode,
    required this.countFocusNode,
    required this.priceFocusNode,
    required this.onNameChanged,
    required this.onCountChanged,
    required this.onPriceChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: AppText(
                    '${context.translate(LangKeys.item)} ${index + 1}',
                    translate: false,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    HugeIcons.strokeRoundedDelete02,
                    color: AppColors.red,
                  ),
                  onPressed: () {
                    context.read<CustodyItemsCubit>().removeItem(
                      context,
                      index,
                    );
                  },
                ),
              ],
            ),
            AppTextFormField(
              controller: nameController,
              type: TextInputType.text,
              validate:
                  (value) =>
                      value!.isEmpty
                          ? context.translate(LangKeys.requiredValue)
                          : null,
              label: LangKeys.name,
              maxLines: 3,
              onChange: (value) => onNameChanged(value, index),
            ),

            Row(
              spacing: 10,
              children: [
                Expanded(
                  child: AppTextFormField(
                    controller: countController,
                    type: TextInputType.number,
                    validate:
                        (value) =>
                            value!.isEmpty
                                ? context.translate(LangKeys.requiredValue)
                                : null,
                    label: LangKeys.itemCount,
                    onChange: (value) => onCountChanged(value, index),
                  ),
                ),

                Expanded(
                  child: AppTextFormField(
                    controller: priceController,
                    type: const TextInputType.numberWithOptions(decimal: true),
                    validate:
                        (value) =>
                            value!.isEmpty
                                ? context.translate(LangKeys.requiredValue)
                                : null,
                    label: LangKeys.itemPrice,
                    onChange: (value) => onPriceChanged(value, index),
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
