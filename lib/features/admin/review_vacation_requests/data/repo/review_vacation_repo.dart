import 'package:dartz/dartz.dart';
import 'package:teamly/core/services/status/vactions_typs.dart';

import '../../../../../core/error/custom_errors.dart';
import '../../../../../core/services/graph_ql/graph_ql.dart';
import '../../../../../core/services/supabase/backend_points.dart';
import '../model/review_vacation_model.dart';

class ReviewVacationRepo {
  GraphQLService service;

  ReviewVacationRepo(this.service);

  Future<Either<CustomError, List<ReviewVacationModel>>> reviewVacationRequest(
    String compID,
  ) async {
    try {
      var result = await service.fetchCollection(
        collection: BackendPoint.vacations,
        fields: [
          'id',
          'emp{name}',
          'created_at',
          'users{emp{name}}',
          'reason',
          'start_date',
          'end_date',
          'type',
        ],
        filters: {
          'com_id': {'eq': compID},
          'status': {'eq': VacationStatus.pending},
        },
        fromJson: ReviewVacationModel.fromJson,
      );

      return Right(result);
    } catch (e) {
      return Left(CustomError(e.toString()));
    }
  }
}
