import 'package:dartz/dartz.dart';

import '../../../../../core/error/custom_errors.dart';
import '../../../../../core/services/graph_ql/graph_ql.dart';
import '../../../../../core/services/status/job_status.dart';
import '../../../../../core/services/supabase/backend_points.dart';
import '../model/custody_emp_model.dart';
import '../model/custody_transaction_model.dart';

class AddCustodyTransactionRepo {
  GraphQLService service;
  AddCustodyTransactionRepo(this.service);

  Future<Either<CustomError, List<CustodyEmpModel>>> getEmpForCustody({
    required String compId,
  }) async {
    try {
      var result = await service.fetchCollection<CustodyEmpModel>(
        collection: BackendPoint.emp,
        fromJson: CustodyEmpModel.fromJson,
        fields: const ['id', 'name', 'position'],
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

  Future<Either<CustomError, CustodyTransactionModel>> addCustodyTransaction({
    required CustodyTransactionModel data,
  }) async {
    try {
      var result = await service.insertIntoCollection(
        collection: BackendPoint.custodyTransaction,
        fromJson: CustodyTransactionModel.fromJson,
        object: data.toJson(),
        returningFields: ['id'],
      );
      return Right(result);
    } catch (e) {
      return Left(CustomError(e.toString()));
    }
  }
}
