import 'package:dartz/dartz.dart';

import '../../../../../core/error/custom_errors.dart';
import '../../../../../core/services/graph_ql/graph_ql.dart';
import '../../../../../core/services/supabase/backend_points.dart';
import '../../../../auth/data/models/emp_model.dart';

class EmpInfoRepo {
  final GraphQLService service;

  EmpInfoRepo(this.service);

  Future<Either<CustomError, List<EmpModel>>> getEmpInfo({
    required String uid,
  }) async {
    try {
      var result = await service.fetchCollection<EmpModel>(
        collection: BackendPoint.emp,
        fromJson: EmpModel.fromJson,
        fields: const [
          'id',
          'name',
          'nid',
          'address',
          'phone',
          'salary',
          'start_in',
          'job_status',
          'gender { gender }',
          'position { position }, com_id',
        ],
        filters: {
          'id': {'eq': uid},
        },
      );
      return Right(result);
    } catch (e) {
      return Left(CustomError(e.toString()));
    }
  }
}
