import 'package:dartz/dartz.dart';

import '../../../../../core/error/custom_errors.dart';
import '../../../../../core/services/graph_ql/graph_ql.dart';
import '../../../../../core/services/shared_pref/shared_pref.dart';
import '../../../../../core/services/supabase/backend_points.dart';
import '../model/user_home_model.dart';

class UserHomeCardInfoRepo {
  GraphQLService graphQLService;
  UserHomeCardInfoRepo(this.graphQLService);
  Future<Either<CustomError, List<UserHomeModel>>> getEmp({
    required String userId,
  }) async {
    try {
      var result = await graphQLService.fetchCollection(
        collection: BackendPoint.emp,
        fields: [
          'id',
          'name',
          'phone',
          'gender { gender }',
          'position { position }',
        ],
        filters: {
          'id': {'eq': userId},
        },
        fromJson: UserHomeModel.fromJson,
      );
      if (result.isEmpty) {
        return Left(CustomError("No employees found."));
      }
      return Right(result);
    } catch (e) {
      return Left(CustomError("Failed to retrieve employee : ${e.toString()}"));
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
