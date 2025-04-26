import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:teamly/core/services/shared_pref/pref_keys.dart';

import '../../../data/models/emp_model.dart';
import '../../../data/models/user_model.dart';
import '../../../data/repo/check_role_repo.dart';

part 'check_role_state.dart';

class CheckRoleCubit extends Cubit<CheckRoleState> {
  final CheckRoleRepo repo;
  final String email;

  CheckRoleCubit({required this.repo, required this.email})
    : super(CheckRoleInitial());

  Future<void> checkRole() async {
    emit(CheckRoleLoading());
    final result = await repo.checkRole(email);
    result.fold((error) => emit(CheckRoleError(error.message)), (user) async {
      if (isClosed) return;
      try {
        await Future.wait([
          repo.saveUserRole(key: PrefKeys.role, value: user.userId!),
          repo.saveUserRole(key: PrefKeys.companyID, value: user.compnay!),
        ]);

        if (!isClosed) {
          emit(CheckRoleLoaded(user));
        }
      } catch (e) {
        if (!isClosed) {
          emit(CheckRoleError('Failed to save user data: $e'));
        }
      }
    });
  }
}
