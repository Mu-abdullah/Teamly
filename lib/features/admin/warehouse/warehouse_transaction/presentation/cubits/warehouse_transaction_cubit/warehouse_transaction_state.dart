part of 'warehouse_transaction_cubit.dart';

sealed class WarehouseTransactionState extends Equatable {
  const WarehouseTransactionState();

  @override
  List<Object> get props => [];
}

final class WarehouseTransactionInitial extends WarehouseTransactionState {}
