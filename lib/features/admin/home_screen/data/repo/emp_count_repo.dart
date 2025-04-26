import 'package:dartz/dartz.dart';

import '../../../../../core/error/custom_errors.dart';
import '../../../../../core/services/graph_ql/graph_ql.dart';
import '../../../../../core/services/shared_pref/pref_keys.dart';
import '../../../../../core/services/shared_pref/shared_pref.dart';
import '../../../../../core/services/supabase/backend_points.dart';
import '../model/emp_count_model.dart';

class EmpCountRepo {
  GraphQLService graphQLService;
  EmpCountRepo(this.graphQLService);

  Future<Either<CustomError, List<EmpCountModel>>> getEmpCount({
    required String comId,
  }) async {
    try {
      var result = await graphQLService.fetchCollection(
        collection: BackendPoint.emp,
        fields: const ['name', 'job_status'],
        filters: {
          'com_id': {'eq': comId},
        },
        fromJson: EmpCountModel.fromJson,
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

  Future<String> getCompID() async {
    var emp = await SharedPref.getData(key: PrefKeys.companyID);
    if (emp != null) {
      return emp.toString();
    } else {
      throw Exception("No employee found in shared preferences.");
    }
  }
}
