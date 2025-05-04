import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/app/user/app_user_cubit/app_user_cubit.dart';
import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/services/get_it/git_it.dart';
import '../../../../../core/style/widgets/custom_app_bar.dart';
import '../../data/repo/user_check_vacation_repo.dart';
import '../cubits/user_check_vacation_cubit/user_check_vacation_cubit.dart';
import '../refactor/mobile_user_vaction_body.dart';

class UserVacations extends StatelessWidget {
  const UserVacations({super.key, required this.gender});
  final String gender;
  @override
  Widget build(BuildContext context) {
    var userId = context.read<AppUserCubit>().userId;
    final lac = locator<UserCheckVacationRepo>();
    return BlocProvider(
      create:
          (context) =>
              UserCheckVacationCubit(lac)..getVacationsRequests(userId: userId),
      child: Scaffold(
        appBar: CustomAppBar(title: LangKeys.vacation),
        body: MobileUserVactionsBody(gender: gender),
      ),
    );
  }
}
