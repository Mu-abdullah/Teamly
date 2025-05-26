import 'package:dartz/dartz.dart';
import 'package:teamly/core/error/custom_errors.dart';
import 'package:teamly/core/services/supabase/backend_points.dart';

import '../../../../../../core/services/graph_ql/graph_ql.dart';
import '../model/all_emp_model.dart';

class GetAllEmpRepo {
  GraphQLService service;

  GetAllEmpRepo(this.service);

  Future<Either<CustomError, List<AllEmpModel>>> getAllEmps(
    String status,
  ) async {
    try {
      var result = await service.fetchCollection(
        collection: BackendPoint.emp,
        fields: [
          'id',
          'name',
          'position { position }',
          'image',
          'phone',
          'job_status',
          'end_in',
          'end_job_reason',
        ],
        fromJson: AllEmpModel.fromJson,
        filters: {
          'job_status': {'eq': status},
        },
      );
      return Right(result);
    } catch (e) {
      return Left(CustomError(e.toString()));
    }
  }
}
