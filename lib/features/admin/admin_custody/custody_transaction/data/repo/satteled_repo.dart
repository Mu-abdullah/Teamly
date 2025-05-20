import 'package:dartz/dartz.dart';

import '../../../../../../core/error/custom_errors.dart';
import '../../../../../../core/services/graph_ql/graph_ql.dart';
import '../../../../../../core/services/supabase/backend_points.dart';
import '../model/update_custody_status_model.dart';

class SatteledRepo {
  final GraphQLService service;

  SatteledRepo(this.service);
  Future<Either<CustomError, UpdateCustodyStatusModel>> updateCustodyStatus({
    required String status,
    required String id,
  }) async {
    try {
      var response = await service.updateCollection(
        collection: BackendPoint.custody,
        updates: {'status': status},
        filter: {
          'id': {'eq': id},
        },
        fromJson: UpdateCustodyStatusModel.fromJson,
        returningFields: const ['status'],
      );
      return Right(response.first);
    } catch (e) {
      return Left(CustomError(e.toString()));
    }
  }
}
