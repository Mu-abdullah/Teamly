part of 'home_emp_cubit.dart';

sealed class HomeEmpState extends Equatable {
  const HomeEmpState();

  @override
  List<Object> get props => [];
}

final class HomeEmpInitial extends HomeEmpState {}

final class EmpLoading extends HomeEmpState {}

final class EmpSuccess extends HomeEmpState {
  final List<HomeEmpModel> empList;

  const EmpSuccess(this.empList);

  @override
  List<Object> get props => [empList];
}

final class EmpError extends HomeEmpState {
  final String error;

  const EmpError(this.error);

  @override
  List<Object> get props => [error];
}
