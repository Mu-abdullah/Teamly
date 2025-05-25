import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../warehouse/data/model/get_werehouse_model.dart';
import '../../../data/model/warehouse_transaction_model.dart';
import '../../../data/repo/get_warehouse_trans_item_repo.dart';

part 'warehouse_transaction_state.dart';

class WarehouseTransactionCubit extends Cubit<WarehouseTransactionState> {
  final GetWarehouseModel model;
  GetWarehouseTransItemRepo repo;
  WarehouseTransactionCubit({required this.model, required this.repo})
    : super(WarehouseTransactionInitial());

  static WarehouseTransactionCubit get(context) => BlocProvider.of(context);
  List<WarehouseTransactionModel> results = [];
  Future<void> getTransItems({required String warehouse}) async {
    emit(WarehouseTransactionLoading());
    var result = await repo.getTransItems(warehouse: warehouse);
    result.fold(
      (l) {
        if (!isClosed) {
          emit(WarehouseTransactionError(l.message));
        }
      },
      (r) {
        if (r.isEmpty) {
          emit(WarehouseTransactionEmpty());
        } else {
          results = r;
          emit(WarehouseTransactionSuccess(r));
        }
      },
    );
  }

  // remaining quantity
  double sumAmount(List<WarehouseTransactionModel> transactions) {
    double sum = 0.0;
    for (var transaction in transactions) {
      sum += double.parse(transaction.quantity!);
    }
    return sum;
  }

  double calculateRemainingAmount() {
    return double.parse(model.quantity!) - sumAmount(results);
  }
}
