import 'package:dartz/dartz.dart';

import '../../../../../core/error/custom_errors.dart';
import '../../../../../core/services/graph_ql/graph_ql.dart';
import '../../../../../core/services/supabase/backend_points.dart';
import '../model/check_attendance_model.dart';

class CheckAttendanceRepo {
  final GraphQLService graphQLService;

  CheckAttendanceRepo(this.graphQLService);

  Future<Either<CustomError, List<CheckAttendanceModel>>> getAttendance({
    required String userId,
    required String date,
  }) async {
    try {
      final result = await graphQLService.fetchCollection(
        collection: BackendPoint.attendance,
        fields: const ['check_in', 'check_out', 'user_id'],
        fromJson: CheckAttendanceModel.fromJson,
        filters: {
          'user_id': {'eq': userId},
          'date': {'eq': date},
        },
      );
      return Right(result);
    } catch (e) {
      return Left(CustomError(e.toString()));
    }
  }
}
