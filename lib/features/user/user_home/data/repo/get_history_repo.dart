import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/error/custom_errors.dart';
import '../../../../../core/services/graph_ql/graph_ql.dart';
import '../../../../../core/services/supabase/backend_points.dart';
import '../model/history_attendance_model.dart';

class GetHistoryRepo {
  final GraphQLService service;
  GetHistoryRepo(this.service);

  Future<Either<CustomError, List<HistoryAttendanceModel>>> getHistory({
    required String userId,
  }) async {
    try {
      final data = await service.fetchCollection<HistoryAttendanceModel>(
        collection: BackendPoint.attendance,
        fields: const ['date', 'check_in', 'check_out'],
        fromJson: HistoryAttendanceModel.fromJson,
        filters: {
          'user_id': {'eq': userId},
        },
        limit: 30,
      );

      return right(data);
    } on DioException catch (e) {
      return left(CustomError(e.toString()));
    } catch (e) {
      return left(CustomError(e.toString()));
    }
  }
}
