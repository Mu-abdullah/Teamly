import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../user_custody/data/model/user_custody_model.dart';
import '../../../data/model/user_get_custody_item_model.dart';
import '../../../data/repo/user_get_custody_item_repo.dart';

part 'get_user_custody_items_state.dart';

class GetUserCustodyItemsCubit extends Cubit<GetUserCustodyItemsState> {
  UserGetCustodyItemRepo repo;
  GetUserCustodyItemsCubit(this.repo, {required this.item})
    : super(GetUserCustodyItemsInitial());

  final UserCustodyModel item;

  List<UserGetCustodyItemModel>? items;

  Future<void> getItems(String id) async {
    emit(GetUserCustodyItemsLoading());
    final result = await repo.getUserCustody(id: id);
    result.fold(
      (l) {
        if (!isClosed) {
          emit(GetUserCustodyItemsError(l.message));
        }
      },
      (r) {
        if (!isClosed) {
          items = r;
          emit(GetUserCustodyItemsLoaded(r));
        }
      },
    );
  }

  double sumAllCount(List<UserGetCustodyItemModel> transactions) {
    double sum = 0.0;
    for (var transaction in transactions) {
      sum += double.parse(transaction.count!);
    }
    return sum;
  }

  double sumAllPrice(List<UserGetCustodyItemModel> transactions) {
    double sum = 0.0;
    for (var transaction in transactions) {
      sum +=
          double.parse(transaction.price!) * double.parse(transaction.count!);
    }
    return sum;
  }

  //calc remaining amount
  double calculateRemainingAmount() {
    return double.parse(item.amount!) - sumAllPrice(items ?? []);
  }
}
