import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/vacation_response_model.dart';
import '../../../data/repo/response_vacation_repo.dart';

part 'vacation_response_state.dart';

class VacationResponseCubit extends Cubit<VacationResponseState> {
  ResponseVacationRepo repo;
  VacationResponseCubit(this.repo) : super(VacationResponseInitial());
  static VacationResponseCubit get(context) => BlocProvider.of(context);


TextEditingController? rejectReson  ;
  Future<void> sendVacationResponse({
    required String id,
    String? rejectReason,
    required String status,
  }) async {
    emit(VacationResponseLoading());
    var result = await repo.responseVacationRequest(
      id: id,
      rejectReason: rejectReason,
      status: status,
    );
    result.fold(
      (l) => emit(VacationResponseError(l.message)),
      (r) => emit(VacationResponseSuccess(r)),
    );
  }
}
