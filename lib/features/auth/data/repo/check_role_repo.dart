import 'package:dartz/dartz.dart';
import 'package:teamly/core/services/graph_ql/graph_ql.dart';

import '../../../../core/error/custom_errors.dart';
import '../../../../core/services/shared_pref/pref_keys.dart';
import '../../../../core/services/shared_pref/shared_pref.dart';
import '../../../../core/services/supabase/backend_points.dart'
    show BackendPoint;
import '../../../../core/services/supabase/data_base_services.dart';
import '../models/user_model.dart';

class CheckRoleRepo {
  DataService service;
  GraphQLService graphQLService = GraphQLService();
  CheckRoleRepo(this.service);

  Future<Either<CustomError, UserModel>> checkRole(String email) async {
    return await service.getData(
      table: BackendPoint.users,
      filterKey: "email",
      value: email,
      fromJson: UserModel.fromJson,
    );
  }

  Future<void> saveUserRole({required String role}) async {
    await SharedPref.saveData(key: PrefKeys.userID, value: role);
  }
}
