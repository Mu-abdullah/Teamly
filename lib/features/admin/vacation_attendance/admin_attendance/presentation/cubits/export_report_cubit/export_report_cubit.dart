import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/month_admin_attendance.dart';
import '../../../data/repo/export_report_repo.dart';

part 'export_report_state.dart';

class ExportReportCubit extends Cubit<ExportReportState> {
  ExportReportRepo exportReportRepo = ExportReportRepo();
  ExportReportCubit() : super(ExportReportInitial());
  static ExportReportCubit get(context) => BlocProvider.of(context);

  void exportReport({
    required List<MonthAdminAttendance> employees,
    required String excelName,
  }) async {
    emit(ExportReportLoading());
    try {
      await exportReportRepo.exportEmployees(
        employees: employees,
        excelName: excelName,
      );
      emit(ExportReportSuccess());
    } catch (e) {
      emit(ExportReportError(e.toString()));
    }
  }
}
