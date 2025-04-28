import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/functions/timestamp_to_time.dart';
import '../../../data/model/check_attendance_model.dart';
import '../../../data/repo/check_attendance_repo.dart';

part 'check_attendance_state.dart';

class CheckAttendanceCubit extends Cubit<CheckAttendanceState> {
  CheckAttendanceRepo repo;
  CheckAttendanceCubit(this.repo) : super(CheckAttendanceInitial());

  Future<void> checkAttendance(String uid) async {
    emit(CheckAttendanceLoading());
    var result = await repo.getAttendance(
      userId: uid,
      date: TimeRefactor.currentDateString(),
    );
    result.fold(
      (error) {
        if (!isClosed) {
          debugPrint("Error: ${error.message}");
          emit(CheckAttendanceError(error.message));
        }
      },
      (r) {
        if (!isClosed) {
          if (r.isEmpty) {
            emit(CheckAttendanceLoaded(CheckAttendanceModel()));
          } else {
            debugPrint("attendance result: ${r.first.toJson()}");
            debugPrint(
              "attendance result: ${TimeRefactor.currentDateString()}",
            );
            emit(CheckAttendanceLoaded(r.first));
          }
        }
      },
    );
  }

  static CheckAttendanceCubit get(BuildContext context) =>
      BlocProvider.of<CheckAttendanceCubit>(context);
}
