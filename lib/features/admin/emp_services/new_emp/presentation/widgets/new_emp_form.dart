import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../../core/functions/select_data.dart';
import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/font/fonts_helper.dart';
import '../../../../../../core/style/statics/image_test.dart';
import '../cubits/new_emp_form_cubit/new_emp_form_cubit.dart';
import 'new_emp_input_row.dart';

class NewEmpForm extends StatelessWidget {
  const NewEmpForm({super.key, required this.cubit});

  final NewEmpFormCubit cubit;

  @override
  Widget build(BuildContext context) {
    var isArabic = FontsHelper.isArabic(context);
    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.black, width: 2),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withValues(alpha: 0.1),
                  blurRadius: 12,
                  spreadRadius: 2,
                  offset: const Offset(0, 4),
                ),
              ],
              image: kIsWeb ? _pcIamge() : _mobileIamge(),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  right: isArabic ? null : 0,
                  left: isArabic ? 0 : null,
                  child: InkWell(
                    onTap: () {
                      cubit.whichPaltform();
                    },
                    child: CircleAvatar(
                      backgroundColor: AppColors.blueAccent,
                      child: Icon(
                        HugeIcons.strokeRoundedImageAdd02,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          NewEmpInputRow(
            controller: cubit.name,
            icon: HugeIcons.strokeRoundedUser,
            lable: LangKeys.name,
            validate: (v) {
              if (v!.isEmpty) {
                return context.translate(LangKeys.requiredValue);
              }
              return null;
            },
          ),
          NewEmpInputRow(
            controller: cubit.address,
            icon: HugeIcons.strokeRoundedLocation01,
            lable: LangKeys.address,
            validate: (v) {
              if (v!.isEmpty) {
                return context.translate(LangKeys.requiredValue);
              }
              return null;
            },
          ),
          NewEmpInputRow(
            controller: cubit.nid,
            icon: HugeIcons.strokeRoundedCardiogram01,
            lable: LangKeys.nid,
            type: TextInputType.number,
            validate: (v) {
              if (v!.isEmpty) {
                return context.translate(LangKeys.requiredValue);
              }
              return null;
            },
            maxLength: 14,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          NewEmpInputRow(
            controller: cubit.phone,
            icon: HugeIcons.strokeRoundedSmartPhone01,
            lable: LangKeys.phone,
            type: TextInputType.phone,
            validate: (v) {
              if (v!.isEmpty) {
                return context.translate(LangKeys.requiredValue);
              }
              return null;
            },
            maxLength: 11,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          NewEmpInputRow(
            controller: cubit.startIn,
            icon: HugeIcons.strokeRoundedCalendar01,
            lable: LangKeys.startIn,
            validate: (v) {
              if (v!.isEmpty) {
                return context.translate(LangKeys.requiredValue);
              }
              return null;
            },
            onTap: () {
              selectData(
                context: context,
                controller: cubit.startIn,
                content: LangKeys.startIn,
              );
            },
          ),
          NewEmpInputRow(
            controller: cubit.salary,
            icon: HugeIcons.strokeRoundedDollarCircle,
            lable: LangKeys.salary,
            type: TextInputType.number,
            validate: (v) {
              if (v!.isEmpty) {
                return context.translate(LangKeys.requiredValue);
              }
              return null;
            },
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
        ],
      ),
    );
  }

  DecorationImage _pcIamge() {
    return DecorationImage(
      image:
          cubit.pickedBytes == null
              ? const AssetImage(AppImages.logo)
              : MemoryImage(cubit.pickedBytes!),
      fit: BoxFit.contain,
    );
  }

  DecorationImage _mobileIamge() {
    return DecorationImage(
      image:
          cubit.image == null
              ? const AssetImage(AppImages.logo)
              : FileImage(cubit.image!),
      fit: BoxFit.contain,
    );
  }
}
