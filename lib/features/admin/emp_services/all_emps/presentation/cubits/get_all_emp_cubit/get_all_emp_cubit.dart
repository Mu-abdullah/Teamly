import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/all_emp_model.dart';
import '../../../data/repo/get_all_emp_repo.dart';

part 'get_all_emp_state.dart';

class GetAllEmpCubit extends Cubit<GetAllEmpState> {
  GetAllEmpRepo repo;
  static GetAllEmpCubit get(context) => BlocProvider.of(context);
  GetAllEmpCubit(this.repo) : super(GetAllEmpInitial());

  Future<void> getAllEmp(String status) async {
    emit(GetAllEmpLoading());
    var result = await repo.getAllEmps(status);
    result.fold(
      (error) {
        if (!isClosed) {
          emit(GetAllEmpError(error.message));
        }
      },
      (emps) {
        if (!isClosed) {
          emit(GetAllEmpSuccess(emps));
        }
      },
    );
  }
}
