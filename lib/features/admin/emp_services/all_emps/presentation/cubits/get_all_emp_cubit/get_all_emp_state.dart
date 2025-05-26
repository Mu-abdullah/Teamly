part of 'get_all_emp_cubit.dart';

sealed class GetAllEmpState extends Equatable {
  const GetAllEmpState();

  @override
  List<Object> get props => [];
}

final class GetAllEmpInitial extends GetAllEmpState {}

final class GetAllEmpLoading extends GetAllEmpState {}
final class GetAllEmpSuccess extends GetAllEmpState {
  final List<AllEmpModel> empList;

  const GetAllEmpSuccess(this.empList);

  @override
  List<Object> get props => [empList];
}
final class GetAllEmpError extends GetAllEmpState {
  final String error;

  const GetAllEmpError(this.error);

  @override
  List<Object> get props => [error];
}