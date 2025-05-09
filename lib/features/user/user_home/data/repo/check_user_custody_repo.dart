import 'package:dartz/dartz.dart';
import 'package:teamly/core/error/custom_errors.dart';
import 'package:teamly/core/services/status/custody_status.dart';

import '../../../../../core/services/graph_ql/graph_ql.dart';
import '../../../../../core/services/supabase/backend_points.dart';
import '../model/check_user_custody_model.dart';

class ChechUserCustodyRepo {
  GraphQLService service;
  ChechUserCustodyRepo(this.service);

  Future<Either<CustomError, List<CheckUserCustodyModel>>> checkUserCustody({
    required String userId,
  }) async {
    try {
      var result = await service.fetchCollection(
        collection: BackendPoint.custodyTransaction,
        fields: const ['amount'],
        fromJson: CheckUserCustodyModel.fromJson,
        filters: {
          'emp_id': {'eq': userId},
          'status': {'eq': CustodyStatus.notSettled},
        },
      );
      return Right(result);
    } catch (e) {
      return Left(CustomError(e.toString()));
    }
  }
}
