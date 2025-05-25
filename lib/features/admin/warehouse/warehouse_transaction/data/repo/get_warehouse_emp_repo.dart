import 'package:dartz/dartz.dart';

import '../../../../../../core/error/custom_errors.dart';
import '../../../../../../core/services/graph_ql/graph_ql.dart';
import '../../../../../../core/services/status/job_status.dart';
import '../../../../../../core/services/supabase/backend_points.dart';
import '../model/warehouse_emp_model.dart';

class GetWarehouseEmpRepo {
  GraphQLService service;
  GetWarehouseEmpRepo(this.service);

  Future<Either<CustomError, List<WarehouseEmpModel>>> getEmpForWarehouseTransaction({
    required String compId,
  }) async {
    try {
      var result = await service.fetchCollection<WarehouseEmpModel>(
        collection: BackendPoint.emp,
        fromJson: WarehouseEmpModel.fromJson,
        fields: const ['id', 'name', 'position{position}'],
        filters: {
          'job_status': {'eq': JobStatus.onWork},
          'com_id': {'eq': compId},
        },
      );
      return Right(result);
    } catch (e) {
      return Left(CustomError(e.toString()));
    }
  }
}
