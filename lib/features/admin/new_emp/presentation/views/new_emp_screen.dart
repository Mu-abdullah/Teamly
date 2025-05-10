import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/widgets/custom_app_bar.dart';
import '../cubits/new_emp_cubit/new_emp_cubit.dart';
import '../refactor/new_emp_screen_body.dart';

class NewEmpScreen extends StatelessWidget {
  const NewEmpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewEmpCubit(),
      child: Scaffold(
        appBar: CustomAppBar(title: LangKeys.newEmp),
        body: NewEmpScreenBody(),
      ),
    );
  }
}
