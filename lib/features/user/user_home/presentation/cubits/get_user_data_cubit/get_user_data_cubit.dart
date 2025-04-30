import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../admin/home_screen/data/model/home_emp_model.dart';
import '../../../../../admin/home_screen/data/repo/home_emp_repo.dart';

part 'get_user_data_state.dart';

class GetUserDataCubit extends Cubit<GetUserDataState> {
  HomeEmpRepo repo;
  GetUserDataCubit(this.repo,{required this.isAdmin}) : super(GetUserDataInitial()) {
    getCompID();
  }

  Future<void> getCompID() async {
    await repo.getCompID();
    await repo.getUserID();

    await getUserData();
  }

  bool isAdmin;
  Future<void> getUserData() async {
    emit(GetUserDataLoading());
    final result = await repo.getEmp(
      comId: await repo.getCompID(),
      userId: await repo.getUserID(),
    );
    result.fold(
      (l) => emit(GetUserDataError(l.message)),
      (r) => emit(GetUserDataLoaded(r.first)),
    );
  }
}
