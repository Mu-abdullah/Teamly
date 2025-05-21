import 'package:dartz/dartz.dart';

import '../../../../../../core/error/custom_errors.dart';
import '../../../../../../core/services/supabase/backend_points.dart';
import '../../../../../../core/services/supabase/data_base_services.dart';
import '../model/add_warehouse_item_model.dart';

class AddWerehouseItemsRepo {
  final DataService service;
  AddWerehouseItemsRepo(this.service);

  Future<Either<CustomError, AddWarehouseItemModel>> insertWarehouse({
    required Map<String, dynamic> data,
  }) async {
    return await service.addData(
      table: BackendPoint.warehouse,
      fromJson: AddWarehouseItemModel.fromJson,
      data: data,
    );
  }
}
