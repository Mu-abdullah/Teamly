import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/custody_transaction_model.dart';
import '../../../data/repo/add_custody_transaction_repo.dart';

part 'add_custody_transaction_state.dart';

class AddCustodyTransactionCubit extends Cubit<AddCustodyTransactionState> {
  AddCustodyTransactionRepo repo;
  AddCustodyTransactionCubit(this.repo) : super(AddCustodyTransactionInitial());
  static AddCustodyTransactionCubit get(context) => BlocProvider.of(context);
  String? empId;
  var transactionAmount = TextEditingController();
  var formKey = GlobalKey<FormState>();
  Future<void> addCustody({required CustodyTransactionModel data}) async {
    emit(AddCustodyTransactionLoading());
    var result = await repo.addCustodyTransaction(data: data);
    result.fold(
      (l) {
        if (!isClosed) {
          debugPrint('Error: ${l.message}');
          emit(AddCustodyTransactionError(l.message));
        }
      },
      (r) {
        if (!isClosed) {
          emit(AddCustodyTransactionLoaded());
        }
      },
    );
  }
}
