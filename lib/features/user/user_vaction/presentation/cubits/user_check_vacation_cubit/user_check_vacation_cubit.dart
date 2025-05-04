import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teamly/core/services/status/vactions_typs.dart';

import '../../../data/model/user_check_vacation_model.dart';
import '../../../data/repo/user_check_vacation_repo.dart';

part 'user_check_vacation_state.dart';

class UserCheckVacationCubit extends Cubit<UserCheckVacationState> {
  UserCheckVacationRepo repo;
  String? gender;
  UserCheckVacationCubit(this.repo,{this.gender}) : super(UserCheckVacationInitial());
  static UserCheckVacationCubit get(context) => BlocProvider.of(context);
  List<UserCheckVacationModel>? requests;
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
          requests = r;
          emit(UserCheckVacationLoaded(r));
        }
      },
    );
  }

  List<UserCheckVacationModel> getPending() {
    return requests!
        .where((employee) => employee.status == VacationStatus.pending)
        .toList();
  }

  List<UserCheckVacationModel> getAnnual() {
    return requests!
        .where((employee) => employee.type == VacationTypes.annual)
        .toList();
  }

  List<UserCheckVacationModel> getExceptional() {
    return requests!
        .where((employee) => employee.type == VacationTypes.exceptional)
        .toList();
  }

  List<UserCheckVacationModel> getSickLeave() {
    return requests!
        .where((employee) => employee.type == VacationTypes.sickLeave)
        .toList();
  }

  List<UserCheckVacationModel> getMaternity() {
    return requests!
        .where((employee) => employee.type == VacationTypes.maternity)
        .toList();
  }
}
