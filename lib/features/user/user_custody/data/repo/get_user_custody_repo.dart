import 'package:dartz/dartz.dart';

import '../../../../../core/error/custom_errors.dart';
import '../../../../../core/services/graph_ql/graph_ql.dart';
import '../../../../../core/services/supabase/backend_points.dart';
import '../model/user_custody_model.dart';

class GetUserCustodyRepo {
  GraphQLService service;

  GetUserCustodyRepo(this.service);

  Future<Either<CustomError, List<UserCustodyModel>>> getUserCustody({
    required String uid,
  }) async {
    try {
      var result = await service.fetchCollection(
        collection: BackendPoint.custodyTransaction,
        fields: const [
          'id',
          'amount',
          'created_at',
          'custody_id',
          'users { emp{ name } }',
          'status',
        ],
        fromJson: UserCustodyModel.fromJson,
        filters: {
          'emp_id': {'eq': uid},
        },
      );
      return Right(result);
    } catch (e) {
      return Left(CustomError(e.toString()));
    }
  }
}
