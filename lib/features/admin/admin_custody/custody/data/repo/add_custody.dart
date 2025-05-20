import 'package:dartz/dartz.dart';

import '../../../../../../core/error/custom_errors.dart';
import '../../../../../../core/services/supabase/backend_points.dart';
import '../../../../../../core/services/supabase/data_base_services.dart';
import '../model/custody_model.dart';

class AddCustodyRepo {
  final DataService service;
  AddCustodyRepo(this.service);

  Future<Either<CustomError, CustodyModel>> insertCustody({
    required Map<String, dynamic> data,
  }) async {
    var res = await service.addData(
      table: BackendPoint.custody,
      fromJson: CustodyModel.fromJson,
      data: data,
    );

    return res.fold((l) => Left(l), (r) => Right(r));
  }
}
