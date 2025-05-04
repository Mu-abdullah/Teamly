import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/app/user/app_user_cubit/app_user_cubit.dart';
import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/services/get_it/git_it.dart';
import '../../../../../core/style/widgets/custom_app_bar.dart';
import '../../../../admin/home_screen/presentation/widgets/home_logout_button.dart';
import '../../data/repo/attendance_repo.dart';
import '../../data/repo/check_attendance_repo.dart';
import '../../data/repo/get_history_repo.dart';
import '../../data/repo/user_home_card_info_repo.dart';
import '../cubits/attendance_cubit/attendance_cubit.dart';
import '../cubits/attendance_history_cubit/attendance_history_cubit.dart';
import '../cubits/check_attendance_cubit/check_attendance_cubit.dart';
import '../cubits/get_user_data_cubit/get_user_data_cubit.dart';
import '../refactor/user_home_body.dart';

class UserHome extends StatelessWidget {
  const UserHome({super.key, this.isAdmin = false});
  final bool isAdmin;

  @override
  Widget build(BuildContext context) {
    final uid = context.read<AppUserCubit>().userId;

    return MultiBlocProvider(
      providers: _createBlocProviders(uid),
      child: Scaffold(
        appBar: CustomAppBar(
          title: LangKeys.home,
          isBack: isAdmin,
          actions: isAdmin ? null : const [HomeLogoutButton()],
        ),
        body: const UserHomeBody(),
      ),
    );
  }

  List<BlocProvider> _createBlocProviders(String uid) => [
    BlocProvider<GetUserDataCubit>(
      create:
          (context) => GetUserDataCubit(
            locator<UserHomeCardInfoRepo>(),
            isAdmin: isAdmin,
          )..getUserData(),
    ),
    BlocProvider<AttendanceCubit>(
      create: (context) => AttendanceCubit(locator<AttendanceRepo>()),
    ),
    BlocProvider<AttendanceHistoryCubit>(
      create:
          (context) =>
              AttendanceHistoryCubit(locator<GetHistoryRepo>())
                ..getHistory(uid),
    ),
    BlocProvider<CheckAttendanceCubit>(
      create:
          (context) =>
              CheckAttendanceCubit(locator<CheckAttendanceRepo>())
                ..checkAttendance(uid),
    ),
  ];
}
