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
          final report = state.report;
          return Expanded(
            child: Column(
              children: [Expanded(child: ReportListview(report: report))],
            ),
          );
        } 
        // else if (state is MonthAttendanceSalaryCalculated) {
        //   return Expanded(
        //     child: Column(
        //       children: [
        //         Expanded(
        //           child: SalaryReportView(
        //             report: state.report,
        //             salaryReport: state.salaryReport,
        //           ),
        //         ),
        //       ],
        //     ),
        //   );
        // } 
        else if (state is MonthAttendanceError) {
          return Expanded(
            child: Center(
              child: AppText(state.message, translate: false, maxLines: 20),
            ),
          );
        } else {
          return const Expanded(
            child: Center(child: AppText(LangKeys.chooseMonth)),
          );
        }
      },
    );
  }
}
