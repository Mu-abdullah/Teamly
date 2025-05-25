import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/warehouse_emp_model.dart';
import '../../../data/repo/get_warehouse_emp_repo.dart';

part 'get_emps_state.dart';

class GetEmpsCubit extends Cubit<GetEmpsState> {
  GetWarehouseEmpRepo repo;
  GetEmpsCubit(this.repo) : super(GetEmpsInitial());

  static GetEmpsCubit get(context) => BlocProvider.of(context);

  Future<void> getEmp({required String compId}) async {
    emit(GetEmpsLoading());
    var result = await repo.getEmpForWarehouseTransaction(compId: compId);
    result.fold(
      (l) {
        if (!isClosed) {
          emit(GetEmpsError(l.message));
        }
      },
      (r) {
        if (!isClosed) {
          emit(GetEmpsLoaded(r));
        }
      },
    );
  }
}
