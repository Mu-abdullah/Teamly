import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/add_warehouse_item_model.dart';
import '../../../data/repo/add_werehouse_items_repo.dart';

part 'add_to_warehouse_state.dart';

class AddToWarehouseCubit extends Cubit<AddToWarehouseState> {
  final AddWerehouseItemsRepo repo;
  AddToWarehouseCubit(this.repo) : super(AddToWarehouseInitial());

  static AddToWarehouseCubit get(context) => BlocProvider.of(context);

  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var countController = TextEditingController();
  var priceController = TextEditingController();
  var skuController = TextEditingController();
  var categoryController = TextEditingController();
  var unitTypeController = TextEditingController();

  Future<void> addToWarehouse({required AddWarehouseItemModel data}) async {
    emit(AddToWarehouseLoading());
    final result = await repo.insertWarehouse(data: data.toJson());
    result.fold(
      (l) {
        if (!isClosed) {
          emit(AddToWarehouseError(l.message));
        }
      },
      (r) {
        if (!isClosed) {
          emit(AddToWarehouseSuccess(r));
        }
      },
    );
  }
}
