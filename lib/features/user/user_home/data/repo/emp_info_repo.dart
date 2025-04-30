import 'package:dartz/dartz.dart';
import 'package:teamly/core/services/supabase/data_base_services.dart';

import '../../../../../core/error/custom_errors.dart';
import '../../../../../core/services/supabase/backend_points.dart';
import '../../../../auth/data/models/emp_model.dart';

class EmpInfoRepo {
  final DataService service;

  EmpInfoRepo(this.service);

  Future<Either<CustomError, List<EmpModel>>> getEmpInfo({
    required String uid,
  }) async {
    return await service.getListOfData(
      BackendPoint.emp,
      EmpModel.fromJson,
      filterKey: 'id',
      value: uid,
    );
  }
}
