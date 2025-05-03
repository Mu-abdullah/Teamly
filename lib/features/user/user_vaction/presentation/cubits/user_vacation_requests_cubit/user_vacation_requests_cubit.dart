import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/user_requests_vacations.dart';
import '../../../data/repo/get_user_vacations_requests_repo.dart';

part 'user_vacation_requests_state.dart';

class UserVacationRequestsCubit extends Cubit<UserVacationRequestsState> {
  GetUserVacationsRequestsRepo repo;
  UserVacationRequestsCubit(this.repo) : super(UservacationRequestsInitial());

  static UserVacationRequestsCubit get(context) => context.read();

  Future<void> getVacationRequests({required String empid}) async {
    emit(UservacationRequestsLoading());
    final result = await repo.getUserVacationsRequests(empid: empid);
    result.fold(
      (l) => emit(UservacationRequestsErrorState(l.message)),
      (r) => emit(UservacationRequestsLoadedState(r)),
    );
  }
}
