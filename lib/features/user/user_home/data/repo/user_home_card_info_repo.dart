import 'package:dartz/dartz.dart';

import '../../../../../core/error/custom_errors.dart';
import '../../../../../core/services/graph_ql/graph_ql.dart';
import '../../../../../core/services/shared_pref/shared_pref.dart';
import '../../../../../core/services/status/job_status.dart';
import '../../../../../core/services/supabase/backend_points.dart';
import '../../../../admin/home_screen/data/model/home_emp_model.dart';

class UserHomeCardInfoRepo {
  GraphQLService graphQLService;
  UserHomeCardInfoRepo(this.graphQLService);
  Future<Either<CustomError, List<HomeEmpModel>>> getEmp({
    required String comId,
    required String userId,
  }) async {
    try {
      var result = await graphQLService.fetchCollection(
        collection: BackendPoint.emp,
        fields: const ['id', 'name', 'position', 'phone'],
        filters: {
          'com_id': {'eq': comId},
          'job_status': {'eq': JobStatus.onWork},
          'id': {'eq': userId},
        },
        fromJson: HomeEmpModel.fromJson,
      );
      if (result.isEmpty) {
        return Left(CustomError("No employees found."));
      }
      return Right(result);
    } catch (e) {
      return Left(
        CustomError("Failed to retrieve employee count: ${e.toString()}"),
      );
    }
  }

  Future<String> getID({required String key}) async {
    var emp = await SharedPref.getData(key: key);
    if (emp != null) {
      return emp.toString();
    } else {
      throw Exception("No employee found in shared preferences.");
    }
  }
}
