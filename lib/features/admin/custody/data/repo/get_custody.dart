import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:teamly/core/services/supabase/backend_points.dart';

import '../../../../../core/error/custom_errors.dart';
import '../../../../../core/services/graph_ql/graph_ql.dart';
import '../model/custody_model.dart';

class GetCustody {
  final GraphQLService service;

  GetCustody(this.service);

  Future<Either<CustomError, List<CustodyModel>>> getCustody() async {
    try {
      final data = await service.fetchCollection<CustodyModel>(
        collection: BackendPoint.custody,
        fields: const [
          'created_at',
          'company_id',
          'total_amount',
          'name',
          'status',
        ],
        fromJson: CustodyModel.fromJson,
        filters: {'company_id': 1},
        limit: 10,
      );

      return right(data);
    } on DioException catch (e) {
      return left(CustomError(e.toString()));
    } catch (e) {
      return left(CustomError(e.toString()));
    }
  }
}
