import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../features/auth/data/models/emp_model.dart';
import '../../../error/custom_errors.dart';
import '../../../services/graph_ql/graph_ql.dart';
import '../../../services/shared_pref/pref_keys.dart';
import '../../../services/shared_pref/shared_pref.dart';
import '../../../services/supabase/backend_points.dart';

class AppUserRepo {
  final GraphQLService graphQLService;

  AppUserRepo(this.graphQLService);

  Future<Either<CustomError, EmpModel>> getUserData(String id) async {
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
      await saveUserData(result.first);
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

  // get user data from shared preferences
  void logout() async {
    await SharedPref.removeData(key: PrefKeys.emp);
    await SharedPref.removeData(key: PrefKeys.userID);
    await SharedPref.removeData(key: PrefKeys.role);
    await Supabase.instance.client.auth.signOut();
  }
}
