import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/app/user/app_user_cubit/app_user_cubit.dart';
import '../../../../../../core/functions/generate_id.dart';
import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/services/status/gender_status.dart';
import '../../../../../../core/services/status/vactions_typs.dart'
    show VacationTypes;
import '../../../../../../core/services/supabase/backend_points.dart';
import '../../../../../../core/style/color/app_color.dart';
import '../../../../../../core/style/widgets/app_button.dart';
import '../../../../../../core/style/widgets/custom_snack_bar.dart';
import '../../../data/model/new_request_vacation_model.dart';
import '../../cubits/new_request_vacation_cubit/new_request_vacation_cubit.dart';

class SubmitRequestButton extends StatelessWidget {
  const SubmitRequestButton({super.key, required this.cubit});

  final NewRequestVacationCubit cubit;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onTap: () {
        if (cubit.formKey.currentState!.validate()) {
          if (cubit.type != null) {
            if (cubit.type == VacationTypes.maternity &&
                cubit.gender == GenderStatus.getGender(Gender.male)) {
              CustomSnackbar.showTopSnackBar(
                context,
                message: LangKeys.availableForFemaleOnly,
                backgroundColor: AppColors.red,
              );
            } else {
              final model = NewRequestVacationModel(
                comId: context.read<AppUserCubit>().compId,
                empId: context.read<AppUserCubit>().empID,
                id: GenerateId.generateDocumentId(
                  context: context,
                  tableName: BackendPoint.vacations,
                  companyName: context.read<AppUserCubit>().compId,
                  userId: context.read<AppUserCubit>().empID,
                ),
                startDate: cubit.startDate.text,
                endDate: cubit.endDate.text,
                reason: cubit.reason.text,
                createdAt: DateTime.now().toString(),
                type: cubit.type,
                userId: context.read<AppUserCubit>().empID,
              );
              cubit.submit(model);
            }
          }
        }
      },
      text: LangKeys.submit,
    );
  }
}
