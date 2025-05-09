import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/user_custody_model.dart';
import '../../../data/repo/get_user_custody_repo.dart';

part 'user_custody_state.dart';

class UserCustodyCubit extends Cubit<UserCustodyState> {
  GetUserCustodyRepo repo;
  UserCustodyCubit(this.repo) : super(UserCustodyInitial());

  static UserCustodyCubit get(context) => BlocProvider.of(context);

  Future<void> getUserCustody({required String uid}) async {
    emit(UserCustodyLoading());
    var result = await repo.getUserCustody(uid: uid);
    result.fold(
      (l) {
        if (!isClosed) {
          emit(UserCustodyError(l.message));
        }
      },
      (r) {
        if (!isClosed) {
          emit(UserCustodyLoaded(r));
        }
      },
    );
  }
}
