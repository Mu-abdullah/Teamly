import 'package:dartz/dartz.dart';
import 'package:teamly/core/services/shared_pref/pref_keys.dart';
import 'package:teamly/core/services/shared_pref/shared_pref.dart';

import '../../../../core/error/custom_errors.dart';
import '../../../../core/services/supabase/backend_points.dart'
    show BackendPoint;
import '../../../../core/services/supabase/data_base_services.dart';
import '../models/emp_model.dart';
import '../models/user_model.dart';

class CheckRoleRepo {
  DataService service;
  CheckRoleRepo(this.service);

  Future<Either<CustomError, UserModel>> checkRole(String email) async {
    return await service.getData(
      table: BackendPoint.users,
      filterKey: "email",
      value: email,
      fromJson: UserModel.fromJson,
    );
  }

  Future<Either<CustomError, EmpModel>> getUserData(String id) async {
    return await service.getData(
      table: BackendPoint.users,
      filterKey: "id",
      value: id,
      fromJson: EmpModel.fromJson,
    );
  }

  //save user data to local storage

  Future<void> saveUserData(EmpModel user) async {
    await SharedPref.saveUserToPreferences(
      user: user.toJson(),
      key: PrefKeys.emp,
    );
  }

  Future<void> saveUserRole({required String role}) async {
    await SharedPref.saveData(key: PrefKeys.role, value: role);
  }
}
