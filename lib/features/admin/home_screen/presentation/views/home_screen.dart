import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teamly/core/services/get_it/git_it.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/widgets/custom_app_bar.dart';
import '../../data/repo/emp_count_repo.dart';
import '../cubits/cubit/emp_count_cubit.dart';
import '../refactor/home_body.dart';
import '../widgets/drawer/home_drawer.dart';
import '../widgets/home_logout_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lac = locator<EmpCountRepo>();
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => EmpCountCubit(lac))],
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
