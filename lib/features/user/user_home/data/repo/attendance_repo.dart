import 'package:dartz/dartz.dart';

import '../../../../../core/error/custom_errors.dart';
import '../../../../../core/services/graph_ql/graph_ql.dart';
import '../../../../../core/services/supabase/backend_points.dart';
import '../../../../../core/services/supabase/data_base_services.dart';
import '../model/attendance_model.dart';

class AttendanceRepo {
  DataService service;
  final GraphQLService graphQLService = GraphQLService();
  AttendanceRepo(this.service);

  Future<Either<CustomError, AttendanceModel>> checkIn({
    required AttendanceModel model,
  }) async {
    return await service.addData(
      table: BackendPoint.attendance,
      fromJson: AttendanceModel.fromJson,
      data: model.toJson(),
    );
  }

  Future<Either<CustomError, AttendanceModel>> checkOut({
    required String checkOut,
    required String userId,
    required String date,
  }) async {
    try {
      var response = await graphQLService.updateCollection(
        collection: BackendPoint.attendance,
        updates: {'check_out': checkOut},
        filter: {
          'user_id': {'eq': userId},
          'date': {'eq': date},
        },
        fromJson: AttendanceModel.fromJson,
        returningFields: const ['check_in', 'check_out'],
      );
      return Right(response.first);
    } catch (e) {
      return Left(CustomError(e.toString()));
    }
  }
}
