import 'package:dartz/dartz.dart';

import '../../../../../core/error/custom_errors.dart';
import '../../../../../core/services/supabase/backend_points.dart';
import '../../../../../core/services/supabase/data_base_services.dart';
import '../model/create_custody_trans_item_model.dart';

class CreateCustodyTransItemRepo {
  DataService service;

  CreateCustodyTransItemRepo(this.service);

  Future<Either<CustomError, CreateCustodyTransItemModel>>
  createCustodyTransItem({required CreateCustodyTransItemModel model}) async {
    return await service.addData(
      table: BackendPoint.custodyTransactionItem,
      data: model.toJson(),
      fromJson: CreateCustodyTransItemModel.fromJson,
    );
  }
}
