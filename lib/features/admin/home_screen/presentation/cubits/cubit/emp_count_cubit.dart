import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teamly/core/services/status/job_status.dart';

import '../../../../../auth/data/models/emp_model.dart';
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
  EmpModel? empModel;

  Future<void> getEmpCount() async {
    emit(EmpCountLoading());
    var empCount = await repo.getEmpCount(comId: empModel!.comId!);
    empCount.fold((error) => emit(EmpCountError(error.message)), (empCount) {
      if (!isClosed) {
        emp = empCount;
        emit(EmpCountSuccess(empCount));
      }
    });
  }

  getCompID() async {
    var emp = await repo.getCompID();
    empModel = emp;
    await getEmpCount();
    return empModel;
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
