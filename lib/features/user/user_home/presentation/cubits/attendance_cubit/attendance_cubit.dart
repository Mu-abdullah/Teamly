import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/attendance_model.dart';
import '../../../data/repo/attendance_repo.dart';

part 'attendance_state.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  AttendanceRepo repo;

  AttendanceCubit(this.repo) : super(AttendanceInitial());

  Future<void> checkIn({required AttendanceModel model}) async {
    emit(AttendanceLoading());
    final result = await repo.checkIn(model: model);
    result.fold(
      (l) {
        if (!isClosed) {
          debugPrint("Error: ${l.message}");
          emit(AttendanceError(l.message));
        }
      },
      (r) {
        if (!isClosed) {
          emit(AttendanceLoaded(r));
        }
      },
    );
  }

  Future<void> checkOut({
    required String checkOut,
    required String userId,
    required String date,
  }) async {
    emit(AttendanceLoading());
    final result = await repo.checkOut(
      checkOut: checkOut,
      userId: userId,
      date: date,
    );
    result.fold(
      (l) {
        if (!isClosed) {
          debugPrint("Error: ${l.message}");
          emit(AttendanceError(l.message));
        }
      },
      (r) {
        if (!isClosed) {
          emit(AttendanceLoaded(r));
        }
      },
    );
  }

  static AttendanceCubit get(BuildContext context) =>
      BlocProvider.of<AttendanceCubit>(context);
}
