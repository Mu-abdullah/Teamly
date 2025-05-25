part of 'get_emps_cubit.dart';

sealed class GetEmpsState extends Equatable {
  const GetEmpsState();

  @override
  List<Object> get props => [];
}

final class GetEmpsInitial extends GetEmpsState {}

final class GetEmpsLoading extends GetEmpsState {}

final class GetEmpsLoaded extends GetEmpsState {
  final List<WarehouseEmpModel> empList;

  const GetEmpsLoaded(this.empList);

  @override
  List<Object> get props => [empList];
}

final class GetEmpsError extends GetEmpsState {
  final String error;

  const GetEmpsError(this.error);

  @override
  List<Object> get props => [error];
}
