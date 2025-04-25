import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/services/get_it/git_it.dart';
import '../../../../../core/services/status/custody_status.dart';
import '../../../../../core/style/widgets/app_button.dart';
import '../../../../../core/style/widgets/app_text.dart';
import '../../../../../core/style/widgets/app_text_form_felid.dart';
import '../../../../../core/style/widgets/custom_snack_bar.dart';
import '../../data/model/custody_model.dart';
import '../../data/repo/add_custody.dart';
import '../cubits/add_custody_cubit/add_custody_cubit.dart';

class AddCustodyBottomSheet extends StatelessWidget {
  const AddCustodyBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final lac = locator<AddCustodyRepo>();
    return BlocProvider(
      create: (context) => AddCustodyCubit(lac),
      child: BlocConsumer<AddCustodyCubit, AddCustodyState>(
        listener: (context, state) {
          if (state is AddCustodySuccessState) {
            Navigator.pop(context);
            CustomSnackbar.showTopSnackBar(
              context,
              message: LangKeys.addedSuccess,
            );
          } else if (state is AddCustodyErrorState) {
            CustomSnackbar.showTopSnackBar(
              context,
              message: state.error,
              translate: false,
            );
          }
        },
        builder: (context, state) {
          var c = AddCustodyCubit.get(context);
          return Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom + 16,
            ),
            child: Form(
              key: c.formKey,
              onChanged: () {
                c.formKey.currentState!.validate();
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
                    controller: c.nameController,
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
                    controller: c.amountController,
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
                    isLoading: state is AddCustodyLoadingState,
                    onTap: () {
                      if (c.formKey.currentState!.validate()) {
                        /// [DONT FORGET TO MAKE ID GERNERATE]

                        final data = CustodyModel(
                          id: "50",
                          createdAt: DateTime.now().toString(),
                          name: c.nameController.text,
                          totalAmount: c.amountController.text,
                          approvedBy: "11",
                          status: CustodyStatus.notSettled,
                          companyId: "1",
                          note: "null",
                        );
                        c.insertCustody(data: data, context: context);
                      }
                    },
                    text: LangKeys.addCustody,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
