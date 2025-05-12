import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/widgets/app_button.dart';
import '../cubits/new_emp_cubit/new_emp_cubit.dart';
import '../widgets/new_emp_form.dart';
import '../widgets/new_emp_gender.dart';
import '../widgets/new_emp_papers_images/new_emp_papers_images.dart';
import '../widgets/new_emp_position.dart';

class NewEmpScreenBody extends StatelessWidget {
  const NewEmpScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<NewEmpCubit, NewEmpState>(
        builder: (context, state) {
          var cubit = NewEmpCubit.get(context);
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
                AppButton(onTap: () {}, text: LangKeys.save),
              ],
            ),
          );
        },
      ),
    );
  }
}

