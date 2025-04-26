import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/error/custom_errors.dart';
import '../../../../../core/services/graph_ql/graph_ql.dart';
import '../../../../../core/services/supabase/backend_points.dart';
import '../model/custody_model.dart';

class GetCustodyRepo {
  final GraphQLService service;

  GetCustodyRepo(this.service);

  Future<Either<CustomError, List<CustodyModel>>> getCustody(String compId) async {
    try {
      final data = await service.fetchCollection<CustodyModel>(
        collection: BackendPoint.custody,
        fields: const [
          'id',
          'created_at',
          'company_id',
          'total_amount',
          'name',
          'status',
        ],
        fromJson: CustodyModel.fromJson,
        filters: {
          'company_id': {'eq': compId},
        },
      );

      return right(data);
    } on DioException catch (e) {
      return left(CustomError(e.toString()));
    } catch (e) {
      return left(CustomError(e.toString()));
    }
  }
}
