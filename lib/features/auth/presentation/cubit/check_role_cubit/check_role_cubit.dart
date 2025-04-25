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
    result.fold((l) => emit(CheckRoleError(l.message)), (r) {
      if (!isClosed) {
        emit(CheckRoleLoaded(r));
        saveUserRole(role: r.role!);
        getUserData(r.id!);
      }
    });
  }

  void getUserData(String id) async {
    emit(UserDataLoading());
    final result = await repo.getUserData(id);
    result.fold(
      (l) {
        if (!isClosed) {
          emit(UserDataError(l.message));
        }
      },
      (r) {
        if (!isClosed) {
          emit(UserDataLoaded(r));
          saveUserData(r);
        }
      },
    );
  }

  void saveUserData(EmpModel user) async {
    await repo.saveUserData(user);
  }

  void saveUserRole({required String role}) async {
    await repo.saveUserRole(role: role);
  }
}
