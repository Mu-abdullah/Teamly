import 'package:dartz/dartz.dart';

import '../../../../../../core/error/custom_errors.dart';
import '../../../../../../core/services/graph_ql/graph_ql.dart';
import '../../../../../../core/services/supabase/backend_points.dart';
import '../model/new_emp_positions_model.dart';

class GetNewEmpPosition {
  final GraphQLService service;

  GetNewEmpPosition(this.service);

  Future<Either<CustomError, List<NewEmpPositionsModel>>> getNewEmpPosition({
    required String compId,
  }) async {
    try {
      var result = await service.fetchCollection<NewEmpPositionsModel>(
        collection: BackendPoint.position,
        fromJson: NewEmpPositionsModel.fromJson,
        fields: const ['id', 'position'],
        filters: {
          'company': {'eq': compId},
        },
      );
      return Right(result);
    } catch (e) {
      return Left(CustomError(e.toString()));
    }
  }
}
