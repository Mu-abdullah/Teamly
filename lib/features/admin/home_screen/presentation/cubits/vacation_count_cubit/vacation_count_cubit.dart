import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/vacation_count.dart';
import '../../../data/repo/vaction_count_repo.dart';

part 'vacation_count_state.dart';

class VacationCountCubit extends Cubit<VacationCountState> {
  VactionCountRepo repo;
  VacationCountCubit(this.repo) : super(VacationCountInitial());

  Future<void> getVactionCount(String? compID) async {
    emit(VacationCountLoading());
    var empCount = await repo.getVactionCount(compID: compID!);
    empCount.fold((error) => emit(VacationCountError(error.message)), (
      empCount,
    ) {
      if (!isClosed) {
        emit(VacationCountSuccess(empCount));
      }
    });
  }
}
