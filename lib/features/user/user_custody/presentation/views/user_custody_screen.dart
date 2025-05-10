import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/app/user/app_user_cubit/app_user_cubit.dart';
import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/services/get_it/git_it.dart';
import '../../../../../core/style/widgets/custom_app_bar.dart';
import '../../data/repo/get_user_custody_repo.dart';
import '../../data/repo/satteld_user_custody_repo.dart';
import '../cubits/settaled_user_custody_cubit/settaled_user_custody_cubit.dart';
import '../cubits/user_custody_cubit/user_custody_cubit.dart';
import '../refactor/user_custody_body.dart';

class UserCustodyScreen extends StatelessWidget {
  const UserCustodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var uid = context.read<AppUserCubit>().empID;
    final lac = locator<GetUserCustodyRepo>();
    final lac2 = locator<SatteldUserCustodyRepo>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserCustodyCubit(lac)..getUserCustody(uid: uid),
        ),
        BlocProvider(create: (context) => SettaledUserCustodyCubit(lac2)),
      ],
      child: Scaffold(
        appBar: CustomAppBar(title: LangKeys.custody),
        body: UserCustodyScreenBody(),
      ),
    );
  }
}
