import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../custody_transaction/data/model/update_custody_status_model.dart';
import '../../../../custody_transaction/data/repo/satteled_repo.dart';

part 'settled_custody_state.dart';

class SettledCustodyCubit extends Cubit<SettledCustodyState> {
  SatteledRepo repo;
  SettledCustodyCubit(this.repo,  )
    : super(SettledCustodyInitial());

  static SettledCustodyCubit get(context) => BlocProvider.of(context);
 
  Future<void> updateCustodyStatus({
    required String id,
    required String status,
  }) async {
    emit(SettledCustodyLoading());
    var result = await repo.updateCustodyStatus(status: status, id: id);

    result.fold(
      (l) {
        if (!isClosed) {
          emit(SettledCustodyError(l.message));
        }
      },
      (r) {
        if (!isClosed) {
          emit(SettledCustodySuccess(r));
        }
      },
    );
  }
}
