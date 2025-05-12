import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/entities/gender_model.dart';
import '../../../data/model/new_emp_positions_model.dart';
import '../../../data/repo/get_new_emp_position.dart';

part 'new_emp_position_state.dart';

class NewEmpPositionCubit extends Cubit<NewEmpPositionState> {
  GetNewEmpPosition repo;
  NewEmpPositionCubit(this.repo) : super(NewEmpPositionInitial());

  Future<void> getNewEmpPosition({required String compId}) async {
    emit(NewEmpPositionLoading());
    var result = await repo.getNewEmpPosition(compId: compId);
    result.fold(
      (l) {
        if (!isClosed) {
          debugPrint(l.message);
          emit(NewEmpPositionError(l.message));
        }
      },
      (r) {
        if (!isClosed) {
          emit(NewEmpPositionLoaded(r));
        }
      },
    );
  }
}
