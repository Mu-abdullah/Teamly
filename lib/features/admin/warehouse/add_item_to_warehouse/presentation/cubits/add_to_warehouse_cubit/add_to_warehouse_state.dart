part of 'add_to_warehouse_cubit.dart';

sealed class AddToWarehouseState extends Equatable {
  const AddToWarehouseState();

  @override
  List<Object> get props => [];
}

final class AddToWarehouseInitial extends AddToWarehouseState {}

final class AddToWarehouseLoading extends AddToWarehouseState {}

final class AddToWarehouseError extends AddToWarehouseState {
  final String message;
  const AddToWarehouseError(this.message);
 

  @override
  List<Object> get props => [message];
}
final class AddToWarehouseSuccess extends AddToWarehouseState {
  final AddWarehouseItemModel model;
  const AddToWarehouseSuccess(this.model);

  @override
  List<Object> get props => [model];
}