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
/*************  ✨ Windsurf Command ⭐  *************/
  /// Gets the attendance of the given user id in the current date
  /// and emits a [CheckAttendanceLoaded] if the attendance is found
  /// or [CheckAttendanceLoaded] with an empty [CheckAttendanceModel]
  /// if not, or [CheckAttendanceError] if an error occurs.
  ///
  /// The [CheckAttendanceLoaded] state contains the attendance model
  /// if the attendance is found, or an empty [CheckAttendanceModel]
  /// if not.
/*******  f0d1b8e0-2f1e-4c9a-be40-f974e88b0b99  *******/    var result = await repo.getAttendance(
      userId: uid,
      date: TimeRefactor.yyyymmdd(DateTime.now()),
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
              "attendance result: ${TimeRefactor.yyyymmdd(DateTime.now())}",
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
