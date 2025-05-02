import 'package:dartz/dartz.dart';

import '../../../../../core/error/custom_errors.dart';
import '../../../../../core/services/supabase/backend_points.dart';
import '../../../../../core/services/supabase/data_base_services.dart';
import '../model/request_vacation_model.dart';

class SubmitVacationRequestRepo {
  DataService service;

  SubmitVacationRequestRepo(this.service);

  Future<Either<CustomError, RequestVacationModel>> submitVacationRequest({
    required RequestVacationModel model,
  }) async {
    return await service.addData(
      table: BackendPoint.vacations,
      fromJson: RequestVacationModel.fromJson,
      data: model.toJson(),
    );
  }
}
