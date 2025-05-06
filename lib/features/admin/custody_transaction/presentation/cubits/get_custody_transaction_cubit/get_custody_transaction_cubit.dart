import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/error/custom_errors.dart';
import '../../../data/model/custody_transaction_model.dart';
import '../../../data/repo/get_custody_transaction.dart';

part 'get_custody_transaction_state.dart';

class GetCustodyTransactionCubit extends Cubit<GetCustodyTransactionState> {
  GetCustodyTransactionRepo repo;

  GetCustodyTransactionCubit({
    required this.repo,
    required this.custody,
    required this.totlaCustody,
  }) : super(GetCustodyTransactionInitial());

  final String custody;
  final String totlaCustody;
  List<CustodyTransactionModel>? custodyTransaction;
  static GetCustodyTransactionCubit get(context) =>
      BlocProvider.of<GetCustodyTransactionCubit>(context);

  Future<void> fetchCustodyTransaction(String custodyId) async {
    emit(GetCustodyTransactionLoading());
    final result = await repo.getCustodyTransaction(custodyId: custodyId);
    result.fold(
      (l) {
        emit(GetCustodyTransactionError(l));
        debugPrint('Error: ${l.message}');
      },
      (r) {
        custodyTransaction = r;
        emit(GetCustodyTransactionLoaded(r));
        debugPrint('Data: ${r.length}');
      },
    );
  }

  // sum all amoute in double
  double sumAmount(List<CustodyTransactionModel> transactions) {
    double sum = 0.0;
    for (var transaction in transactions) {
      sum += double.parse(transaction.amount!);
    }
    return sum;
  }

  double calculateRemainingAmount() {
    return double.parse(totlaCustody) - sumAmount(custodyTransaction ?? []);
  }
}
