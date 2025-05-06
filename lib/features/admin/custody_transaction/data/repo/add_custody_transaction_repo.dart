import 'package:dartz/dartz.dart';

import '../../../../../core/error/custom_errors.dart';
import '../../../../../core/services/supabase/backend_points.dart';
import '../../../../../core/services/supabase/data_base_services.dart';
import '../model/custody_transaction_model.dart';

class AddCustodyTransactionRepo {
  DataService service;
  AddCustodyTransactionRepo(this.service);

  Future<Either<CustomError, CustodyTransactionModel>> addCustodyTransaction({
    required Map<String, dynamic> data,
  }) async {
    return await service.addData(
      table: BackendPoint.custodyTransaction,
      fromJson: CustodyTransactionModel.fromJson,
      data: data,
    );
  }
}
