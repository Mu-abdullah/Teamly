import 'package:dartz/dartz.dart';
import 'package:teamly/core/services/graph_ql/graph_ql.dart';

import '../../../../../core/error/custom_errors.dart';
import '../../../../../core/services/supabase/backend_points.dart';
import '../model/user_requests_vacations.dart';

class GetUserVacationsRequestsRepo {
  GraphQLService service;
  GetUserVacationsRequestsRepo(this.service);

  Future<Either<CustomError, List<UserRequestsVacations>>>
  getUserVacationsRequests({required String empid}) async {
    try {
      var result = await service.fetchCollection<UserRequestsVacations>(
        collection: BackendPoint.vacations,
        fromJson: UserRequestsVacations.fromJson,
        fields: const [
          'created_at',
          'emp_id',
          'type',
          'start_date',
          'end_date',
          'reason',
          'status',
          'updated_at',
          'reject_reason',
          'users { emp { name } }',
        ],
        filters: {
          'user_id': {'eq': empid},
        },
      );
      return Right(result);
    } catch (e) {
      return Left(CustomError(e.toString()));
    }
  }
}
