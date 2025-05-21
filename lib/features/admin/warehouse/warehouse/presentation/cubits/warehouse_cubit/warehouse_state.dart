part of 'warehouse_cubit.dart';

sealed class WarehouseState extends Equatable {
  const WarehouseState();

  @override
  List<Object> get props => [];
}

final class WarehouseInitial extends WarehouseState {}

final class WarehouseLoading extends WarehouseState {}

final class WarehouseLoaded extends WarehouseState {
  final List<GetWarehouseModel> items;
  const WarehouseLoaded(this.items);
  @override
  List<Object> get props => [items];
}

final class WarehouseError extends WarehouseState {
  final String message;
  const WarehouseError(this.message);
}
