import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/entities/custody_entity.dart';
import '../../../../../../core/error/custom_errors.dart';
import '../../../data/repo/get_custody.dart';

part 'get_custody_state.dart';

class GetCustodyCubit extends Cubit<GetCustodyState> {
  final GetCustodyRepo custodyRepo;
  GetCustodyCubit(this.custodyRepo) : super(GetCustodyInitial());

  static GetCustodyCubit get(context) => BlocProvider.of(context);
  Future<void> fetchCustody() async {
    emit(CustodyLoading());

    final result = await custodyRepo.getCustody();

    result.fold((error) {
      emit(CustodyError(error));
      debugPrint(error.toString());
    }, (transactions) => emit(CustodyLoaded(transactions)));
  }
}
