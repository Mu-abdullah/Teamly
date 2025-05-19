import 'package:dartz/dartz.dart';

import '../../../../../core/error/custom_errors.dart';
import '../../../../../core/services/graph_ql/graph_ql.dart';
import '../../../../../core/services/supabase/backend_points.dart';
import '../model/vacation_count.dart';

class VactionCountRepo {
  GraphQLService service;

  VactionCountRepo(this.service);

  Future<Either<CustomError, List<VacationCount>>> getVactionCount({
    required String compID,
  }) async {
    try {
      var result = await service.fetchCollection(
        collection: BackendPoint.vacations,
        fields: const ['id', 'status'],
        filters: {
          'com_id': {'eq': compID},
        },
        fromJson: VacationCount.fromJson,
      );
      if (result.isEmpty) {
        return Left(CustomError("No employees found."));
      }
      return Right(result);
    } catch (e) {
      return Left(
        CustomError("Failed to retrieve employee count: ${e.toString()}"),
      );
    }
  }
}
