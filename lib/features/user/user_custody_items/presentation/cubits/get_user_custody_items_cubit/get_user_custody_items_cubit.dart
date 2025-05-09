import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/user_get_custody_item_model.dart';
import '../../../data/repo/user_get_custody_item_repo.dart';

part 'get_user_custody_items_state.dart';

class GetUserCustodyItemsCubit extends Cubit<GetUserCustodyItemsState> {
  UserGetCustodyItemRepo repo;
  GetUserCustodyItemsCubit(this.repo) : super(GetUserCustodyItemsInitial());

  Future<void> getItems(String id) async {
    emit(GetUserCustodyItemsLoading());
    final result = await repo.getUserCustody(id: id);
    result.fold(
      (l) {
        if (!isClosed) {
          emit(GetUserCustodyItemsError(l.message));
        }
      },
      (r) {
        if (!isClosed) {
          emit(GetUserCustodyItemsLoaded(r));
        }
      },
    );
  }
}
