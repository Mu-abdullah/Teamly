part of 'warehouse_transaction_cubit.dart';

sealed class WarehouseTransactionState extends Equatable {
  const WarehouseTransactionState();

  @override
  List<Object> get props => [];
}

final class WarehouseTransactionInitial extends WarehouseTransactionState {}

final class WarehouseTransactionLoading extends WarehouseTransactionState {}
final class WarehouseTransactionSuccess extends WarehouseTransactionState {
  final List<WarehouseTransactionModel> transItems;

  const WarehouseTransactionSuccess(this.transItems);

  @override
  List<Object> get props => [transItems];
}
final class WarehouseTransactionError extends WarehouseTransactionState {
  final String error;

  const WarehouseTransactionError(this.error);

  @override
  List<Object> get props => [error];
}
final class WarehouseTransactionEmpty extends WarehouseTransactionState {}