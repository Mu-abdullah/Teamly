import 'package:dartz/dartz.dart';

import '../../../../../../core/error/custom_errors.dart';
import '../../../../../../core/services/graph_ql/graph_ql.dart';
import '../../../../../../core/services/supabase/backend_points.dart';
import '../model/vacation_response_model.dart';

class ResponseVacationRepo {
  GraphQLService service;
  ResponseVacationRepo(this.service);

  Future<Either<CustomError, List<VacationResponseModel>>>
  responseVacationRequest({
    required String id,
    String? rejectReason,
    required String status,
  }) async {
    try {
      var result = await service.updateCollection(
        collection: BackendPoint.vacations,
        filter: {
          'id': {'eq': id},
        },
        updates: {
          'status': status,
          'reject_reason': rejectReason,
          'updated_at': DateTime.now().toString(),
        },
        fromJson: VacationResponseModel.fromJson,
        returningFields: ['id'],
      );

      return Right(result);
    } catch (e) {
      return Left(CustomError(e.toString()));
    }
  }
}
