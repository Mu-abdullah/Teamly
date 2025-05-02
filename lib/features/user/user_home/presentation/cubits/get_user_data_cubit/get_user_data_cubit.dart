import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/services/shared_pref/pref_keys.dart';
import '../../../data/model/user_home_model.dart';
import '../../../data/repo/user_home_card_info_repo.dart';

part 'get_user_data_state.dart';

class GetUserDataCubit extends Cubit<GetUserDataState> {
  UserHomeCardInfoRepo repo;
  GetUserDataCubit(this.repo, {required this.isAdmin})
    : super(GetUserDataInitial()) {
    getCompID();
  }
  UserHomeModel? user;
  Future<void> getCompID() async {
    await repo.getID(key: PrefKeys.userID);
    await getUserData();
  }

  bool isAdmin;
  Future<void> getUserData() async {
    emit(GetUserDataLoading());
    final result = await repo.getEmp(
      userId: await repo.getID(key: PrefKeys.userID),
    );
    result.fold(
      (l) {
        if (!isClosed) {
          emit(GetUserDataError(l.message));
        }
      },
      (r) {
        if (!isClosed) {
          user = r.first;
          emit(GetUserDataLoaded(r.first));
        }
      },
    );
  }
}
