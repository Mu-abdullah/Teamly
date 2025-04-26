part of 'emp_count_cubit.dart';

sealed class EmpCountState extends Equatable {
  const EmpCountState();

  @override
  List<Object> get props => [];
}

final class EmpCountInitial extends EmpCountState {}

final class EmpCountLoading extends EmpCountState {}

final class EmpCountSuccess extends EmpCountState {
  final List<EmpCountModel> empCount;

  const EmpCountSuccess(this.empCount);

  @override
  List<Object> get props => [empCount];
}

final class EmpCountError extends EmpCountState {
  final String error;

  const EmpCountError(this.error);

  @override
  List<Object> get props => [error];
}
