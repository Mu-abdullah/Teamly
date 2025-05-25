import 'package:dartz/dartz.dart';
import 'package:teamly/core/services/supabase/backend_points.dart';

import '../../../../../../core/error/custom_errors.dart';
import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/services/graph_ql/graph_ql.dart';
import '../model/get_werehouse_model.dart';

class GetWerehouseItemsRepo {
  final GraphQLService service;

  GetWerehouseItemsRepo(this.service);

  Future<Either<CustomError, List<GetWarehouseModel>>> getWerehouseItems({
    required String compId,
  }) async {
    try {
      final res = await service.fetchCollection(
        collection: BackendPoint.warehouse,
        fields: [
          'id',
          'created_at',
          'sku',
          'category',
          'unit_type',
          'name',
          'price',
          'quantity',
          'available',
        ],
        fromJson: (GetWarehouseModel.fromJson),
        filters: {
          'comp': {'eq': compId},
        },
      );

      if (res.isEmpty) {
        return left(CustomError(LangKeys.noDataFound));
      }

      return right(res);
    } catch (e) {
      return left(CustomError(e.toString()));
    }
  }
}
