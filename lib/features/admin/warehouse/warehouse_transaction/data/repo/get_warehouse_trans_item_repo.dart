import 'package:dartz/dartz.dart';

import '../../../../../../core/error/custom_errors.dart';
import '../../../../../../core/services/graph_ql/graph_ql.dart';
import '../../../../../../core/services/supabase/backend_points.dart';
import '../model/warehouse_transaction_model.dart';

class GetWarehouseTransItemRepo {
  final GraphQLService service;
  GetWarehouseTransItemRepo(this.service);

  Future<Either<CustomError, List<WarehouseTransactionModel>>> getTransItems({
    required String warehouse,
  }) async {
    try {
      var result = await service.fetchCollection<WarehouseTransactionModel>(
        collection: BackendPoint.warehouseTransaction,
        fromJson: WarehouseTransactionModel.fromJson,
        fields: const [
          'emp{name}',
          'emp{position{position}}',
          'created_at',
          'quantity',
          'warehouse{name sku price category unit_type}',
        ],
        filters: {
          "warehouse": {"eq": warehouse},
        },
      );
      return Right(result);
    } catch (e) {
      return Left(CustomError(e.toString()));
    }
  }
}
