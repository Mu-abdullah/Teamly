import 'package:dartz/dartz.dart';

import '../../../../../../core/error/custom_errors.dart';
import '../../../../../../core/services/graph_ql/graph_ql.dart';
import '../../../../../../core/services/supabase/backend_points.dart';
import '../../../warehouse/data/model/get_werehouse_model.dart';

class UpdateAvilableRepo {
  final GraphQLService service;

  UpdateAvilableRepo(this.service);

  Future<Either<CustomError, bool>> updateItem({required String id}) async {
    try {
      await service.updateCollection(
        collection: BackendPoint.warehouse,
        fromJson: GetWarehouseModel.fromJson,
        filter: {
          'id': {'eq': id},
        },
        updates: {
          'available': false,
        },
      );
      return Right(true);
    } catch (e) {
      return Left(CustomError(e.toString()));
    }
  }
}
