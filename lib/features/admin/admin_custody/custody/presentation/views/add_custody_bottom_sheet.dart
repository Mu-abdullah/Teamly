import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teamly/core/extextions/extentions.dart';
import 'package:teamly/core/functions/generate_id.dart';

import '../../../../../../core/app/user/app_user_cubit/app_user_cubit.dart';
import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/services/status/custody_status.dart';
import '../../../../../../core/services/supabase/backend_points.dart';
import '../../../../../../core/style/widgets/app_button.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../../../../../../core/style/widgets/app_text_form_felid.dart';
import '../../data/model/custody_model.dart';
import '../cubits/get_custody_cubit/get_custody_cubit.dart';

class AddCustodyBottomSheet extends StatelessWidget {
  const AddCustodyBottomSheet({super.key, required this.cubit});
  final GetCustodyCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Form(
        key: cubit.formKey,
        onChanged: () {
          cubit.formKey.currentState!.validate();
        },
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            AppText(
              LangKeys.addCustody,
              isTitle: true,
              fontWeight: FontWeight.bold,
            ),
            AppTextFormField(
              controller: cubit.nameController,
              type: TextInputType.text,
              hint: LangKeys.custodyName,
              label: LangKeys.custodyName,
              validate: (v) {
                if (v!.isEmpty) {
                  return context.translate(LangKeys.requiredValue);
                }
                return null;
              },
            ),
            AppTextFormField(
              controller: cubit.amountController,
              type: TextInputType.number,
              hint: LangKeys.custodyAmount,
              label: LangKeys.custodyAmount,
              validate: (v) {
                if (v!.isEmpty) {
                  return context.translate(LangKeys.requiredValue);
                }
                return null;
              },
            ),

            AppButton(
              isLoading: cubit.state is AddCustodyLoading,
              onTap: () {
                if (cubit.formKey.currentState!.validate()) {
                  final data = CustodyModel(
                    id: GenerateId.generateDocumentId(
                      context: context,
                      tableName: BackendPoint.custody,
                      userId: context.read<AppUserCubit>().empID,
                      companyName: context.read<AppUserCubit>().compId,
                    ),
                    createdAt: DateTime.now().toString(),
                    name: cubit.nameController.text,
                    totalAmount: cubit.amountController.text,
                    approvedBy: context.read<AppUserCubit>().empID,
                    status: CustodyStatus.notSettled,
                    companyId: context.read<AppUserCubit>().compId,
                  );
                  cubit.insertCustody(
                    data: data,
                    context: context,
                    compId: context.read<AppUserCubit>().compId,
                  );
                }
              },
              text: LangKeys.addCustody,
            ),
          ],
        ),
      ),
    );
  }
}
