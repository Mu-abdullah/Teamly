import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/app/user/app_user_cubit/app_user_cubit.dart';
import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/services/get_it/git_it.dart';
import '../../../../../core/style/widgets/custom_app_bar.dart';
import '../../../home_screen/data/repo/vaction_count_repo.dart';
import '../../../home_screen/presentation/cubits/vacation_count_cubit/vacation_count_cubit.dart';
import '../refactor/admin_vacation_screen_body.dart';

class AdminVacationsScreen extends StatelessWidget {
  const AdminVacationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lacVac = locator<VactionCountRepo>();
    final compID = context.read<AppUserCubit>().compId;
    return BlocProvider(
      create: (context) => VacationCountCubit(lacVac)..getVactionCount(compID),
      child: Scaffold(
        appBar: CustomAppBar(title: LangKeys.vacation),
        body: AdminVacationsScreenBody(),
      ),
    );
  }
}

