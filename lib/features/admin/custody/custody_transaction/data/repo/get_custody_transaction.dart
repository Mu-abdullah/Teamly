import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../../core/error/custom_errors.dart';
import '../../../../../../core/services/graph_ql/graph_ql.dart';
import '../../../../../../core/services/supabase/backend_points.dart';
import '../model/custody_transaction_model.dart';

class GetCustodyTransactionRepo {
  final GraphQLService service;
  GetCustodyTransactionRepo(this.service);
  Future<Either<CustomError, List<CustodyTransactionModel>>>
  getCustodyTransaction({required String custodyId}) async {
    try {
      final data = await service.fetchCollection<CustodyTransactionModel>(
        collection: BackendPoint.custodyTransaction,
        fields: [
          'id',
          'created_at',
          'custody_id',
          'users{emp{name}}',
          'amount',
          'emp{name}',
          'status',
        ],
        fromJson: CustodyTransactionModel.fromJson,
        filters: {
          'custody_id': {'eq': custodyId},
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
