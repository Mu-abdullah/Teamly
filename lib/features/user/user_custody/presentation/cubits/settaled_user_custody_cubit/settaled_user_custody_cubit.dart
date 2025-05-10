import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/satteld_user_custody_model.dart';
import '../../../data/repo/satteld_user_custody_repo.dart';

part 'settaled_user_custody_state.dart';

class SettaledUserCustodyCubit extends Cubit<SettaledUserCustodyState> {
  SatteldUserCustodyRepo repo;
  SettaledUserCustodyCubit(this.repo) : super(SettaledUserCustodyInitial());

  static SettaledUserCustodyCubit get(context) => BlocProvider.of(context);

  Future<void> updateCustodyStatus({
    required String status,
    required String id,
  }) async {
    emit(SettaledUserCustodyLoading());
    final result = await repo.updateCustodyStatus(status: status, id: id);
    result.fold(
      (l) => emit(SettaledUserCustodyError(l.message)),
      (r) => emit(SettaledUserCustodySuccess(r)),
    );
  }
}
