import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/app/user/app_user_cubit/app_user_cubit.dart';
import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/services/get_it/git_it.dart';
import '../../../../../../core/style/widgets/custom_app_bar.dart';
import '../../data/repo/user_profile_repo.dart';
import '../cubits/user_profile_cubit/user_profile_cubit.dart';
import '../refactor/emp_profile_body.dart';

class EmpProfile extends StatelessWidget {
  const EmpProfile({super.key, required this.id});
  final String? id;
  @override
  Widget build(BuildContext context) {
    final lac = locator<UserProfileRepo>();
    return BlocProvider(
      create:
          (context) =>
              UserProfileCubit(isAdmin: id == null, repo: lac)
                ..getUserProfile(id ?? context.read<AppUserCubit>().empID),
      child: Scaffold(
        appBar: CustomAppBar(title: LangKeys.profile),
        body: EmpProfileBody(),
      ),
    );
  }
}
