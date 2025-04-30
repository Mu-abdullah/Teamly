part of 'emp_info_cubit.dart';

sealed class EmpInfoState extends Equatable {
  const EmpInfoState();

  @override
  List<Object> get props => [];
}

final class EmpInfoInitial extends EmpInfoState {}

final class EmpInfoLoading extends EmpInfoState {}

final class EmpInfoLoaded extends EmpInfoState {
  final EmpModel empInfo;
  const EmpInfoLoaded(this.empInfo);
}

final class EmpInfoError extends EmpInfoState {
  final String message;
  const EmpInfoError(this.message);
}
