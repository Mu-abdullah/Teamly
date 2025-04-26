import 'package:dartz/dartz.dart';

import '../../../../../core/error/custom_errors.dart';
import '../../../../../core/services/graph_ql/graph_ql.dart';
import '../../../../../core/services/shared_pref/pref_keys.dart';
import '../../../../../core/services/shared_pref/shared_pref.dart';
import '../../../../../core/services/supabase/backend_points.dart';
import '../../../../auth/data/models/emp_model.dart';

class UserProfileRepo {
  final GraphQLService graphQLService;
  UserProfileRepo(this.graphQLService);
  Future<Either<CustomError, EmpModel>> getUserData({
    required String id,
    bool? isAdmin,
  }) async {
    try {
      var result = await graphQLService.fetchCollection(
        collection: BackendPoint.emp,
        fields: const [
          'id',
          'name',
          'nid',
          'address',
          'phone',
          'salary',
          'start_in',
          'job_status',
          'com_id',
          'position',
        ],
        fromJson: EmpModel.fromJson,
        filters: {
          'id': {'eq': id},
        },
      );
      if (isAdmin == true) {
        await saveUserData(result.first);
      }
      return Right(result.first);
    } catch (e) {
      return Left(CustomError("Failed to retrieve user data: ${e.toString()}"));
    }
  }

  // save user data to shared preferences

  Future<void> saveUserData(EmpModel emp) async {
    await SharedPref.saveUserToPreferences(
      key: PrefKeys.emp,
      user: emp.toJson(),
    );
  }
}
