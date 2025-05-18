import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repo/admin_attendance_repo.dart';

part 'month_attendance_state.dart';

class MonthAttendanceCubit extends Cubit<MonthAttendanceState> {
  AdminAttendanceRepository repo;
  MonthAttendanceCubit(this.repo) : super(MonthAttendanceInitial());

  Future<void> getMonthAttendance({
    required String compId,
    required String month,
  }) async {
    try {
      emit(MonthAttendanceLoading());
      final result = await repo.getAttendanceAndVacationByMonth(
        compId: compId,
        month: month,
      );
      result.fold(
        (error) {
          if (!isClosed) {
            emit(MonthAttendanceError(error.message));
          }
        },
        (report) {
          if (!isClosed) {
            emit(MonthAttendanceLoaded(report));
          }
        },
      );
    } catch (e) {
      if (!isClosed) {
        emit(MonthAttendanceError('Unexpected error: $e'));
      }
    }
  }
}
