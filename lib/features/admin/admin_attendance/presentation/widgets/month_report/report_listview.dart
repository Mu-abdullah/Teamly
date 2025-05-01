import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/style/widgets/app_button.dart';
import '../../../data/model/month_admin_attendance.dart';
import '../../cubits/export_report_cubit/export_report_cubit.dart';
import 'report_item.dart';

class ReportListview extends StatelessWidget {
  const ReportListview({super.key, required this.attendance});

  final List<MonthAdminAttendance> attendance;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Positioned.fill(
            child: ListView.builder(
              itemCount: attendance.length,
              itemBuilder: (context, index) {
                var att = attendance[index];
                return ReportItem(att: att);
              },
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            left: 10,
            child: PrintReportButton(attendance: attendance),
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
