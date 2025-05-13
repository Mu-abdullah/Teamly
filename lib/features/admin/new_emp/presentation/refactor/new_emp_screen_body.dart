import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/app/user/app_user_cubit/app_user_cubit.dart';
import '../cubits/new_emp_form_cubit/new_emp_form_cubit.dart';
import '../widgets/new_emp_form.dart';
import '../widgets/new_emp_gender.dart';
import '../widgets/new_emp_papers_images/new_emp_papers_images.dart';
import '../widgets/new_emp_position.dart';
import '../widgets/submited_button.dart';

class NewEmpScreenBody extends StatelessWidget {
  const NewEmpScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    var comp = context.read<AppUserCubit>().compId;
    return SingleChildScrollView(
      child: BlocBuilder<NewEmpFormCubit, NewEmpFormState>(
        builder: (context, state) {
          var cubit = NewEmpFormCubit.get(context);
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              spacing: 15,
              children: [
                NewEmpForm(cubit: cubit),
                NewEmpPosition(cubit: cubit),
                NewEmpGender(cubit: cubit),
                const Divider(),
                NewEmpPapersImages(),
                const Divider(),
                SubmitedEmp(cubitForm: cubit, companyId: comp),
              ],
            ),
          );
        },
      ),
    );
  }
}
