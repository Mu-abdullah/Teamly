import 'package:dartz/dartz.dart';

import '../../../../../core/error/custom_errors.dart';
import '../../../../../core/services/supabase/backend_points.dart';
import '../../../../../core/services/supabase/data_base_services.dart';
import '../model/new_request_vacation_model.dart';

class SubmitVacationRequestRepo {
  DataService service;

  SubmitVacationRequestRepo(this.service);

  Future<Either<CustomError, NewRequestVacationModel>> submitVacationRequest({
    required NewRequestVacationModel model,
  }) async {
    return await service.addData(
      table: BackendPoint.vacations,
      fromJson: NewRequestVacationModel.fromJson,
      data: model.toJson(),
    );
  }
}
