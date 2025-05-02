import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/widgets/app_space.dart';
import '../../../../../../core/style/widgets/custom_snack_bar.dart';
import '../../cubits/request_vacation_cubit/request_vacation_cubit.dart';
import 'choose_vacation_type_drop_menu.dart';
import 'submit_button.dart';
import 'user_request_vacation_form.dart';

class UserNewRequestVacationBody extends StatelessWidget {
  const UserNewRequestVacationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RequestVacationCubit, RequestVacationState>(
      listener: (context, state) {
        if (state is RequestVacationSuccess) {
          context.pop();
          CustomSnackbar.showTopSnackBar(
            context,
            message: LangKeys.addedSuccess,
          );
        } else if (state is RequestVacationError) {
          CustomSnackbar.showTopSnackBar(
            context,
            message: state.message,
            translate: false,
            backgroundColor: AppColors.red,
          );
        } else if (state is RequestVacationLoading) {
          CustomSnackbar.showTopSnackBar(context, message: LangKeys.loading);
        }
      },
      builder: (context, state) {
        var cubit = RequestVacationCubit.get(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            spacing: 10,
            children: [
              ChooseVacationTypeDrpoMenu(cubit: cubit),
              VacationRequestForm(cubit: cubit),
              SubmitRequestButton(cubit: cubit),
              AppSpace(),
            ],
          ),
        );
      },
    );
  }
}
