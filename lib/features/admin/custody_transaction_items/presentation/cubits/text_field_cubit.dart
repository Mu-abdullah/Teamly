import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teamly/core/extextions/extentions.dart';

import '../../data/model/create_custody_trans_item_model.dart';

class CustodyItemsCubit extends Cubit<List<CreateCustodyTransItemModel>> {
  CustodyItemsCubit()
    : super([
        CreateCustodyTransItemModel(
          id: '',
          createdAt: DateTime.now().toIso8601String(),
          transactionId: '',
          name: '',
          count: '',
          price: '',
        ),
      ]);

  void addItem() {
    emit([
      ...state,
      CreateCustodyTransItemModel(
        id: '',
        createdAt: DateTime.now().toIso8601String(),
        transactionId: '',
        name: '',
        count: '',
        price: '',
      ),
    ]);
  }

  void updateItem(int index, {String? name, String? count, String? price}) {
    final updatedList = List<CreateCustodyTransItemModel>.from(state);
    updatedList[index] = CreateCustodyTransItemModel(
      id: updatedList[index].id,
      createdAt: updatedList[index].createdAt,
      transactionId: updatedList[index].transactionId,
      name: name ?? updatedList[index].name,
      count: count ?? updatedList[index].count,
      price: price ?? updatedList[index].price,
    );
    emit(updatedList);
  }

  void removeItem(BuildContext context, int index) {
    final updatedList = List<CreateCustodyTransItemModel>.from(state);
    updatedList.removeAt(index);
    if (updatedList.isEmpty) {
      context.pop();
    }
    emit(updatedList);
  }

  // List<Map<String, dynamic>> getNonEmptyItems() {
  //   return state
  //       .where(
  //         (item) =>
  //             item.name!.isNotEmpty ||
  //             double.parse(item.count!) > 0 ||
  //             double.parse(item.price!) > 0,
  //       )
  //       .map((item) => item.toJson())
  //       .toList();
  // }
}
