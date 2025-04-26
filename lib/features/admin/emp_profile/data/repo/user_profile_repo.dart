import 'package:dartz/dartz.dart';

import '../../../../../core/error/custom_errors.dart';
import '../../../../../core/services/shared_pref/pref_keys.dart';
import '../../../../../core/services/shared_pref/shared_pref.dart';

class UserProfileRepo {
  Future<Either<CustomError, Map<String, dynamic>>> getUserProfile() async {
    try {
      var emp = await SharedPref.getUserFromPreferences(key: PrefKeys.emp);
      if (emp == null) {
        return Left(CustomError("User not found"));
      } else {
        return Right(emp);
      }
    } catch (e) {
      return Left(CustomError("Failed to retrieve user data: ${e.toString()}"));
    }
  }
}
