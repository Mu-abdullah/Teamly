import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

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
        await Future.wait([repo.saveUserRole(role: user.userId!)]);

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
