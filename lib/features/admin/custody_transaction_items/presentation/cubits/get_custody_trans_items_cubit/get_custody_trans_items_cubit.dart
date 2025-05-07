import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/get_custody_trans_item_model.dart';
import '../../../data/repo/get_custody_trans_item_repo.dart';

part 'get_custody_trans_items_state.dart';

class GetCustodyTransItemsCubit extends Cubit<GetCustodyTransItemsState> {
  GetCustodyTransItemRepo repo;
  GetCustodyTransItemsCubit(this.repo, {required this.custodyAmount})
    : super(GetCustodyTransItemsInitial());

  static GetCustodyTransItemsCubit get(context) => BlocProvider.of(context);

  String? custodyAmount;
  List<GetCustodyTransItemModel>? transactions;
  Future<void> getCustodyTransItems({required String transId}) async {
    emit(GetCustodyTransItemsLoading());
    var res = await repo.getCustodyTransItem(transId: transId);
    res.fold(
      (l) {
        if (!isClosed) {
          emit(GetCustodyTransItemsError(l.message));
        }
      },
      (r) {
        if (!isClosed) {
          transactions = r;
          emit(GetCustodyTransItemsLoaded(r));
        }
      },
    );
  }

  // sum amount
  double sumPrice(List<GetCustodyTransItemModel> transactions) {
    double sum = 0.0;
    for (var transaction in transactions) {
      sum += double.parse(transaction.price!);
    }
    return sum;
  }

  // sum count
  double sumCount(List<GetCustodyTransItemModel> transactions) {
    double sum = 0.0;
    for (var transaction in transactions) {
      sum += double.parse(transaction.count!);
    }
    return sum;
  }

  // calc all price * counts
  double sumAllPrice(List<GetCustodyTransItemModel> transactions) {
    double sum = 0.0;
    for (var transaction in transactions) {
      sum +=
          double.parse(transaction.price!) * double.parse(transaction.count!);
    }
    return sum;
  }

  //calc remaining amount
  double calculateRemainingAmount() {
    return double.parse(custodyAmount!) - sumAllPrice(transactions ?? []);
  }
}
