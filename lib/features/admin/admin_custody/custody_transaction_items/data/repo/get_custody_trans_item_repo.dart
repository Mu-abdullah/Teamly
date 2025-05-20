import 'package:dartz/dartz.dart';

import '../../../../../../core/error/custom_errors.dart';
import '../../../../../../core/services/graph_ql/graph_ql.dart';
import '../../../../../../core/services/supabase/backend_points.dart';
import '../model/get_custody_trans_item_model.dart';

class GetCustodyTransItemRepo {
  GraphQLService service;

  GetCustodyTransItemRepo(this.service);

  Future<Either<CustomError, List<GetCustodyTransItemModel>>>
  getCustodyTransItem({required String transId}) async {
    try {
      var res = await service.fetchCollection(
        collection: BackendPoint.custodyTransactionItem,
        fields: ['transaction_id', 'name', 'count', 'price'],
        filters: {
          'transaction_id': {'eq': transId},
        },
        fromJson: GetCustodyTransItemModel.fromJson,
      );
      return Right(res);
    } catch (e) {
      return Left(CustomError(e.toString()));
    }
  }
}
