import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/exist_item_model.dart';
import '../../../data/repo/exist_item_repo.dart';

part 'exit_quantity_state.dart';

class ExitQuantityCubit extends Cubit<ExitQuantityState> {
  ExistItemRepo repo;
  ExitQuantityCubit(this.repo) : super(ExitQuantityInitial());

  static ExitQuantityCubit get(context) => BlocProvider.of(context);

  String? uid;
  var formKey = GlobalKey<FormState>();
  var quantity = TextEditingController();

  Future<void> exitQuantity({required Map<String, dynamic> data, id}) async {
    emit(ExitQuantityLoading());
    var result = await repo.exsistItem(data: data);
    result.fold(
      (l) {
        if (!isClosed) {
          emit(ExitQuantityError(l.message));
        }
      },
      (r) async {
        if (!isClosed) {
          emit(ExitQuantityLoaded(r));
        }
      },
    );
  }

 
}
