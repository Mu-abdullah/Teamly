import 'package:dartz/dartz.dart';

import '../../../../../core/error/custom_errors.dart';
import '../../../../../core/services/graph_ql/graph_ql.dart';
import '../../../../../core/services/supabase/backend_points.dart';
import '../model/user_check_vacation_model.dart';

class UserCheckVacationRepo {
  GraphQLService service;

  UserCheckVacationRepo(this.service);

  Future<Either<CustomError, List<UserCheckVacationModel>>>
  getUserVacationsRequests({required String userId}) async {
    try {
      var result = await service.fetchCollection(
        collection: BackendPoint.vacations,
        fromJson: UserCheckVacationModel.fromJson,
        fields: const ['id'],
        filters: {
          'status': {'eq': 'pending'},
          'user_id': {'eq': userId},
        },
      );

      return Right(result);
    } catch (e) {
      return Left(CustomError(e.toString()));
    }
  }
}
