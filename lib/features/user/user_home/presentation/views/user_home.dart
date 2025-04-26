import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/app/user/app_user_cubit/app_user_cubit.dart';
import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/services/get_it/git_it.dart';
import '../../../../../core/style/widgets/custom_app_bar.dart';
import '../../../../admin/home_screen/data/repo/home_emp_repo.dart';
import '../../../../admin/home_screen/presentation/widgets/home_logout_button.dart';
import '../cubits/get_user_data_cubit/get_user_data_cubit.dart';
import '../refactor/user_home_body.dart';

class UserHome extends StatelessWidget {
  const UserHome({super.key});

  @override
  Widget build(BuildContext context) {
    final lac = locator<HomeEmpRepo>();
    return BlocProvider(
      create: (context) => GetUserDataCubit(lac)..getUserData(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: LangKeys.home,
          isBack: false,
          actions: [HomeLogoutButton()],
        ),
        body: BlocBuilder<AppUserCubit, AppUserState>(
          builder: (context, state) {
            return UserHomeBody();
          },
        ),
      ),
    );
  }
}
