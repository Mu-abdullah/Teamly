import 'package:dartz/dartz.dart';
import 'package:teamly/core/services/status/vactions_typs.dart';

import '../../../../../../core/error/custom_errors.dart';
import '../../../../../../core/services/graph_ql/graph_ql.dart';
import '../../../../../../core/services/supabase/backend_points.dart';
import '../model/month_admin_attendance.dart';
import '../model/vacation_monthly_records_model.dart';

class AdminAttendanceRepository {
  final GraphQLService service;

  AdminAttendanceRepository(this.service);

  Future<Either<CustomError, MonthlyReport>> getAttendanceAndVacationByMonth({
    required String compId,
    required String month,
  }) async {
    try {
      // Calculate start and end dates for the month
      final yearMonth = month.split('-');
      final year = int.parse(yearMonth[0]);
      final monthNum = int.parse(yearMonth[1]);
      final startDate =
          DateTime(year, monthNum, 1).toIso8601String().split('T')[0];
      final endDate =
          DateTime(year, monthNum + 1, 0, 23, 59, 59, 999).toIso8601String();

      // Fetch attendance data with employee names
      final attendanceResult = await service
          .fetchCollection<MonthAdminAttendance>(
            collection: BackendPoint.attendance,
            fields: const [
              'id',
              'check_in',
              'check_out',
              'user_id',
              'comp_id',
              'date',
              'emp { id name position { position } salary }',
            ],
            fromJson: MonthAdminAttendance.fromJson,
            filters: {
              'comp_id': {'eq': compId},
              'date': {'gte': startDate, 'lte': endDate},
            },
          );

      // Fetch vacation data with employee names
      final vacationResult = await service
          .fetchCollection<VacationMonthlyRecordsModel>(
            collection: BackendPoint.vacations,
            fields: const [
              'id',
              'users{emp{name}}',
              'start_date',
              'end_date',
              'status',
              'reason',
              'emp { id name }',
            ],
            fromJson: VacationMonthlyRecordsModel.fromJson,
            filters: {
              'com_id': {'eq': compId},
              'start_date': {'lte': endDate},
              'end_date': {'gte': startDate},
              'status': {'eq': VacationStatus.approved},
            },
          );

      if (attendanceResult.isEmpty && vacationResult.isEmpty) {
        return Left(
          CustomError(
            'No attendance or vacation records found for company $compId in $month',
            type: ErrorType.noData,
          ),
        );
      }

      return Right(
        MonthlyReport(
          attendanceRecords: attendanceResult,
          vacationRecords: vacationResult,
        ),
      );
    } catch (e) {
      return Left(CustomError('Failed to fetch monthly report: $e'));
    }
  }
}

class MonthlyReport {
  final List<MonthAdminAttendance> attendanceRecords;
  final List<VacationMonthlyRecordsModel> vacationRecords;

  MonthlyReport({
    required this.attendanceRecords,
    required this.vacationRecords,
  });
}
