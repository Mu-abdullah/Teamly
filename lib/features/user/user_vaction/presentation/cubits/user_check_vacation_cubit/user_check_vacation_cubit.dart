import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/user_check_vacation_model.dart';
import '../../../data/repo/user_check_vacation_repo.dart';

part 'user_check_vacation_state.dart';

class UserCheckVacationCubit extends Cubit<UserCheckVacationState> {
  UserCheckVacationRepo repo;
  UserCheckVacationCubit(this.repo) : super(UserCheckVacationInitial());
  static UserCheckVacationCubit get(context) => BlocProvider.of(context);

  Future<void> getVacationsRequests({required String userId}) async {
    emit(UserCheckVacationLoading());
    var result = await repo.getUserVacationsRequests(userId: userId);
    result.fold(
      (l) {
        if (!isClosed) {
          debugPrint("Error: ${l.message}");
          emit(UserCheckVacationError(l.message));
        }
      },
      (r) {
        if (!isClosed) {
          emit(UserCheckVacationLoaded(r));
        }
      },
    );
  }
}
