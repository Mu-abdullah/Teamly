import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repo/get_month_repo.dart';

part 'get_month_state.dart';

class GetMonthCubit extends Cubit<GetMonthState> {
  GetMonthRepo repo;
  GetMonthCubit(this.repo) : super(GetMonthInitial());
  static GetMonthCubit get(context) => BlocProvider.of(context);

  Future<void> getMonth({required String compId}) async {
    emit(GetMonthLoading());
    var result = await repo.getMonth(compId: compId);
    result.fold((l) {
      if (!isClosed) {
        debugPrint("Error: ${l.message}");
        emit(GetMonthError(l.message));
      }
    }, (r) => emit(GetMonthLoaded(r)));
  }
}
