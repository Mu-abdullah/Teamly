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
    var uid = context.read<AppUserCubit>().userId;
    final empHomeLac = locator<UserHomeCardInfoRepo>();
    final attendanceLac = locator<AttendanceRepo>();
    final checkLac = locator<CheckAttendanceRepo>();
    final hostoryLac = locator<GetHistoryRepo>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  GetUserDataCubit(empHomeLac, isAdmin: isAdmin)..getUserData(),
        ),
        BlocProvider(create: (context) => AttendanceCubit(attendanceLac)),
        BlocProvider(
          create:
              (context) => AttendanceHistoryCubit(hostoryLac)..getHistory(uid),
        ),
        BlocProvider(
          create:
              (context) => CheckAttendanceCubit(checkLac)..checkAttendance(uid),
        ),
      ],
      child: Scaffold(
        appBar: CustomAppBar(
          title: LangKeys.home,
          isBack: isAdmin,
          actions: isAdmin ? [] : [HomeLogoutButton()],
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
