import 'package:dartz/dartz.dart';
import 'package:teamly/core/services/supabase/backend_points.dart';

import '../../../../../core/error/custom_errors.dart';
import '../../../../../core/services/supabase/data_base_services.dart';
import '../model/user_add_custody_item_model.dart';

class UserAddCustodyItemRepo {
  DataService service;
  UserAddCustodyItemRepo(this.service);

  Future<Either<CustomError, UserAddCustodyItemModel>> addUserCustodyItem({
    required UserAddCustodyItemModel model,
  }) async {
    return await service.addData(
      table: BackendPoint.custodyTransactionItem,
      data: model.toJson(),
      fromJson: UserAddCustodyItemModel.fromJson,
    );
  }
}
