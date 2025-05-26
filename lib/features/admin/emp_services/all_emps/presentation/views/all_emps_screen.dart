import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/services/get_it/git_it.dart';
import '../../../../../../core/style/widgets/custom_app_bar.dart';
import '../../data/repo/get_all_emp_repo.dart';
import '../cubits/get_all_emp_cubit/get_all_emp_cubit.dart';
import '../refactor/all_emps_screen_body.dart';

class AllEmpsScreen extends StatelessWidget {
  const AllEmpsScreen({super.key, required this.status});
  final String status;
  @override
  Widget build(BuildContext context) {
    final lac = locator<GetAllEmpRepo>();
    return BlocProvider(
      create: (context) => GetAllEmpCubit(lac)..getAllEmp(status),
      child: Scaffold(
        appBar: CustomAppBar(title: LangKeys.employees),
        body: AllEmpsScreenBody(),
      ),
    );
  }
}
