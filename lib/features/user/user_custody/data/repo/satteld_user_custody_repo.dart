import 'package:dartz/dartz.dart';

import '../../../../../core/error/custom_errors.dart';
import '../../../../../core/services/graph_ql/graph_ql.dart';
import '../../../../../core/services/supabase/backend_points.dart';
import '../model/satteld_user_custody_model.dart';

class SatteldUserCustodyRepo {
  final GraphQLService service;

  SatteldUserCustodyRepo(this.service);
   Future<Either<CustomError, SatteldUserCustodyModel>> updateCustodyStatus({
    required String status,
    required String id,
  }) async {
    try {
      var response = await service.updateCollection(
        collection: BackendPoint.custodyTransaction,
        updates: {'status': status},
        filter: {
          'id': {'eq': id},
        },
        fromJson: SatteldUserCustodyModel.fromJson,
        returningFields: const ['status'],
      );
      return Right(response.first);
    } catch (e) {
      return Left(CustomError(e.toString()));
    }
  }
}
