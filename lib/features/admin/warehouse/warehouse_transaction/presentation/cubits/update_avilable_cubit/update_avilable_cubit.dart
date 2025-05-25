import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repo/update_avilable_repo.dart';

part 'update_avilable_state.dart';

class UpdateAvilableCubit extends Cubit<UpdateAvilableState> {
  UpdateAvilableRepo repo;
  UpdateAvilableCubit(this.repo) : super(UpdateAvilableInitial());

  static UpdateAvilableCubit get(context) => BlocProvider.of(context);
  Future<void> updateItem(id) async {
    emit(UpdateItemLoading());
    var result = await repo.updateItem(id: id);
    result.fold(
      (l) {
        if (!isClosed) {
          emit(UpdateItemError(l.message));
        }
      },
      (r) {
        if (!isClosed) {
          emit(UpdateItemLoaded(r));
        }
      },
    );
  }
}
