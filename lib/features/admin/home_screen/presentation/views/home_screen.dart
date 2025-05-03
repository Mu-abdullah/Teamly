import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teamly/core/app/user/app_user_cubit/app_user_cubit.dart';
import 'package:teamly/core/services/get_it/git_it.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/widgets/custom_app_bar.dart';
import '../../data/repo/emp_count_repo.dart';
import '../../data/repo/home_emp_repo.dart';
import '../../data/repo/vaction_count_repo.dart';
import '../cubits/emp_count_cubit/emp_count_cubit.dart';
import '../cubits/home_emp_cubit/home_emp_cubit.dart';
import '../cubits/vacation_count_cubit/vacation_count_cubit.dart';
import '../refactor/home_body.dart';
import '../widgets/drawer/home_drawer.dart';
import '../widgets/home_logout_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final compID = context.read<AppUserCubit>().compId;
    final lac = locator<EmpCountRepo>();
    final lac2 = locator<HomeEmpRepo>();
    final lacVac = locator<VactionCountRepo>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => EmpCountCubit(lac)),
        BlocProvider(create: (context) => HomeEmpCubit(lac2)),
        BlocProvider(
          create:
              (context) => VacationCountCubit(lacVac)..getVactionCount(compID),
        ),
      ],
      child: Scaffold(
        appBar: CustomAppBar(
          title: LangKeys.home,
          isBack: false,
          hasDrawer: true,
          actions: [HomeLogoutButton()],
        ),
        body: HomeBody(),
        drawer: CustomHomeDrawer(),
      ),
    );
  }
}
