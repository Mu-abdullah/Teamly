import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/custody_emp_model.dart';
import '../../../data/repo/emp_custody_transaction_repo.dart';

part 'emp_custody_transaction_state.dart';

class EmpCustodyTransactionCubit extends Cubit<EmpCustodyTransactionState> {
  EmpCustodyTransactionRepo repo;
  EmpCustodyTransactionCubit(this.repo) : super(AddCustodyTransactionInitial());

  static EmpCustodyTransactionCubit get(context) => BlocProvider.of(context);
  List<CustodyEmpModel>? empList;
  Future<void> getEmp({required String compId}) async {
    emit(GetEmpLoading());
    var result = await repo.getEmpForCustody(compId: compId);
    result.fold(
      (l) {
        if (!isClosed) {
          emit(GetEmpError(l.message));
        }
      },
      (r) {
        if (!isClosed) {
          empList = r;
          emit(GetEmpLoaded(r));
        }
      },
    );
  }
}
