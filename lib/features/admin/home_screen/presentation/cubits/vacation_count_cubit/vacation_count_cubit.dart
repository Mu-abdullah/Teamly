import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/services/status/vactions_typs.dart';
import '../../../data/model/vacation_count.dart';
import '../../../data/repo/vaction_count_repo.dart';

part 'vacation_count_state.dart';

class VacationCountCubit extends Cubit<VacationCountState> {
  VactionCountRepo repo;
  VacationCountCubit(this.repo) : super(VacationCountInitial());

  static VacationCountCubit get(context) => BlocProvider.of(context);

  List<VacationCount> vacations = [];

  Future<void> getVactionCount(String? compID) async {
    emit(VacationCountLoading());
    var empCount = await repo.getVactionCount(compID: compID!);
    empCount.fold(
      (error) {
        if (!isClosed) {
          emit(VacationCountError(error.message));
        }
      },
      (empCount) {
        if (!isClosed) {
          vacations = empCount;
          emit(VacationCountSuccess(empCount));
        }
      },
    );
  }

  List<VacationCount> getVacationsPeding() {
    return vacations
        .where((vacation) => vacation.status == VacationStatus.pending)
        .toList();
  }

  List<VacationCount> getVacationsApproved() {
    return vacations
        .where((vacation) => vacation.status == VacationStatus.approved)
        .toList();
  }

  List<VacationCount> getVacationsRejected() {
    return vacations
        .where((vacation) => vacation.status == VacationStatus.rejected)
        .toList();
  }
}
