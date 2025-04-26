import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/custody_model.dart';
import '../../../data/repo/add_custody.dart';
import '../get_custody_cubit/get_custody_cubit.dart';

part 'add_custody_state.dart';

class AddCustodyCubit extends Cubit<AddCustodyState> {
  final AddCustodyRepo repo;
  AddCustodyCubit(this.repo) : super(AddCustodyInitial());
  static AddCustodyCubit get(context) => BlocProvider.of(context);
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var amountController = TextEditingController();

  Future<void> insertCustody({
    required CustodyModel data,
    required BuildContext context,
    required String compId,
  }) async {
    emit(AddCustodyLoadingState());
    var res = await repo.insertCustody(data: data.toJson());
    res.fold(
      (l) {
        if (!isClosed) {
          emit(AddCustodyErrorState(l.message));
          debugPrint("Error: ${l.message}");
        }
      },
      (r) {
        if (!isClosed) {
          emit(AddCustodySuccessState());
          GetCustodyCubit.get(context).fetchCustody(compId);
        }
      },
    );
  }
}
