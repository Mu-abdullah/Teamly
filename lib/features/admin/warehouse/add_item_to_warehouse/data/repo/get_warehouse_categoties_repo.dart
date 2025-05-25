import 'package:dartz/dartz.dart';

import '../../../../../../core/error/custom_errors.dart';
import '../../../../../../core/services/graph_ql/graph_ql.dart';
import '../../../../../../core/services/supabase/backend_points.dart';
import '../model/warehouse_categoties_model.dart';

class GetWarehouseCategotiesRepo {
  final GraphQLService service;
  GetWarehouseCategotiesRepo(this.service);

  Future<Either<CustomError, List<WarehouseCategotiesModel>>>
  getWarehouseCategories(comp) async {
    try {
      final response = await service.fetchCollection<WarehouseCategotiesModel>(
        collection: BackendPoint.warehouse,
        fields: ['category','unit_type'],
        fromJson: WarehouseCategotiesModel.fromJson,
        filters: {
          'comp': {'eq': comp},
        },
      );

      return Right(response);
    } catch (e) {
      return Left(
        CustomError(
          'Failed to fetch warehouse categories',
          details: e.toString(),
        ),
      );
    }
  }
}
