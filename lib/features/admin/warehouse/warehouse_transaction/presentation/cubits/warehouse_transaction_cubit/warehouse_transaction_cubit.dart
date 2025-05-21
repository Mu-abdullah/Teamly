import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../warehouse/data/model/get_werehouse_model.dart';

part 'warehouse_transaction_state.dart';

class WarehouseTransactionCubit extends Cubit<WarehouseTransactionState> {
  final GetWarehouseModel model;
  WarehouseTransactionCubit({required this.model})
    : super(WarehouseTransactionInitial());

  static WarehouseTransactionCubit get(context) => BlocProvider.of(context);
}
