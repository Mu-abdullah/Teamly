import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teamly/core/extextions/extentions.dart';
import 'package:teamly/core/functions/generate_id.dart';

import '../../../../../core/app/user/app_user_cubit/app_user_cubit.dart';
import '../../../../../core/services/supabase/backend_points.dart';
import '../../data/model/create_custody_trans_item_model.dart';

class CustodyItemsCubit extends Cubit<List<CreateCustodyTransItemModel>> {
  final String id;
  CustodyItemsCubit(BuildContext context, {required this.id})
    : super([
        CreateCustodyTransItemModel(
          id: GenerateId.generateDocumentId(
            context: context,
            tableName: BackendPoint.custodyTransactionItem,
            userId: context.read<AppUserCubit>().empID,
            companyName: context.read<AppUserCubit>().compId,
          ),
          createdAt: DateTime.now().toString(),
          transactionId: id,
          name: '',
          count: '',
          price: '',
        ),
      ]);

  void addItem(BuildContext context) {
    emit([
      ...state,
      CreateCustodyTransItemModel(
        id: GenerateId.generateDocumentId(
          context: context,
          tableName: BackendPoint.custodyTransactionItem,
          userId: context.read<AppUserCubit>().empID,
          companyName: context.read<AppUserCubit>().compId,
        ),
        createdAt: DateTime.now().toString(),
        transactionId: id,
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

  List<Map<String, dynamic>> getNonEmptyItems() {
    return state
        .where(
          (item) =>
              item.name!.isNotEmpty ||
              double.parse(item.count!) > 0 ||
              double.parse(item.price!) > 0,
        )
        .map((item) => item.toJson())
        .toList();
  }

  // calc total price
  double getTotalPrice() {
    double totalPrice = 0;
    for (var item in state) {
      totalPrice += double.parse(item.price!) * double.parse(item.count!);
    }
    return totalPrice;
  }
}
