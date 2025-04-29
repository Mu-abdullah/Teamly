// lib/features/attendance/data/attendance_repository.dart
import 'package:dartz/dartz.dart';

import '../../../../../core/error/custom_errors.dart';
import '../../../../../core/services/graph_ql/graph_ql.dart';
import '../../../../../core/services/supabase/backend_points.dart';
import '../model/month_admin_attendance.dart';

class AdminAttendanceRepository {
  final GraphQLService service;

  AdminAttendanceRepository(this.service);

  Future<Either<CustomError, List<MonthAdminAttendance>>> getAttendanceByMonth({
    required String compId,
    required String month, // e.g., "2025-04"
  }) async {
    try {
      // Calculate start and end dates for the month
      final yearMonth = month.split('-');
      final year = int.parse(yearMonth[0]);
      final monthNum = int.parse(yearMonth[1]);
      final startDate = DateTime(year, monthNum, 1).toIso8601String();
      final endDate =
          DateTime(
            year,
            monthNum + 1,
            0,
          ).toIso8601String(); // Last day of the month

      // Fetch attendance data with employee names
      final result = await service.fetchCollection<MonthAdminAttendance>(
        collection: BackendPoint.attendance,
        fields: const [
          'id',
          'check_in',
          'check_out',
          'user_id',
          'comp_id',
          'date',
          'emp { id name position }',
        ],
        fromJson: MonthAdminAttendance.fromJson,
        filters: {
          'comp_id': {'eq': compId},
          'date': {'gte': startDate, 'lte': endDate},
        },
      );

      if (result.isEmpty) {
        return Left(
          CustomError(
            'No attendance records found for company $compId in $month',
            type: ErrorType.noData,
          ),
        );
      }

      return Right(result);
    } catch (e) {
      return Left(CustomError('Failed to fetch attendance: $e'));
    }
  }
}
