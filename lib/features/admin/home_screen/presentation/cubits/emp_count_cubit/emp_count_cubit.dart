import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/services/status/job_status.dart';
import '../../../data/model/emp_count_model.dart';
import '../../../data/repo/emp_count_repo.dart';

part 'emp_count_state.dart';

class EmpCountCubit extends Cubit<EmpCountState> {
  EmpCountRepo repo;
  EmpCountCubit(this.repo) : super(EmpCountInitial()) {
    getCompID();
  }

  static EmpCountCubit get(context) => BlocProvider.of(context);

  List<EmpCountModel> emp = [];
  Future<void> getCompID() async {
    var emp = await repo.getCompID();

    await getEmpCount(emp);
  }

  Future<void> getEmpCount(String? comId) async {
    emit(EmpCountLoading());
    var empCount = await repo.getEmpCount(comId: comId!);
    empCount.fold(
      (error) {
        if (!isClosed) {
          emit(EmpCountError(error.message));
        }
      },
      (empCount) {
        if (!isClosed) {
          emp = empCount;
          emit(EmpCountSuccess(empCount));
        }
      },
    );
  }

  List<EmpCountModel> getOnWork() {
    return emp
        .where((employee) => employee.jobStatus == JobStatus.onWork)
        .toList();
  }

  List<EmpCountModel> getResigned() {
    return emp
        .where((employee) => employee.jobStatus == JobStatus.resigned)
        .toList();
  }

  List<EmpCountModel> getTerminated() {
    return emp
        .where((employee) => employee.jobStatus == JobStatus.terminated)
        .toList();
  }
}
