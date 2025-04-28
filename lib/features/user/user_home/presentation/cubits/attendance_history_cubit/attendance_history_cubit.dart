import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/history_attendance_model.dart';
import '../../../data/repo/get_history_repo.dart';

part 'attendance_history_state.dart';

class AttendanceHistoryCubit extends Cubit<AttendanceHistoryState> {
  GetHistoryRepo repo;
  AttendanceHistoryCubit(this.repo) : super(AttendanceHistoryInitial());

  static AttendanceHistoryCubit get(context) => BlocProvider.of(context);

  Future<void> getHistory(uid) async {
    emit(HistoryLoading());
    var result = await repo.getHistory(userId: uid);
    result.fold(
      (l) {
        if (!isClosed) {
          debugPrint("rrrrr : $l");
          emit(HistoryLoadError(l.message));
        }
      },
      (r) {
        if (!isClosed) {
          debugPrint("rrrrr : $r");
          emit(HistoryLoaded(r));
        }
      },
    );
  }
}
