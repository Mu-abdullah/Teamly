
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/app/user/app_user_cubit/app_user_cubit.dart';
import '../../../../../../core/functions/generate_id.dart';
import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/services/supabase/backend_points.dart';
import '../../../../../../core/style/widgets/app_button.dart';
import '../../../data/model/request_vacation_model.dart';
import '../../cubits/request_vacation_cubit/request_vacation_cubit.dart';

class SubmitRequestButton extends StatelessWidget {
  const SubmitRequestButton({super.key, required this.cubit});

  final RequestVacationCubit cubit;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onTap: () {
        if (cubit.formKey.currentState!.validate()) {
          if (cubit.type != null) {
            final model = RequestVacationModel(
              comId: context.read<AppUserCubit>().compId,
              empId: context.read<AppUserCubit>().userId,
              id: GenerateId.generateDocumentId(
                context: context,
                tableName: BackendPoint.vacations,
                companyName: context.read<AppUserCubit>().compId,
              ),
              startDate: cubit.startDate.text,
              endDate: cubit.endDate.text,
              reason: cubit.reason.text,
              createdAt: DateTime.now().toString(),
              type: cubit.type,
              userId: context.read<AppUserCubit>().userId,
            );
            cubit.submit(model);
          }
        }
      },
      text: LangKeys.submit,
    );
  }
}
