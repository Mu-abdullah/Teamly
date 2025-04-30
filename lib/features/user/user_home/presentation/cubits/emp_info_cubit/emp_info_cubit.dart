import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../auth/data/models/emp_model.dart';
import '../../../data/repo/emp_info_repo.dart';

part 'emp_info_state.dart';

class EmpInfoCubit extends Cubit<EmpInfoState> {
  EmpInfoRepo repo;
  EmpInfoCubit(this.repo) : super(EmpInfoInitial());

  Future<void> getEmpInfo({required String uid}) async {
    emit(EmpInfoLoading());
    final result = await repo.getEmpInfo(uid: uid);
    result.fold(
      (l) => emit(EmpInfoError(l.message)),
      (r) => emit(EmpInfoLoaded(r.first)),
    );
  }
}
