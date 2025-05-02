import 'package:flutter/material.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../../core/functions/select_data.dart';
import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/widgets/app_text_form_felid.dart';
import '../../cubits/request_vacation_cubit/request_vacation_cubit.dart';

class VacationRequestForm extends StatelessWidget {
  const VacationRequestForm({super.key, required this.cubit});

  final RequestVacationCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Form(
          key: cubit.formKey,
          child: Column(
            spacing: 10,
            children: [
              _vacationForm(
                context,
                content: LangKeys.startDate,
                cubit: cubit.startDate,
                onTap: true,
              ),
              _vacationForm(
                context,
                content: LangKeys.endDate,
                cubit: cubit.endDate,
                onTap: true,
              ),
              _vacationForm(
                context,
                content: LangKeys.vacationReason,
                cubit: cubit.reason,
                maxLines: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _vacationForm(
    BuildContext context, {
    required TextEditingController cubit,
    bool onTap = false,
    required String content,
    int maxLines = 1,
  }) {
    return AppTextFormField(
      controller: cubit,
      type: TextInputType.text,
      validate: (state) {
        if (state == null || state.isEmpty) {
          return context.translate(LangKeys.requiredValue);
        }
        return null;
      },
      maxLines: maxLines,
      hint: content,
      label: content,
      onTap:
          onTap == true
              ? () {
                selectData(
                  context: context,
                  controller: cubit,
                  content: content,
                );
              }
              : null,
    );
  }
}
