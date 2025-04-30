import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:teamly/core/error/custom_errors.dart';
import 'package:teamly/core/services/shared_pref/shared_pref.dart';

import '../../../../core/services/shared_pref/pref_keys.dart';
import '../../../../core/services/supabase/auth_service/auth_services.dart';

class AuthRepo {
  AuthServices authServices;
  AuthRepo(this.authServices);

  Future<Either<CustomError, AuthResponse>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await authServices.signIn(
        email: email,
        password: password,
      );
      return Right(response);
    } on CustomError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(CustomError(e.toString()));
    }
  }

  Future<void> remmeberMe() async {
    await SharedPref.saveData(key: PrefKeys.remember, value: true);
  }
}
