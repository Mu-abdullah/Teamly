import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/app/user/app_user_cubit/app_user_cubit.dart';
import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/services/get_it/git_it.dart';
import '../../../../../../core/style/widgets/custom_app_bar.dart';
import '../../data/repo/admin_attendance_repo.dart';
import '../../data/repo/get_month_repo.dart';
import '../cubits/export_report_cubit/export_report_cubit.dart';
import '../cubits/get_month_cubit/get_month_cubit.dart';
import '../cubits/month_attendance_cubit/month_attendance_cubit.dart';
import '../refactor/admin_attendance_body.dart';

class AdminAttendance extends StatelessWidget {
  const AdminAttendance({super.key});

  @override
  Widget build(BuildContext context) {
    var com = context.read<AppUserCubit>().compId;
    final lac = locator<GetMonthRepo>();
    final monthLac = locator<AdminAttendanceRepository>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetMonthCubit(lac)..getMonth(compId: com),
        ),
        BlocProvider(create: (context) => MonthAttendanceCubit(monthLac)),
        BlocProvider(create: (context) => ExportReportCubit()),
      ],
      child: Scaffold(
        appBar: CustomAppBar(title: LangKeys.attendanceLeaving),
        body: AdminAttendanceBody(com: com),
      ),
    );
  }
}
