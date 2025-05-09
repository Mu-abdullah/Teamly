import 'package:dartz/dartz.dart';

import '../../../../../core/error/custom_errors.dart';
import '../../../../../core/services/graph_ql/graph_ql.dart';
import '../../../../../core/services/supabase/backend_points.dart';
import '../model/user_get_custody_item_model.dart';

class UserGetCustodyItemRepo {
  GraphQLService service;
  UserGetCustodyItemRepo(this.service);

  Future<Either<CustomError, List<UserGetCustodyItemModel>>> getUserCustody({
    required String id,
  }) async {
    try {
      var response = await service.fetchCollection(
        collection: BackendPoint.custodyTransactionItem,
        fromJson: UserGetCustodyItemModel.fromJson,
        fields: const [
          'id',
          'users { emp { name } }',
          'created_at',
          'transaction_id',
          'price',
          'name',
          'count',
        ],
        filters: {
          'transaction_id': {'eq': id},
        },
      );

      return Right(response);
    } catch (e) {
      return Left(CustomError(e.toString()));
    }
  }
}
