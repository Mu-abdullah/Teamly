import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../data/model/month_admin_attendance.dart';
import '../../../data/repo/admin_attendance_repo.dart';

part 'month_attendance_state.dart';

class MonthAttendanceCubit extends Cubit<MonthAttendanceState> {
  AdminAttendanceRepository repo;
  MonthAttendanceCubit(this.repo) : super(MonthAttendanceInitial());

  Future<void> getMonthAttendance({
    required String compId,
    required String month,
  }) async {
    emit(MonthAttendanceLoading());
    var result = await repo.getAttendanceByMonth(compId: compId, month: month);
    result.fold(
      (l) {
        if (!isClosed) {
          debugPrint("Error: ${l.message}");
          emit(MonthAttendanceError(l.message));
        }
      },
      (r) {
        if (!isClosed) {
          r.sort((a, b) => a.emp!.name!.compareTo(b.emp!.name!));
          emit(MonthAttendanceLoaded(r));
        }
      },
    );
  }
}
