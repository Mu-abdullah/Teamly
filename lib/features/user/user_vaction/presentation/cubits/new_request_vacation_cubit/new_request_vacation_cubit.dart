import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teamly/core/services/status/gender_status.dart';

import '../../../data/model/new_request_vacation_model.dart';
import '../../../data/repo/submit_vacation_request_repo.dart';

part 'new_request_vacation_state.dart';

class NewRequestVacationCubit extends Cubit<NewRequestVacationState> {
  SubmitVacationRequestRepo repo;
  NewRequestVacationCubit({required this.gender, required this.repo})
    : super(RequestVacationInitial());

  String gender;
  String? type;

  static NewRequestVacationCubit get(context) => BlocProvider.of(context);
  var formKey = GlobalKey<FormState>();
  var startDate = TextEditingController();
  var endDate = TextEditingController();
  var reason = TextEditingController();

  void vactionType(String value) {
    type = value;
    debugPrint(type);
    emit(VactionType(value));
  }

  Future<void> submit(NewRequestVacationModel model) async {
    emit(RequestVacationLoading());
    var response = await repo.submitVacationRequest(model: model);
    response.fold(
      (l) {
        if (!isClosed) {
          debugPrint("Error: ${l.message}");
          emit(RequestVacationError(l.message));
        }
      },
      (r) {
        if (!isClosed) {
          emit(RequestVacationSuccess());
        }
      },
    );
  }

  bool isMele() {
    if (gender == GenderStatus.getGender(Gender.male)) {
      return true;
    } else {
      return false;
    }
  }
}
