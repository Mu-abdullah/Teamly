import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/check_user_custody_model.dart';
import '../../../data/repo/check_user_custody_repo.dart';

part 'check_user_custody_state.dart';

class CheckUserCustodyCubit extends Cubit<CheckUserCustodyState> {
  ChechUserCustodyRepo repo;
  CheckUserCustodyCubit(this.repo) : super(CheckUserCustodyInitial());
  static CheckUserCustodyCubit get(context) => BlocProvider.of(context);
  Future<void> checkUserCustody({required String userId}) async {
    emit(CheckUserCustodyLoading());
    final result = await repo.checkUserCustody(userId: userId);
    result.fold(
      (l) {
        if (!isClosed) {
          emit(CheckUserCustodyError(l.message));
        }
      },
      (r) {
        if (!isClosed) {
          emit(CheckUserCustodyLoaded(r));
        }
      },
    );
  }
}
