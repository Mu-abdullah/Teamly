import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/widgets/app_button.dart';
import '../../../../../../core/style/widgets/app_text.dart';
import '../../../data/model/month_admin_attendance.dart';
import '../../../data/repo/admin_attendance_repo.dart';
import '../../cubits/export_report_cubit/export_report_cubit.dart';
import 'report_item.dart';

class ReportListview extends StatelessWidget {
  const ReportListview({super.key, required this.report});

  final MonthlyReport report;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Positioned.fill(
            child: ListView(
              children: [
                // Attendance Section
                if (report.attendanceRecords.isNotEmpty) ...[
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: AppText(LangKeys.attendanceLeaving, isTitle: true),
                  ),
                  ...report.attendanceRecords.map(
                    (att) => ReportItem(att: att),
                  ),
                ],
                // Vacation Section
                if (report.vacationRecords.isNotEmpty) ...[
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: AppText(LangKeys.vacation, isTitle: true),
                  ),
                  ...report.vacationRecords.map(
                    (vac) => VacationReportItem(vac: vac),
                  ),
                ],
                if (report.attendanceRecords.isEmpty &&
                    report.vacationRecords.isEmpty)
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: AppText(LangKeys.noDataFound),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PrintReportButton extends StatelessWidget {
  const PrintReportButton({super.key, required this.attendance});
  final List<MonthAdminAttendance> attendance;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExportReportCubit, ExportReportState>(
      builder: (context, state) {
        var cubit = ExportReportCubit.get(context);
        return AppButton(
          onTap: () {
            cubit.exportReport(
              employees: attendance,
              excelName: attendance.first.date!,
            );
          },
          text: LangKeys.print,
        );
      },
    );
  }
}
