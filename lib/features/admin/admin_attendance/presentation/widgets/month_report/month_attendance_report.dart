import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../../cubits/month_attendance_cubit/month_attendance_cubit.dart';
import 'report_listview.dart';
import 'report_loading.dart';

class MonthAttendanceReport extends StatelessWidget {
  const MonthAttendanceReport({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MonthAttendanceCubit, MonthAttendanceState>(
      builder: (context, state) {
        if (state is MonthAttendanceLoading) {
          return MonthReportLoading();
        } else if (state is MonthAttendanceLoaded) {
          final attendance = state.attendanceList;
          return ReportListview(attendance: attendance);
        } else if (state is MonthAttendanceError) {
          return Expanded(child: Center(child: Text(state.message)));
        } else {
          return const Expanded(
            child: Center(child: AppText(LangKeys.chooseMonth)),
          );
        }
      },
    );
  }
}
