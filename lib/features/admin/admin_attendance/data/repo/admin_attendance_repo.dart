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
    required String month,
  }) async {
    try {
      // Calculate start and end dates for the month by Grok Ai
      final yearMonth = month.split('-');
      final year = int.parse(yearMonth[0]);
      final monthNum = int.parse(yearMonth[1]);
      final startDate =
          DateTime(year, monthNum, 1).toIso8601String().split('T')[0];

      ///   [الكود القديم] [final endDate = DateTime(year, monthNum + 1, 0).toIso8601String().split('T')[0]
      // here to calculate end date to show with 23:59:59
      // because the time is not included in the query result absent filters
      final endDate =
          DateTime(year, monthNum + 1, 0, 23, 59, 59, 999).toIso8601String();

      ///   [إيه اللي اتغير؟]
      //  دلوقتي بيحط الوقت لآخر اليوم (23:59:59.999) عشان يضمن إن أي سجل في آخر يوم يتشمله، حتى لو فيه ساعة زي "2025-04-30  23:59:59".
      // startDate بقى كمان بيستخدم الـ toIso8601String() كامل عشان يكون متسق مع TIMESTAMP.]

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
          'emp { id name position { position } }',
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
