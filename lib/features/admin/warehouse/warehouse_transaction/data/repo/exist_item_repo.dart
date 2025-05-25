import 'package:dartz/dartz.dart';

import '../../../../../../core/error/custom_errors.dart';
import '../../../../../../core/services/supabase/backend_points.dart';
import '../../../../../../core/services/supabase/data_base_services.dart';
import '../model/exist_item_model.dart';

class ExistItemRepo {
  final DataService service;
  ExistItemRepo(this.service);

  Future<Either<CustomError, ExistItemModel>> exsistItem({
    required Map<String, dynamic> data,
  }) async {
    return await service.addData(
      table: BackendPoint.warehouseTransaction,
      fromJson: ExistItemModel.fromJson,
      data: data,
    );
  }
}
