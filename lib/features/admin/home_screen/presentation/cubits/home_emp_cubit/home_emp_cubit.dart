import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/services/shared_pref/pref_keys.dart';
import '../../../data/model/home_emp_model.dart';
import '../../../data/repo/home_emp_repo.dart';

part 'home_emp_state.dart';

class HomeEmpCubit extends Cubit<HomeEmpState> {
  HomeEmpRepo repo;
  HomeEmpCubit(this.repo) : super(HomeEmpInitial()) {
    getCompID();
  }
  static HomeEmpCubit get(context) => BlocProvider.of(context);
  Future<void> getCompID() async {
    var emp = await repo.getID(key: PrefKeys.companyID);

    await getCount(emp);
  }

  Future<void> getCount(String? comId) async {
    emit(EmpLoading());
    var empCount = await repo.getEmp(comId: comId!);
    empCount.fold(
      (error) {
        if (!isClosed) {
          debugPrint("Error: ${error.message}");
          emit(EmpError(error.message));
        }
      },
      (empCount) {
        if (!isClosed) {
          emit(EmpSuccess(empCount));
        }
      },
    );
  }
}
